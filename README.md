# 🐍 Flask App on ☸️ Google Kubernetes Engine (GKE)

My first Kubernetes deployment learning project on Google Cloud Platform.

---

## 📋 What I Did

This project demonstrates:
- 🐍 Creating a Flask application
- 🐳 Containerizing it with Docker
- 📦 Pushing the image to Google Artifact Registry
- ☸️ Deploying to Google Kubernetes Engine (GKE)
- 🌐 Exposing the app publicly with a LoadBalancer service
- ✅ Verifying everything works end-to-end

---
## 📋 TO DO !!!
- use cloud build yaml for CI/CD, no manaul image creation and management
- add a test/ folder and make test functions with pytest
- add the test logic in yaml file for cloud build to test this all


## 🚀 Step-by-Step Guide

### 1. ☸️ Created a Kubernetes Cluster on Google Cloud

I created a GKE cluster with 2 small machines.

```bash
gcloud container clusters create learning-cluster --zone asia-south1-a --num-nodes 2 --machine-type e2-small
```

---

### 2. ✔️ Checked That the Cluster is Working

Verified that the cluster machines (nodes) are ready.

```bash
kubectl get nodes
```

---

### 3. 📦 Created a Docker Repository on Google Cloud

This is where Docker images are stored.

```bash
gcloud artifacts repositories create k8-flask-test --repository-format=docker --location=asia-south1 --description="Docker repo for flask backend"
```

---

### 4. 🏷️ Tagged the Flask Docker Image

Gave the local Docker image a Google Cloud name.

```bash
docker tag test-app:latest asia-south1-docker.pkg.dev/gcp-test-project/k8-flask-test/test-app:1.0
```

---

### 5. 🔍 Checked Docker Images on System

```bash
docker image ls
```

---

### 6. 🔐 Authenticated Docker with Google Cloud

Allowed pushing images to Google Cloud.

```bash
gcloud auth configure-docker asia-south1-docker.pkg.dev
```

---

### 7. ⬆️ Pushed Docker Image to Artifact Registry

Uploaded the Flask image to Google Cloud.

```bash
docker push asia-south1-docker.pkg.dev/gcp-test-project/k8-flask-test/test-app:1.0
```

---

### 8. ✅ Confirmed Image Exists in Artifact Registry

```bash
gcloud artifacts docker images list asia-south1-docker.pkg.dev/gcp-test-project/k8-flask-test
```

---

### 9. ☸️ Created Kubernetes Deployment YAML

The `deployment.yaml` file contains:
- 2 replicas (copies) of the Flask app
- Image from Artifact Registry
- Correct container port configuration

---

### 10. 🎯 Applied the Deployment to the Cluster

```bash
kubectl apply -f deployment.yaml
```

---

### 11. 🐚 Checked That Pods are Running

```bash
kubectl get pods
```

---

### 12. 🌐 Created Kubernetes Service YAML

The `service.yaml` file contains:
- LoadBalancer service type
- Maps port 80 to the app's internal port
- Exposes the app publicly

---

### 13. 🚀 Applied the Service to the Cluster

```bash
kubectl apply -f service.yaml
```

---

### 14. 📍 Got the Public External IP

```bash
kubectl get svc
```

This shows the external IP address where the app is accessible.

---

### 15. 🌍 Verified the Flask App is Running

Opened the external IP in a browser and confirmed the Flask app is responding.

---

### 16. 📋 Checked Application Logs

```bash
kubectl logs -l app=flask-backend
```

Output confirmed:
```
Hello from Flask on Kubernetes!
```

---

## 🎉 Final Result

**Flask app is running on Google Kubernetes Engine and accessible using a public IP.** ✅

---

## 📁 Files in This Project

- 🐍 `app.py` - Flask application
- 🐳 `Dockerfile` - Docker container configuration
- ☸️ `deployment.yaml` - Kubernetes Deployment manifest
- 🌐 `service.yaml` - Kubernetes Service manifest
- 📦 `requirements.txt` - Python dependencies

---

## 💡 Key Learnings

1. 🐳 Docker containerizes applications for consistency
2. 📦 Artifact Registry stores Docker images in Google Cloud
3. ☸️ Kubernetes manages containerized apps at scale
4. ☁️ GKE handles Kubernetes infrastructure on Google Cloud
5. 🌐 Services expose apps to the internet
6. 📊 LoadBalancer provides public access

---

## 🛠️ Technologies Used

- **Framework**: 🐍 Flask (Python)
- **Containerization**: 🐳 Docker
- **Orchestration**: ☸️ Kubernetes (GKE)
- **Cloud Provider**: ☁️ Google Cloud Platform (GCP)
- **Image Registry**: 📦 Google Artifact Registry
