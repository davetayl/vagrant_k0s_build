curl -sSLf https://get.k0s.sh | sudo sh
echo "export PATH=\$PATH:/usr/local/bin" | sudo tee -a /etc/profile
source /etc/profile

k0s worker --token-file /vagrant/k0s_worker 2>&1 &

