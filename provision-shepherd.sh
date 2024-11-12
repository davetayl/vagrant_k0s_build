echo "--- debian11-master.sh - start ---"

# Set up K0s
curl -sSLf https://get.k0s.sh | sudo sh
echo "export PATH=\$PATH:/usr/local/bin" | tee -a /etc/profile
source /etc/profile
mkdir -p /etc/k0s
ln -s /vagrant/k0s.yaml /etc/k0s/k0s.yaml
k0s install controller -c /etc/k0s/k0s.yaml
k0s start
systemctl enable --now k0scontroller
sleep 5
k0s kubeconfig admin > /vagrant/kubeconfig

echo "------------- k0s status -------------"
k0s status

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

echo "--- debian11-master.sh - end ---"
