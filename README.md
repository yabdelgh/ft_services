
## 🧐 Description
KubeStack is a system administration project meant to introduce the workings of Kubernetes. The goal is to create a K8s cluster to run an infrastructure of seven different services. Before running the script that sets everything up, you need to have a hypervisor (VirtualBox, HyperKit...), kubectl, and minikube installed on your machine.

## 🔧 Usage
To deploy and expose the whole infrastrucre, simply run:

`./setup`

Running the script will deploy a MySQL/WordPress/phpMyAdmin stack, all behind an Nginx instance to redirect traffic to the appropriate service. Additionally, an FTPS server is setup. All services are monitored by telegraf and a Grafana/InfluxDB stack.

## 🎆 Screenshots:
### Infrastructure diagram:
 ![Screenshot 2021-05-28 201606](https://user-images.githubusercontent.com/58333462/120032466-22b1ca80-bff2-11eb-9d1c-c6f638b007a4.png)

### Kubernetes dashboard:
<img width="1440" alt="Capture d’écran 2020-11-28 à 18 49 47" src="https://user-images.githubusercontent.com/58333462/120032695-78867280-bff2-11eb-8bac-0777baf547e7.png">

### Grafana dashboards:
 ![do-any-grafana-dashboard-designs](https://user-images.githubusercontent.com/58333462/120032550-41b05c80-bff2-11eb-9e37-faf3bcf2e764.jpg)
