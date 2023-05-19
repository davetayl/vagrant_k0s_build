echo "--- debian11-master.sh - start ---"

# Set up K0s
curl -sSLf https://get.k0s.sh | sudo sh
echo "export PATH=\$PATH:/usr/local/bin" | tee -a /etc/profile
source /etc/profile
k0s install controller --enable-worker
mkdir /etc/k0s
ln -s /vagrant/k0s.yaml /etc/k0s/k0s.yaml
k0s start
systemctl enable --now k0scontroller
sleep 5
k0s status
echo "alias kubectl=\"k0s kubectl\"" >> /etc/profile
# Set up tokens for workers.
k0s token create --role=worker > /vagrant/k0s_worker
echo "--- K0s install complete ---"

# Set up Helm
wget https://get.helm.sh/helm-v3.12.0-linux-amd64.tar.gz
tar -xvf helm-v3.12.0-linux-amd64.tar.gz
chmod +x linux-amd64/helm
mv linux-amd64/helm /usr/bin
k0s kubeconfig admin > /etc/k0s/kubeconfig
echo "--- Helm install complete ---"


# Load Kubernetes dashboard UI
# k0s kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

# Deploy an nginx application
k0s kubectl apply -f /vagrant/nginx-deploy.yaml

# Load nginx ingress controllerwith helm
# https://kubernetes.github.io/ingress-nginx/deploy/
helm --kubeconfig /etc/k0s/kubeconfig upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace


# Insert any pod deployments blow this line using
# k0s kubectl apply -f <manifest.yaml>

echo "--- debian11-master.sh - end ---"
