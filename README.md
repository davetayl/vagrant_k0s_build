# vagrant_k0s_build
This is a basic k0s based cluster build in a Vagrant environment. IT is intended as a simplified base for development on the Kubernetes platform.

## Usage
- Set up a <a href="https://www.vagrantup.com/">Vagrant</a> environment with <a href="https://www.virtualbox.org/">virtualbox</a> as teh virtualisation provider.
- Clone the repo using ```git clone <repo url>```
- cd to the repo directory and run ```vagrant up```
- Then to access the CLI run ```vagrant ssh shepherd```

## Resources
The build is based on the <a href="https://k0sproject.io/">K0s</a> <a href="https://kubernetes.io/">Kubernetes</a> implementation. The <a href="https://github.com/k0sproject">Github project</a> includes the k0s repo along with a range of other tools and plugins that can be used in conjunction with a base k0s build such as the one found here.