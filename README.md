# LHS2024DevOps01

### 01-voting-app
- az login
- az aks get-credentials --name codehunters-training-aks --resource-group codehunters-training-components-rg
- deploy.sh
- kubectl get pods -n voting-app
- Find out the public IP: kubectl get services -n voting-app
- destroy.sh