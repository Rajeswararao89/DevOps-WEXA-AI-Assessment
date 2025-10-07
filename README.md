# 🚀 WEXA AI – DevOps Internship Assessment

This repository contains my end-to-end DevOps implementation for the **WEXA AI Internship Assessment**.  
The project demonstrates practical knowledge of **containerization**, **CI/CD automation**, and **Kubernetes deployment** using a simple Next.js web application.

---

## 🧠 Project Overview

**Objective:**  
Build and deploy a minimal web application that showcases core DevOps practices — from local development to automated build and deployment pipelines.

**Stack Used**
- **Frontend:** Next.js (v15 +, TypeScript)
- **Containerization:** Docker (Alpine-based multi-stage build)
- **Orchestration:** Kubernetes (Minikube cluster)
- **CI/CD:** GitHub Actions → GitHub Container Registry (GHCR)
- **Cloud-Ready:** Easily extendable to AWS EKS / GKE

---

## 🏗️ 1. Local Development

# Clone repository
git clone https://github.com/Rajeswararao89/DevOps-WEXA-AI-Assessment.git
cd DevOps-WEXA-AI-Assessment

# Install dependencies
npm ci

# Run locally
npm run dev -- -p 8080
Then open http://localhost:8080.

Health Endpoint

Copy code
GET /api/health
→ {"status":"ok","build":"local","timestamp":"<ISO-date>"}

---

# 🐳 2. Docker Containerization
- Dockerfile (multi-stage build)

- Stage 1: build the Next.js app

- Stage 2: copy production files and run lightweight server

- Build and run:

- docker build -t nextjs-wexa:latest .
- docker run -p 8080:3000 nextjs-wexa:latest
- Access: http://localhost:8080

---

# ⚙️ 3. CI/CD Pipeline (GitHub Actions + GHCR)
- Automatic pipeline on every push to main:

- 🧱 Build Docker image

- 🔐 Authenticate to GitHub Container Registry (GHCR)

- 📦 Push image as ghcr.io/<username>/nextjs-wexa:latest

- Workflow file:
- .github/workflows/ci.yml

- Trigger manually

- git add .
- git commit -m "trigger build"
- git push origin main

---

# ☸️ 4. Kubernetes Deployment (Minikube)
- Start cluster

- minikube start --driver=docker --memory=1800mb --cpus=2
- eval $(minikube docker-env)
- Build image inside cluster

- docker build -t nextjs-wexa:latest .
- Apply manifests

- kubectl apply -f k8s.yaml
- kubectl get pods
- kubectl get svc
- Expose app
- minikube service nextjs-service --url
- output:

http://192.168.58.2:30080
Visit the URL or test:
curl http://192.168.58.2:30080/api/health

---

# 🧩 6. Key DevOps Features
- Area	Implementation
- Containerization	Multi-stage Dockerfile (optimized for Node 18 Alpine)
- Automation	GitHub Actions build + push to GHCR
- Orchestration	Kubernetes Deployment + NodePort Service
- Observability	/api/health endpoint used for liveness/readiness probes
- Portability	Works in Minikube / Docker Desktop / AWS EKS
- Scalability	Deployment replicas configurable

---

# 🧠 Learning Outcome
- This project demonstrates:

- Setting up CI/CD pipelines for automated builds

- Using Docker and Kubernetes for application delivery

- Writing Kubernetes manifests with liveness/readiness probes

- Managing end-to-end workflow from local to cluster deployment

---

# 👨‍💻 Author
- Rajeswara Rao
- DevOps & Cloud Engineer (AWS | Azure | Kubernetes)

