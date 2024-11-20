



vagrant@vmLVMParcial2:~/HOME/2doParcial$ lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0    7:0    0   64M  1 loop /snap/core20/2379
loop1    7:1    0   87M  1 loop /snap/lxd/29351
loop2    7:2    0 38.8M  1 loop /snap/snapd/21759
sda      8:0    0   40G  0 disk
└─sda1   8:1    0   40G  0 part /
sdb      8:16   0   10M  0 disk
sdc      8:32   0   10G  0 disk
├─sdc1   8:33   0    1G  0 part
├─sdc2   8:34   0    1G  0 part
├─sdc3   8:35   0    1G  0 part
├─sdc4   8:36   0    1K  0 part
├─sdc5   8:37   0  1.5G  0 part
└─sdc6   8:38   0  1.3G  0 part
sdd      8:48   0   10G  0 disk


 34  lsblk
   35  sudo fdisk /dev/sdc
   36  sudo mkswap /dev/sdc1
   37  sudo swapon /dev/sdc1
   38  free -h
   39  sudo fdisk /dev/sdc
   40  sudo pvcreate /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6
   41  sudo pvs
   42  sudo vgcreate vgAdmin /dev/sdc2  /dev/sdc3
   43  sudo pvs
   44  sudo vgcreate vgDevelopers /dev/sdc5 /dev/sdc6
   45  sudo pvs
   46  sudo lvcreate -L 1G vgDevelopers -n lvDevelopers
   47  sudo pvs
   48  sudo lvs
   49  sudo lvcreate -L 1G vgDevelopers -n lvTesters
   50  sudo lvs
   51  sudo lvcreate -L .9G vgDevelopers -n lvDevops
   52  sudo lvcreate -L 2G vgAdmin -n lvAdmin
   53  sudo lvcreate -L 1.5G vgAdmin -n lvAdmin
   54  sudo lvcreate -L .9G vgDevelopers -n lvDevops
   55  sudo lvcreate -L .8G vgDevelopers -n lvDevops
   56  sudo lvs
   57  history


   vagrant@vmLVMParcial2:~/HOME/2doParcial$ df -h
Filesystem                             Size  Used Avail Use% Mounted on
tmpfs                                  197M  1.1M  196M   1% /run
/dev/sda1                               39G  1.5G   38G   4% /
tmpfs                                  982M     0  982M   0% /dev/shm
tmpfs                                  5.0M     0  5.0M   0% /run/lock
home_vagrant_foo                       238G  211G   27G  89% /home/vagrant/foo
tmpfs                                  197M  4.0K  197M   1% /run/user/1000
/dev/mapper/vgDevelopers-lvDevelopers  974M   24K  907M   1% /mnt/lvDevelopers
/dev/mapper/vgDevelopers-lvTesters     974M   24K  907M   1% /mnt/lvTesters
/dev/mapper/vgDevelopers-lvDevops      790M   24K  733M   1% /mnt/lvDevops
/dev/mapper/vgAdmin-lvAdmin            1.5G   24K  1.4G   1% /mnt/lvAdmin


vagrant@vmLVMParcial2:~/HOME/2doParcial$ lsblk -f
NAME FSTYPE FSVER LABEL UUID                                   FSAVAIL FSUSE% MOUNTPOINTS
│    LVM2_m LVM2        qxZzxe-3fux-6tZH-zE2e-5rqQ-SP3L-Mzzzfo
│ └─vgAdmin-lvAdmin
│    ext4   1.0         2e7bff73-cffb-4a68-b96c-66867ecced7b      1.4G     0% /mnt/lvAdmin
├─sdc4
│
├─sdc5
│    LVM2_m LVM2        7ECl0p-h2mJ-72UE-4p5E-b5jj-NMPU-Vfpwcx
│ ├─vgDevelopers-lvDevelopers
│ │  ext4   1.0         8224d033-ea74-47fb-bda5-89280078d19d    906.2M     0% /mnt/lvDevelopers
│ └─vgDevelopers-lvDevops
│    ext4   1.0         24b82d64-fd73-490c-a5e6-252a2a48521b    732.5M     0% /mnt/lvDevops
└─sdc6
     LVM2_m LVM2        qJf9fH-ovH4-Gvb2-VVCe-Cdji-ZdSB-31I1At
  ├─vgDevelopers-lvTesters
  │  ext4   1.0         6fdbe71a-2eec-47f5-902d-a7cc0aab6115    906.2M     0% /mnt/lvTesters
  └─vgDevelopers-lvDevops
     ext4   1.0         24b82d64-fd73-490c-a5e6-252a2a48521b    732.5M     0% /mnt/lvDevops
sdd

