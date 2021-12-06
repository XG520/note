# kvm安装window

```shell
sudo virt-install \
--name win10.5 \
--memory 2048 \
--vcpus sockets=1,cores=1,threads=2 \
--cdrom=/home/fil/win10.iso \
--os-variant=win10 \
--disk path=/home/fil/window/win10.5.qcow2,bus=virtio,size=60 \
--disk device=cdrom,path=/home/fil/window/virtio-amd64.vfd,device=floppy \
--network bridge=br0,model=virtio --hvm --virt-type kvm 

sudo virt-install \
--name win10.5\
--memory 2048 \
--vcpus sockets=1,cores=1,threads=2 \
--cdrom=/home/fil/win10.iso  \
--os-variant=win10 \
--disk path=/home/fil/win10.qcow2,bus=virtio,size=60 \
--disk device=cdrom,path=/home/fil/virtio-win-0.1.102.iso,device=floppy \
--network bridge=br0,model=virtio --hvm --virt-type kvm



https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.126-2/virtio-win-0.1.126.iso
wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.126-2/virtio-win-0.1.126_amd64.vfd
```

