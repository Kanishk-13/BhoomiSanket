from fastapi import APIRouter

router = APIRouter()


@router.get("/")
async def list_alerts():
    # Placeholder - will be implemented in M6
    return {"message": "Alerts list - to be implemented in M6", "alerts": []}


@router.get("/{alert_id}")
async def get_alert(alert_id: int):
    # Placeholder - will be implemented in M6
    return {"message": f"Alert {alert_id} - to be implemented in M6"}


@router.post("/{alert_id}/acknowledge")
async def acknowledge_alert(alert_id: int):
    # Placeholder - will be implemented in M6
    return {"message": f"Acknowledge alert {alert_id} - to be implemented in M6"}


@router.post("/{alert_id}/action")
async def record_alert_action(alert_id: int):
    # Placeholder - will be implemented in M6
    return {"message": f"Record action for alert {alert_id} - to be implemented in M6"}