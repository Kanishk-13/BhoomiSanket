"""
Pytest configuration for BhoomiSanket backend tests.

Uses a session-scoped event loop so that the SQLAlchemy asyncpg engine and
connection pool are reused across all async tests in the session — preventing
the "Task attached to a different loop" error that occurs when each test
function creates its own separate event loop.
"""
import asyncio
import pytest


@pytest.fixture(scope="session")
def event_loop():
    """Create a session-scoped event loop shared by all async tests."""
    policy = asyncio.get_event_loop_policy()
    loop = policy.new_event_loop()
    asyncio.set_event_loop(loop)
    yield loop
    loop.close()


@pytest.fixture(scope="session", autouse=True)
def load_ml_model_fixture():
    """Ensure the ML model artifact is loaded in memory for the test session."""
    from app.ml.model_loader import model_loader
    model_loader.load_model()
    yield
