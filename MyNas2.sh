#!/bin/sh
echo "Mount And Unmount My NAS"
echo "===================================================="
echo " "
echo " "
echo "Please wait system will check for mount or umount ....... "

if grep "mynas" /etc/mtab &> /dev/null; then
    grep "mynas" /etc/mtab | awk '{print "Umount mynas on "$2}'
    sudo umount /home/azis/NAS
else
    echo "Mount mynas ...."
    sudo mount -t nfs 55.35.1.111:/mynas /home/azis/NAS && echo "mynas is now mounted" || echo "unable to mount mynas"
fi
echo " "
echo "DONE !"
echo " "
read -p "Press enter to close this terminal"
exit
