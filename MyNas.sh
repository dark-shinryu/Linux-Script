#!/bin/sh
echo "Mount And Unmount My NAS"
echo "===================================================="
echo " "
echo "Insert password for nas server"
read -s mypassword
echo " "
echo "Please wait system will check for mount or umount ....... "

if grep "<Nama Folder di Nas>" /etc/mtab &> /dev/null; then
    grep "<Nama Folder di Nas>" /etc/mtab | awk '{print "Umount mynas on "$2}'
    sudo umount /<lokasi folder di client>/NAS
else
    echo "Mount mynas ...."
    sudo mount -t cifs -o user=<User di NAS>,password="$mypassword",dir_mode=0777,file_mode=0777 //<Alamat Server Nas>/<Nama Folder NAS>/ /<Lokasi Folder di Client>/NAS && echo "mynas is now mounted" || echo "unable to mount mynas"
fi
echo " "
echo "DONE !"
echo " "
read -p "Press enter to close this terminal"
exit
