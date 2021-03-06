curl -sSL get.docker.com | sh && sudo usermod pi -aG docker

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
sudo apt-key add - && echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | \
sudo tee /etc/apt/sources.list.d/kubernetes.list && sudo apt-get update -q

sudo apt-get install -qy kubelet kubectl kubeadm

sudo kubeadm init

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

sudo apt-get install golang

go version
