apt -y install nginx
rm -f /etc/nginx/sites-enabled/default
ln -s /vagrant/lb-site /etc/nginx/sites-enabled/lb-site.conf
systemctl enable --now nginx

echo "--- debian11-lb.sh - end ---"
