#!/bin/sh
/usr/sbin/rmmod nvidia
/root/nvidia/NVIDIA-Linux-x86_64-470.63-vgpu-kvm.run --kernel-source-path=/usr/src/kernels/4.18.0-305.19.1.el8_4.x86_64 --kernel-install-path=/lib/modules/4.18.0-305.19.1.el8_4.x86_64/kernel/drivers/video/ --silent --tmpdir /root/tmp/ --no-systemd

/usr/bin/nvidia-vgpud &
/usr/bin/nvidia-vgpu-mgr &

while true; 
do 
  sleep 15
  /usr/bin/pgrep nvidia-vgpu-mgr 
  if [ $? -ne 0 ]
  then
    echo "nvidia-vgpu-mgr is not running" && exit 1
  fi
done

