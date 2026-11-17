from fastapi import FastAPI, status
from prometheus_fastapi_instrumentator import Instrumentator
import time

# FastAPI app initialize kar rahe hain
app = FastAPI(
    title="DevPulse Cloud Health Monitor",
    description="DevOps Microservice with Cloud-Native Monitoring & GitOps",
    version="1.0.0"
)

# Prometheus metrics setup (ye automatically /metrics endpoint bana deta hai)
Instrumentator().instrument(app).expose(app)

@app.get("/")
def home():
    return {
        "status": "online",
        "service": "DevPulse Monitor",
        "version": "1.0.0",
        "environment": "production",
        "message": "DevOps End-to-End Pipeline is Live!"
    }

# K8s Liveness check
@app.get("/healthz", status_code=status.HTTP_200_OK)
def health_check():
    return {"status": "healthy", "timestamp": time.time()}

# K8s Readiness check
@app.get("/readyz", status_code=status.HTTP_200_OK)
def readiness_check():
    return {"status": "ready"}