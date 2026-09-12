import uuid
from datetime import datetime, date
from sqlalchemy import Column, String, Boolean, Integer, Numeric, Date, ForeignKey, JSON, BigInteger, Index, UniqueConstraint, func
from sqlalchemy.orm import mapped_column, Mapped, relationship
from sqlalchemy.dialects.postgresql import UUID, JSONB, TIMESTAMP
from sqlalchemy.sql import func as sqlalchemy_func
from geoalchemy2 import Geography
from app.db.database import Base

class User(Base):
    __tablename__ = 'users'
    __table_args__ = (
        Index('ix_users_email', 'email'),
        Index('ix_users_role', 'role'),
    )

    id: Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    email: Mapped[str] = mapped_column(String(255), unique=True, nullable=False)
    display_name: Mapped[str] = mapped_column(String(100), nullable=False)
    role: Mapped[str] = mapped_column(String(20), nullable=False)
    password_hash: Mapped[str] = mapped_column(String(255), nullable=False)
    is_active: Mapped[bool] = mapped_column(Boolean, default=True)
    created_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), server_default=func.now())
    updated_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), server_default=func.now(), onupdate=func.now())

    refresh_tokens = relationship("RefreshToken", back_populates="user", cascade="all, delete-orphan")
    mitigation_logs = relationship("MitigationLog", back_populates="user")
    alerts_acknowledged = relationship("Alert", back_populates="acknowledger")
    alert_setting = relationship("AlertSetting", back_populates="user", uselist=False, cascade="all, delete-orphan")
    notifications = relationship("Notification", back_populates="user", cascade="all, delete-orphan")

class RefreshToken(Base):
    __tablename__ = 'refresh_tokens'

    id: Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id: Mapped[uuid.UUID] = mapped_column(ForeignKey('users.id', ondelete='CASCADE'))
    token_hash: Mapped[str] = mapped_column(String(255), unique=True, nullable=False)
    expires_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), nullable=False)
    revoked: Mapped[bool] = mapped_column(Boolean, default=False)
    created_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), server_default=func.now())

    user = relationship("User", back_populates="refresh_tokens")

class Project(Base):
    __tablename__ = 'projects'
    __table_args__ = (
        Index('ix_projects_state_district', 'state', 'district'),
        Index('ix_projects_current_stage', 'current_stage'),
        Index('ix_projects_status', 'status'),
        Index('ix_projects_risk_category', 'current_stage', 'status'),
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column(String(200), nullable=False)
    project_type: Mapped[str] = mapped_column(String(50), nullable=False)
    state: Mapped[str] = mapped_column(String(100), nullable=False)
    district: Mapped[str] = mapped_column(String(100), nullable=False)
    # PostGIS geography point (SRID 4326 - WGS84)
    location: Mapped[str] = mapped_column(Geography(geometry_type='POINT', srid=4326), nullable=True)
    latitude: Mapped[float] = mapped_column(Numeric(9, 6), nullable=True)
    longitude: Mapped[float] = mapped_column(Numeric(9, 6), nullable=True)
    land_area_ha: Mapped[float] = mapped_column(Numeric(10, 2), nullable=True)
    affected_families: Mapped[int] = mapped_column(Integer, nullable=True)
    start_date: Mapped[date] = mapped_column(Date, nullable=False)
    target_end_date: Mapped[date] = mapped_column(Date, nullable=False)
    current_stage: Mapped[str] = mapped_column(String(50), nullable=False)
    status: Mapped[str] = mapped_column(String(20), nullable=False)
    data_source: Mapped[str] = mapped_column(String(50), default='SYNTHETIC_DEMO')
    created_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), server_default=sqlalchemy_func.now())
    updated_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), server_default=sqlalchemy_func.now(), onupdate=sqlalchemy_func.now())

    stages = relationship("ProjectStage", back_populates="project", cascade="all, delete-orphan")
    snapshots = relationship("ProjectDataSnapshot", back_populates="project", cascade="all, delete-orphan")
    predictions = relationship("RiskPrediction", back_populates="project", cascade="all, delete-orphan")
    mitigation_logs = relationship("MitigationLog", back_populates="project", cascade="all, delete-orphan")
    alerts = relationship("Alert", back_populates="project", cascade="all, delete-orphan")

class ProjectStage(Base):
    __tablename__ = 'project_stages'

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    project_id: Mapped[int] = mapped_column(ForeignKey('projects.id', ondelete='CASCADE'))
    stage_name: Mapped[str] = mapped_column(String(50), nullable=False)
    sequence_no: Mapped[int] = mapped_column(Integer, nullable=False)
    planned_start: Mapped[datetime.date] = mapped_column(Date, nullable=True)
    planned_end: Mapped[datetime.date] = mapped_column(Date, nullable=True)
    actual_start: Mapped[datetime.date] = mapped_column(Date, nullable=True)
    actual_end: Mapped[datetime.date] = mapped_column(Date, nullable=True)
    status: Mapped[str] = mapped_column(String(20), default='pending')

    project = relationship("Project", back_populates="stages")

class ProjectDataSnapshot(Base):
    __tablename__ = 'project_data_snapshots'
    __table_args__ = (
        Index('ix_snapshots_project_date', 'project_id', 'snapshot_date'),
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    project_id: Mapped[int] = mapped_column(ForeignKey('projects.id', ondelete='CASCADE'))
    snapshot_date: Mapped[date] = mapped_column(Date, server_default=sqlalchemy_func.current_date())

    days_in_current_stage: Mapped[int] = mapped_column(Integer, nullable=True)
    stage_overdue_days: Mapped[int] = mapped_column(Integer, nullable=True)
    pct_stages_completed: Mapped[float] = mapped_column(Numeric(5, 4), nullable=True)
    compensation_paid_pct: Mapped[float] = mapped_column(Numeric(5, 4), nullable=True)
    avg_compensation_pending_days: Mapped[int] = mapped_column(Integer, nullable=True)
    num_disputed_claims: Mapped[int] = mapped_column(Integer, default=0)
    legal_dispute_flag: Mapped[bool] = mapped_column(Boolean, default=False)
    num_active_legal_cases: Mapped[int] = mapped_column(Integer, default=0)
    has_court_stay: Mapped[bool] = mapped_column(Boolean, default=False)
    doc_complete_pct: Mapped[float] = mapped_column(Numeric(5, 4), nullable=True)
    approval_pending_days: Mapped[int] = mapped_column(Integer, nullable=True)
    num_approvals_pending: Mapped[int] = mapped_column(Integer, default=0)
    sia_approved: Mapped[bool] = mapped_column(Boolean, default=False)
    env_clearance_obtained: Mapped[bool] = mapped_column(Boolean, default=False)
    rehab_progress_pct: Mapped[float] = mapped_column(Numeric(5, 4), nullable=True)
    stakeholder_response_days: Mapped[int] = mapped_column(Integer, nullable=True)
    notification_delay_days: Mapped[int] = mapped_column(Integer, nullable=True)
    possession_completion_pct: Mapped[float] = mapped_column(Numeric(5, 4), nullable=True)
    district_historical_delay_rate: Mapped[float] = mapped_column(Numeric(5, 4), nullable=True)

    created_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), server_default=func.now())

    project = relationship("Project", back_populates="snapshots")
    predictions = relationship("RiskPrediction", back_populates="snapshot")

class RiskPrediction(Base):
    __tablename__ = 'risk_predictions'
    __table_args__ = (
        Index('ix_predictions_project_requested', 'project_id', 'requested_at'),
        Index('ix_predictions_status', 'status'),
        Index('ix_predictions_risk_category', 'risk_category'),
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    project_id: Mapped[int] = mapped_column(ForeignKey('projects.id', ondelete='CASCADE'))
    snapshot_id: Mapped[int] = mapped_column(ForeignKey('project_data_snapshots.id'))
    requested_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), nullable=False)
    responded_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), nullable=True)
    model_version: Mapped[str] = mapped_column(String(20), nullable=True)
    is_mock: Mapped[bool] = mapped_column(Boolean, nullable=False, default=True)
    delay_probability: Mapped[float] = mapped_column(Numeric(5, 4), nullable=True)
    risk_category: Mapped[str] = mapped_column(String(20), nullable=True)
    stage_predictions: Mapped[dict] = mapped_column(JSONB, nullable=True)
    explanations: Mapped[dict] = mapped_column(JSONB, nullable=True)
    recommendations: Mapped[dict] = mapped_column(JSONB, nullable=True)
    is_stale: Mapped[bool] = mapped_column(Boolean, default=False)
    stale_since: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), nullable=True)
    status: Mapped[str] = mapped_column(String(20), default='success')

    project = relationship("Project", back_populates="predictions")
    snapshot = relationship("ProjectDataSnapshot", back_populates="predictions")
    alerts = relationship("Alert", back_populates="prediction")

class MitigationLog(Base):
    __tablename__ = 'mitigation_logs'

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    project_id: Mapped[int] = mapped_column(ForeignKey('projects.id', ondelete='CASCADE'))
    user_id: Mapped[uuid.UUID] = mapped_column(ForeignKey('users.id'))
    action_taken: Mapped[str] = mapped_column(String, nullable=False)
    notes: Mapped[str] = mapped_column(String, nullable=True)
    logged_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), server_default=func.now())

    project = relationship("Project", back_populates="mitigation_logs")
    user = relationship("User", back_populates="mitigation_logs")

class Alert(Base):
    __tablename__ = 'alerts'
    __table_args__ = (
        Index('ix_alerts_project_triggered', 'project_id', 'triggered_at'),
        Index('ix_alerts_acknowledged', 'acknowledged_by', 'acknowledged_at'),
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    project_id: Mapped[int] = mapped_column(ForeignKey('projects.id', ondelete='CASCADE'))
    prediction_id: Mapped[int] = mapped_column(ForeignKey('risk_predictions.id'), nullable=True)
    alert_type: Mapped[str] = mapped_column(String(50), nullable=False)
    risk_category: Mapped[str] = mapped_column(String(20), nullable=True)
    probability_at_trigger: Mapped[float] = mapped_column(Numeric(5, 4), nullable=True)
    triggered_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), server_default=func.now())
    acknowledged_by: Mapped[uuid.UUID] = mapped_column(ForeignKey('users.id'), nullable=True)
    acknowledged_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), nullable=True)

    project = relationship("Project", back_populates="alerts")
    prediction = relationship("RiskPrediction", back_populates="alerts")
    acknowledger = relationship("User", back_populates="alerts_acknowledged")

class AlertSetting(Base):
    __tablename__ = 'alert_settings'

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    user_id: Mapped[uuid.UUID] = mapped_column(ForeignKey('users.id', ondelete='CASCADE'), unique=True)
    notify_email: Mapped[bool] = mapped_column(Boolean, default=True)
    notify_inapp: Mapped[bool] = mapped_column(Boolean, default=True)
    alert_on_critical: Mapped[bool] = mapped_column(Boolean, default=True)
    alert_on_high: Mapped[bool] = mapped_column(Boolean, default=True)
    alert_on_medium: Mapped[bool] = mapped_column(Boolean, default=False)
    alert_on_low: Mapped[bool] = mapped_column(Boolean, default=False)
    updated_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), server_default=func.now(), onupdate=func.now())

    user = relationship("User", back_populates="alert_setting")


class Notification(Base):
    __tablename__ = 'notifications'
    __table_args__ = (
        Index('ix_notifications_user_read', 'user_id', 'is_read'),
        Index('ix_notifications_created', 'created_at'),
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    user_id: Mapped[uuid.UUID] = mapped_column(ForeignKey('users.id', ondelete='CASCADE'))
    type: Mapped[str] = mapped_column(String(50), nullable=False)
    title: Mapped[str] = mapped_column(String(200), nullable=False)
    message: Mapped[str] = mapped_column(String, nullable=False)
    related_resource_type: Mapped[str] = mapped_column(String(50), nullable=True)
    related_resource_id: Mapped[str] = mapped_column(String(100), nullable=True)
    is_read: Mapped[bool] = mapped_column(Boolean, default=False)
    created_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), server_default=func.now())
    read_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), nullable=True)

    user = relationship("User", back_populates="notifications")

class SystemConfig(Base):
    __tablename__ = 'system_config'

    key: Mapped[str] = mapped_column(String(100), primary_key=True)
    value: Mapped[str] = mapped_column(String, nullable=False)
    description: Mapped[str] = mapped_column(String, nullable=True)
    updated_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), server_default=func.now(), onupdate=func.now())
    updated_by: Mapped[uuid.UUID] = mapped_column(ForeignKey('users.id'), nullable=True)

class AuditLog(Base):
    __tablename__ = 'audit_logs'
    __table_args__ = (
        Index('ix_audit_logs_table_record', 'table_name', 'record_id'),
        Index('ix_audit_logs_changed_by', 'changed_by'),
        Index('ix_audit_logs_changed_at', 'changed_at'),
    )

    id: Mapped[int] = mapped_column(BigInteger, primary_key=True, autoincrement=True)
    table_name: Mapped[str] = mapped_column(String(100), nullable=False)
    record_id: Mapped[str] = mapped_column(String(100), nullable=False)
    action: Mapped[str] = mapped_column(String(10), nullable=False)
    changed_by: Mapped[uuid.UUID] = mapped_column(ForeignKey('users.id'), nullable=True)
    changed_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), server_default=func.now())
    old_values: Mapped[dict] = mapped_column(JSONB, nullable=True)
    new_values: Mapped[dict] = mapped_column(JSONB, nullable=True)

