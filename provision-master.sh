echo "--- debian11-master.sh - start ---"

# Set up K0s
curl -sSLf https://get.k0s.sh | sudo sh
echo "export PATH=\$PATH:/usr/local/bin" | tee -a /etc/profile
source /etc/profile
mkdir -p /etc/k0s
ln -s /vagrant/k0s.yaml /etc/k0s/k0s.yaml
# k0s install controller --enable-worker
k0s install controller -c /etc/k0s/k0s.yaml
k0s start
systemctl enable --now k0scontroller
sleep 5
echo "------------- k0s status -------------"
k0s status
echo "alias kubectl=\"k0s kubectl\"" >> /etc/profile
# Set up tokens for workers.
k0s token create --role=worker > /vagrant/k0s_worker
cat /var/lib/k0s/pki/admin.conf > /vagrant/kubeconfig
echo "--- K0s install complete ---"

# Set up Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
k0s kubeconfig admin > /etc/k0s/kubeconfig
echo "--- Helm install complete ---"

# Deploy an nginx application
# k0s kubectl apply -f /vagrant/nginx-deploy.yaml

# Load nginx ingress controllerwith helm
# https://kubernetes.github.io/ingress-nginx/deploy/
# helm --kubeconfig /etc/k0s/kubeconfig upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace

# Insert any pod deployments blow this line using
# k0s kubectl apply -f <manifest.yaml>

echo "--- debian11-master.sh - end ---"
