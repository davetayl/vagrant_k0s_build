echo "--- debian11-shepherd.sh - start ---"

# Set up K0s
curl -sSLf https://get.k0s.sh | sudo sh
echo "export PATH=\$PATH:/usr/local/bin" | tee -a /etc/profile
source /etc/profile
k0s install controller --enable-worker
mkdir /etc/k0s
cp -R /vagrant/k0s.yaml /etc/k0s/k0s.yaml
k0s start
systemctl enable --now k0scontroller
sleep 5
k0s status

# Set up tokens for workers.
k0s token create --role=worker > /vagrant/k0s_worker

# Load k0sctl 
curl https://github.com/k0sproject/k0sctl/releases/download/v0.15.0/k0sctl-linux-x64 --output /usr/bin/k0sctl
chmod +x /usr/bin/k0sctl

# Load Aqua tools
apt -y install python python3-pip
pip install kube-hunter

k0s kubeconfig admin > kubeconfig
kube-hunter --kubeconfig kubeconfig --cidr 10.0.0.0/24 --enable-cve-hunting

echo "--- debian11-shepherd.sh - end ---"
