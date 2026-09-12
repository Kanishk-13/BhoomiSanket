"""Initial migration

Revision ID: edbdcc57fcfb
Revises: 
Create Date: 2026-09-12 06:24:24.963841

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql
import geoalchemy2

# revision identifiers, used by Alembic.
revision: str = 'edbdcc57fcfb'
down_revision: Union[str, Sequence[str], None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Upgrade schema."""
    # Users table
    op.create_table(
        'users',
        sa.Column('id', sa.UUID(), nullable=False),
        sa.Column('email', sa.String(length=255), nullable=False),
        sa.Column('display_name', sa.String(length=100), nullable=False),
        sa.Column('role', sa.String(length=20), nullable=False),
        sa.Column('password_hash', sa.String(length=255), nullable=False),
        sa.Column('is_active', sa.Boolean(), nullable=False, default=True),
        sa.Column('created_at', postgresql.TIMESTAMP(timezone=True), server_default=sa.text('now()'), nullable=False),
        sa.Column('updated_at', postgresql.TIMESTAMP(timezone=True), server_default=sa.text('now()'), onupdate=sa.text('now()'), nullable=False),
        sa.PrimaryKeyConstraint('id'),
        sa.UniqueConstraint('email')
    )
    op.create_index('ix_users_email', 'users', ['email'], unique=False)
    op.create_index('ix_users_role', 'users', ['role'], unique=False)

    # Refresh tokens table
    op.create_table(
        'refresh_tokens',
        sa.Column('id', sa.UUID(), nullable=False),
        sa.Column('user_id', sa.UUID(), nullable=False),
        sa.Column('token_hash', sa.String(length=255), nullable=False),
        sa.Column('expires_at', postgresql.TIMESTAMP(timezone=True), nullable=False),
        sa.Column('revoked', sa.Boolean(), nullable=False, default=False),
        sa.Column('created_at', postgresql.TIMESTAMP(timezone=True), server_default=sa.text('now()'), nullable=False),
        sa.ForeignKeyConstraint(['user_id'], ['users.id'], ondelete='CASCADE'),
        sa.PrimaryKeyConstraint('id'),
        sa.UniqueConstraint('token_hash')
    )

    # Projects table
    op.create_table(
        'projects',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('name', sa.String(length=200), nullable=False),
        sa.Column('project_type', sa.String(length=50), nullable=False),
        sa.Column('state', sa.String(length=100), nullable=False),
        sa.Column('district', sa.String(length=100), nullable=False),
        sa.Column('location', geoalchemy2.types.Geography(geometry_type='POINT', srid=4326), nullable=True),
        sa.Column('latitude', sa.Numeric(precision=9, scale=6), nullable=True),
        sa.Column('longitude', sa.Numeric(precision=9, scale=6), nullable=True),
        sa.Column('land_area_ha', sa.Numeric(precision=10, scale=2), nullable=True),
        sa.Column('affected_families', sa.Integer(), nullable=True),
        sa.Column('start_date', sa.Date(), nullable=False),
        sa.Column('target_end_date', sa.Date(), nullable=False),
        sa.Column('current_stage', sa.String(length=50), nullable=False),
        sa.Column('status', sa.String(length=20), nullable=False),
        sa.Column('data_source', sa.String(length=50), nullable=False, server_default='SYNTHETIC_DEMO'),
        sa.Column('created_at', postgresql.TIMESTAMP(timezone=True), server_default=sa.text('now()'), nullable=False),
        sa.Column('updated_at', postgresql.TIMESTAMP(timezone=True), server_default=sa.text('now()'), onupdate=sa.text('now()'), nullable=False),
        sa.PrimaryKeyConstraint('id')
    )
    op.create_index('ix_projects_state_district', 'projects', ['state', 'district'], unique=False)
    op.create_index('ix_projects_current_stage', 'projects', ['current_stage'], unique=False)
    op.create_index('ix_projects_status', 'projects', ['status'], unique=False)
    op.create_index('ix_projects_risk_category', 'projects', ['current_stage', 'status'], unique=False)
    op.create_index('idx_projects_location', 'projects', ['location'], unique=False, postgresql_using='gist')

    # Project stages table
    op.create_table(
        'project_stages',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('project_id', sa.Integer(), nullable=False),
        sa.Column('stage_name', sa.String(length=50), nullable=False),
        sa.Column('sequence_no', sa.Integer(), nullable=False),
        sa.Column('planned_start', sa.Date(), nullable=True),
        sa.Column('planned_end', sa.Date(), nullable=True),
        sa.Column('actual_start', sa.Date(), nullable=True),
        sa.Column('actual_end', sa.Date(), nullable=True),
        sa.Column('status', sa.String(length=20), nullable=False, server_default='pending'),
        sa.ForeignKeyConstraint(['project_id'], ['projects.id'], ondelete='CASCADE'),
        sa.PrimaryKeyConstraint('id')
    )

    # Project data snapshots table
    op.create_table(
        'project_data_snapshots',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('project_id', sa.Integer(), nullable=False),
        sa.Column('snapshot_date', sa.Date(), server_default=sa.text('current_date'), nullable=False),
        sa.Column('days_in_current_stage', sa.Integer(), nullable=True),
        sa.Column('stage_overdue_days', sa.Integer(), nullable=True),
        sa.Column('pct_stages_completed', sa.Numeric(precision=5, scale=4), nullable=True),
        sa.Column('compensation_paid_pct', sa.Numeric(precision=5, scale=4), nullable=True),
        sa.Column('avg_compensation_pending_days', sa.Integer(), nullable=True),
        sa.Column('num_disputed_claims', sa.Integer(), nullable=False, server_default='0'),
        sa.Column('legal_dispute_flag', sa.Boolean(), nullable=False, server_default='false'),
        sa.Column('num_active_legal_cases', sa.Integer(), nullable=False, server_default='0'),
        sa.Column('has_court_stay', sa.Boolean(), nullable=False, server_default='false'),
        sa.Column('doc_complete_pct', sa.Numeric(precision=5, scale=4), nullable=True),
        sa.Column('approval_pending_days', sa.Integer(), nullable=True),
        sa.Column('num_approvals_pending', sa.Integer(), nullable=False, server_default='0'),
        sa.Column('sia_approved', sa.Boolean(), nullable=False, server_default='false'),
        sa.Column('env_clearance_obtained', sa.Boolean(), nullable=False, server_default='false'),
        sa.Column('rehab_progress_pct', sa.Numeric(precision=5, scale=4), nullable=True),
        sa.Column('stakeholder_response_days', sa.Integer(), nullable=True),
        sa.Column('notification_delay_days', sa.Integer(), nullable=True),
        sa.Column('possession_completion_pct', sa.Numeric(precision=5, scale=4), nullable=True),
        sa.Column('district_historical_delay_rate', sa.Numeric(precision=5, scale=4), nullable=True),
        sa.Column('created_at', postgresql.TIMESTAMP(timezone=True), server_default=sa.text('now()'), nullable=False),
        sa.ForeignKeyConstraint(['project_id'], ['projects.id'], ondelete='CASCADE'),
        sa.PrimaryKeyConstraint('id')
    )
    op.create_index('ix_snapshots_project_date', 'project_data_snapshots', ['project_id', 'snapshot_date'], unique=False)

    # Risk predictions table
    op.create_table(
        'risk_predictions',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('project_id', sa.Integer(), nullable=False),
        sa.Column('snapshot_id', sa.Integer(), nullable=False),
        sa.Column('requested_at', postgresql.TIMESTAMP(timezone=True), nullable=False),
        sa.Column('responded_at', postgresql.TIMESTAMP(timezone=True), nullable=True),
        sa.Column('model_version', sa.String(length=20), nullable=True),
        sa.Column('is_mock', sa.Boolean(), nullable=False, server_default='true'),
        sa.Column('delay_probability', sa.Numeric(precision=5, scale=4), nullable=True),
        sa.Column('risk_category', sa.String(length=20), nullable=True),
        sa.Column('stage_predictions', postgresql.JSONB(), nullable=True),
        sa.Column('explanations', postgresql.JSONB(), nullable=True),
        sa.Column('recommendations', postgresql.JSONB(), nullable=True),
        sa.Column('is_stale', sa.Boolean(), nullable=False, server_default='false'),
        sa.Column('stale_since', postgresql.TIMESTAMP(timezone=True), nullable=True),
        sa.Column('status', sa.String(length=20), nullable=False, server_default='success'),
        sa.ForeignKeyConstraint(['project_id'], ['projects.id'], ondelete='CASCADE'),
        sa.ForeignKeyConstraint(['snapshot_id'], ['project_data_snapshots.id']),
        sa.PrimaryKeyConstraint('id')
    )
    op.create_index('ix_predictions_project_requested', 'risk_predictions', ['project_id', 'requested_at'], unique=False)
    op.create_index('ix_predictions_status', 'risk_predictions', ['status'], unique=False)
    op.create_index('ix_predictions_risk_category', 'risk_predictions', ['risk_category'], unique=False)

    # Mitigation logs table
    op.create_table(
        'mitigation_logs',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('project_id', sa.Integer(), nullable=False),
        sa.Column('user_id', sa.UUID(), nullable=False),
        sa.Column('action_taken', sa.Text(), nullable=False),
        sa.Column('notes', sa.Text(), nullable=True),
        sa.Column('logged_at', postgresql.TIMESTAMP(timezone=True), server_default=sa.text('now()'), nullable=False),
        sa.ForeignKeyConstraint(['project_id'], ['projects.id'], ondelete='CASCADE'),
        sa.ForeignKeyConstraint(['user_id'], ['users.id']),
        sa.PrimaryKeyConstraint('id')
    )

    # Alerts table
    op.create_table(
        'alerts',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('project_id', sa.Integer(), nullable=False),
        sa.Column('prediction_id', sa.Integer(), nullable=True),
        sa.Column('alert_type', sa.String(length=50), nullable=False),
        sa.Column('risk_category', sa.String(length=20), nullable=True),
        sa.Column('probability_at_trigger', sa.Numeric(precision=5, scale=4), nullable=True),
        sa.Column('triggered_at', postgresql.TIMESTAMP(timezone=True), server_default=sa.text('now()'), nullable=False),
        sa.Column('acknowledged_by', sa.UUID(), nullable=True),
        sa.Column('acknowledged_at', postgresql.TIMESTAMP(timezone=True), nullable=True),
        sa.ForeignKeyConstraint(['project_id'], ['projects.id'], ondelete='CASCADE'),
        sa.ForeignKeyConstraint(['prediction_id'], ['risk_predictions.id']),
        sa.ForeignKeyConstraint(['acknowledged_by'], ['users.id']),
        sa.PrimaryKeyConstraint('id')
    )
    op.create_index('ix_alerts_project_triggered', 'alerts', ['project_id', 'triggered_at'], unique=False)
    op.create_index('ix_alerts_acknowledged', 'alerts', ['acknowledged_by', 'acknowledged_at'], unique=False)

    # Alert settings table
    op.create_table(
        'alert_settings',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('user_id', sa.UUID(), nullable=False),
        sa.Column('notify_email', sa.Boolean(), nullable=False, server_default='true'),
        sa.Column('notify_inapp', sa.Boolean(), nullable=False, server_default='true'),
        sa.Column('alert_on_critical', sa.Boolean(), nullable=False, server_default='true'),
        sa.Column('alert_on_high', sa.Boolean(), nullable=False, server_default='true'),
        sa.Column('alert_on_medium', sa.Boolean(), nullable=False, server_default='false'),
        sa.Column('alert_on_low', sa.Boolean(), nullable=False, server_default='false'),
        sa.Column('updated_at', postgresql.TIMESTAMP(timezone=True), server_default=sa.text('now()'), onupdate=sa.text('now()'), nullable=False),
        sa.ForeignKeyConstraint(['user_id'], ['users.id'], ondelete='CASCADE'),
        sa.PrimaryKeyConstraint('id'),
        sa.UniqueConstraint('user_id')
    )

    # Notifications table
    op.create_table(
        'notifications',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('user_id', sa.UUID(), nullable=False),
        sa.Column('type', sa.String(length=50), nullable=False),
        sa.Column('title', sa.String(length=200), nullable=False),
        sa.Column('message', sa.Text(), nullable=False),
        sa.Column('related_resource_type', sa.String(length=50), nullable=True),
        sa.Column('related_resource_id', sa.String(length=100), nullable=True),
        sa.Column('is_read', sa.Boolean(), nullable=False, server_default='false'),
        sa.Column('created_at', postgresql.TIMESTAMP(timezone=True), server_default=sa.text('now()'), nullable=False),
        sa.Column('read_at', postgresql.TIMESTAMP(timezone=True), nullable=True),
        sa.ForeignKeyConstraint(['user_id'], ['users.id'], ondelete='CASCADE'),
        sa.PrimaryKeyConstraint('id')
    )
    op.create_index('ix_notifications_user_read', 'notifications', ['user_id', 'is_read'], unique=False)
    op.create_index('ix_notifications_created', 'notifications', ['created_at'], unique=False)

    # System config table
    op.create_table(
        'system_config',
        sa.Column('key', sa.String(length=100), nullable=False),
        sa.Column('value', sa.Text(), nullable=False),
        sa.Column('description', sa.Text(), nullable=True),
        sa.Column('updated_at', postgresql.TIMESTAMP(timezone=True), server_default=sa.text('now()'), onupdate=sa.text('now()'), nullable=False),
        sa.Column('updated_by', sa.UUID(), nullable=True),
        sa.ForeignKeyConstraint(['updated_by'], ['users.id']),
        sa.PrimaryKeyConstraint('key')
    )

    # Audit logs table
    op.create_table(
        'audit_logs',
        sa.Column('id', sa.BigInteger(), autoincrement=True, nullable=False),
        sa.Column('table_name', sa.String(length=100), nullable=False),
        sa.Column('record_id', sa.String(length=100), nullable=False),
        sa.Column('action', sa.String(length=10), nullable=False),
        sa.Column('changed_by', sa.UUID(), nullable=True),
        sa.Column('changed_at', postgresql.TIMESTAMP(timezone=True), server_default=sa.text('now()'), nullable=False),
        sa.Column('old_values', postgresql.JSONB(), nullable=True),
        sa.Column('new_values', postgresql.JSONB(), nullable=True),
        sa.ForeignKeyConstraint(['changed_by'], ['users.id']),
        sa.PrimaryKeyConstraint('id')
    )
    op.create_index('ix_audit_logs_table_record', 'audit_logs', ['table_name', 'record_id'], unique=False)
    op.create_index('ix_audit_logs_changed_by', 'audit_logs', ['changed_by'], unique=False)
    op.create_index('ix_audit_logs_changed_at', 'audit_logs', ['changed_at'], unique=False)


def downgrade() -> None:
    """Downgrade schema."""
    # Drop tables in reverse order
    op.drop_index('ix_audit_logs_changed_at', table_name='audit_logs')
    op.drop_index('ix_audit_logs_changed_by', table_name='audit_logs')
    op.drop_index('ix_audit_logs_table_record', table_name='audit_logs')
    op.drop_table('audit_logs')
    
    op.drop_table('system_config')
    
    op.drop_index('ix_notifications_created', table_name='notifications')
    op.drop_index('ix_notifications_user_read', table_name='notifications')
    op.drop_table('notifications')
    
    op.drop_table('alert_settings')
    
    op.drop_index('ix_alerts_acknowledged', table_name='alerts')
    op.drop_index('ix_alerts_project_triggered', table_name='alerts')
    op.drop_table('alerts')
    
    op.drop_table('mitigation_logs')
    
    op.drop_index('ix_predictions_risk_category', table_name='risk_predictions')
    op.drop_index('ix_predictions_status', table_name='risk_predictions')
    op.drop_index('ix_predictions_project_requested', table_name='risk_predictions')
    op.drop_table('risk_predictions')
    
    op.drop_index('ix_snapshots_project_date', table_name='project_data_snapshots')
    op.drop_table('project_data_snapshots')
    
    op.drop_table('project_stages')
    
    op.drop_index('idx_projects_location', table_name='projects', postgresql_using='gist')
    op.drop_index('ix_projects_risk_category', table_name='projects')
    op.drop_index('ix_projects_status', table_name='projects')
    op.drop_index('ix_projects_current_stage', table_name='projects')
    op.drop_index('ix_projects_state_district', table_name='projects')
    op.drop_table('projects')
    
    op.drop_table('refresh_tokens')
    
    op.drop_index('ix_users_role', table_name='users')
    op.drop_index('ix_users_email', table_name='users')
    op.drop_table('users')