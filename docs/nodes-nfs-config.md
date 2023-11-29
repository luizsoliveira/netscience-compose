sudo apt -y install nfs-common
sudo mkdir -p /local-scratch/netscience/tasks

echo "ensc-cnl-17:/local-scratch/netscience/tasks /local-scratch/netscience/tasks nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab