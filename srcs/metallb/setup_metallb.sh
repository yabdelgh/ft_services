kubectl apply -f ./srcs/metallb/namespace.yaml
kubectl apply -f ./srcs/metallb/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metallb/metallb_config.yaml

