echo "--- debian11-setup.sh - start ---"
apt-get -y update
apt-get -y upgrade
apt-get -y install curl net-tools git

cat > /etc/hosts <<EOF
127.0.0.1       localhost
127.0.0.2       bullseye
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters

127.0.1.1       $HOSTNAME $HOSTNAME
10.0.0.16       master
10.0.0.18       worker1
10.0.0.19       worker2
10.0.0.20       worker3

EOF
echo "--- debian11-setup.sh - end ---"
