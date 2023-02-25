#! /bin/bash

#default
#Copyright (C) 2023 Floating dream All rights reserved
OSNAME=CuteOS
VERSION=23.03.1
AMTR=amd
FRWORK=64
TYPE=desktop
VERTYPE=Beta
OUT=.iso
GR=-

#color
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 6)
COL=$(tput setaf 9)
PINK=$(tput setaf 10)
KPE=$(tput setaf 13)
CUTE=$(tput setaf 50)
KNN=$(tput setaf 48)
DRR=$(tput setaf 50)
FRE=$(tput setaf 23)
RES=$(tput sgr0)
CISVER=23.03.1

sudo apt-get clean

#start
clear
#Cute
echo -e "${BLUE}╔═════════════════════════════════════════════════════╗
║                                                     ║
║  ██████╗██╗   ██╗████████╗███████╗ ██████╗ ███████╗ ║
║ ██╔════╝██║   ██║╚══██╔══╝██╔════╝██╔═══██╗██╔════╝ ║
║ ██║     ██║   ██║   ██║   █████╗  ██║   ██║███████╗ ${KPE}║
║ ${BLUE}██║     ██║   ██║   ██║   ██╔══╝  ██║   ██║╚════██║ ${KPE}║
║ ${BLUE}╚██████╗╚██████╔╝   ██║   ███████╗╚██████╔╝███████║ ${KPE}║
║  ${BLUE}╚═════╝ ╚═════╝    ╚═╝   ╚══════╝ ╚═════╝ ╚══════╝ ${KPE}║
║                   ${CUTE}Version ${CISVER}${KNN}                   ║
╚═════════════════════════════════════════════════════╝"
echo "${KNN}╔═══════════════════════════════════════╗
║${CUTE}CuteOS${RES} system iso file packaging script${KPE}║
╚═══════════════════════════════════════╝${RES}
"

echo "${CUTE}Current time:"
echo $(date +%F%n%T)
echo ""
echo -e "\e[1mWelcom CuteOS-iso-image\e[0m"
read -r -p "Set ISO name [${KNN}default${RES}/${COL}custom${RES}]" input
case $input in
	[dD][eE][fF][aA][uU][lL][tT])
    echo -e "Use \e[1m${KNN}default\e[0m${RES}"
    echo "${COL}Configuring...${RES}${CUTE}"
    i=0
	    str='#'
		ch=('|' '\' '-' '/')
		index=0
		while [ $i -le 25 ]
		do
		    printf "[%-26s][%d%%][%c]\r" $str $(($i*4)) ${ch[$index]}
    		str+='#'
			let i++
			let index=i%4
			sleep 0.1
		done
    printf "\n"
    echo "${KNN}Please wait, building is starting..."
    sleep 2.01
    clear
    echo "${KNN}╔══════════════════════════════╗
║${COL}*${KNN}Start compressing file system${KPE}║
╚══════════════════════════════╝${KNN}"
#Copyright (C) 2023 Floating dream All rights reserved
    echo ""
    echo "*start"
    sudo mksquashfs /home/cute/CuteOS-desktop-Source-code/squashfs/squashfs-root /home/cute/CuteOS-desktop-Source-code/iso_modify/iso/casper/filesystem.squashfs -noappend -e boot -comp xz -Xbcj x86
    echo "${COL}*${PINK}File system compression complete!"
    echo "${COL}*${PINK}Please wait a moment, and prepare to build iso"
    sleep 2.86
    clear
    echo "${KNN}╔══════════════════════════════════════╗
║${COL}*${CUTE}Start to generate iso disc image file${KPE}║
╚══════════════════════════════════════╝${CUTE}"
    echo ""
    #make iso
    echo "*start"
    grub-mkrescue -o "/home/cute/CuteOS-desktop-Source-code/${OSNAME}${GR}${VERSION}${GR}${VERTYPE}${GR}${TYPE}${GR}${AMTR}${FRWORK}${OUT}" /home/cute/CuteOS-desktop-Source-code/iso_modify/iso --compress=xz
    echo "${COL}*${PINK}The iso disc image file of CuteOS has been generated"
    echo "${COL}*${PINK}Build succeeded!"
    echo "${COL}*${PINK}Script running completed, exiting script"
    echo "${CUTE}Done!"
    echo ""
    echo "Construction time:"
    echo $(date +%F%n%T)
    ;;
    [cC][uU][sS][tT][oO][mM])
    echo -e "Use \e[1m${COL}custom\e[0m${RES}"
    echo -e "\e[1m${BLUE}Please type the new iso name:\e[0m${PINK}"
    echo -e "\e[1m${COL}**[Tip]: Do not add suffix**\e[0m${KNN}"
    echo "${BLUE}════Please enter:${KNN}"
    read NEWISO
    echo -e "\e[1m${COL}*${PINK}Enabling configuration${CUTE}\e[0m${CUTE}"
    i=0
	    str='#'
		ch=('|' '\' '-' '/')
		index=0
		while [ $i -le 25 ]
		do
		    printf "[%-26s][%d%%][%c]\r" $str $(($i*4)) ${ch[$index]}
    		str+='#'
			let i++
			let index=i%4
			sleep 0.16
		done
    printf "\n"
    echo -e "\e[1m${COL}*${PINK}Complete the setting, please continue the following operation\e[0m"
    echo -e "\e[1m${BLUE}Please enter the version number:\e[0m${PINK}"
    echo "${BLUE}════Please enter:${KNN}"
    read NEWVER
    echo -e "\e[1m${COL}*${PINK}Enabling configuration${CUTE}\e[0m${CUTE}"
    i=0
	    str='#'
		ch=('|' '\' '-' '/')
		index=0
		while [ $i -le 25 ]
		do
		    printf "[%-26s][%d%%][%c]\r" $str $(($i*4)) ${ch[$index]}
    		str+='#'
			let i++
			let index=i%4
			sleep 0.12
		done
    printf "\n"
    echo ""
    echo "${KNN}Please wait, building is starting..."
    sleep 2.01
    clear
    echo "${KNN}╔══════════════════════════════╗
║${COL}*${KNN}Start compressing file system${KPE}║
╚══════════════════════════════╝${KNN}"
    echo ""
    echo "*start"
    sudo mksquashfs /home/cute/CuteOS-desktop-Source-code/squashfs/squashfs-root /home/cute/CuteOS-desktop-Source-code/iso_modify/iso/casper/filesystem.squashfs -noappend -e boot -comp xz -Xbcj x86
    echo "${COL}*${PINK}File system compression complete!"
    echo "${COL}*${PINK}Please wait a moment, and prepare to build iso"
    sleep 2.86
    clear
    echo "${KNN}╔══════════════════════════════════════╗
║${COL}*${CUTE}Start to generate iso disc image file${KPE}║
╚══════════════════════════════════════╝${CUTE}"
    echo ""
    #make iso
    echo "*start"
    grub-mkrescue -o "/home/cute/CuteOS-desktop-Source-code/${NEWISO}${GR}${NEWVER}${GR}${VERTYPE}${GR}${TYPE}${GR}${AMTR}${FRWORK}${OUT}" /home/cute/CuteOS-desktop-Source-code/iso_modify/iso --compress=xz
    echo "${COL}*${PINK}The iso disc image file of CuteOS has been generated"
    echo "${COL}*${PINK}Build succeeded!"
    echo "${COL}*${PINK}Script running completed, exiting script"
    echo "${CUTE}Done!"
    echo ""
    echo "Construction time:"
    echo $(date +%F%n%T)
    ;;
    *)
    exit 1
esac
#Copyright (C) 2023 Floating dream All rights reserved