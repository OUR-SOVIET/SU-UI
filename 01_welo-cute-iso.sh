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

echo "Installation dependency"
sudo apt install mkisofs
sleep 1
clear
echo "${KNN}Ready to start"
read -r -p "Is there an iso file of CuteOS in the current directory? [Y/n]" input   
    case $input in
        [Yy])
        read -r -p "${COL}*${PINK}If there is an iso file but it is not decompressed, do you want to mount and decompress the iso file? [Y/n]" input
        case $input in
            [Yy])
            echo "${COL}*${PINK}Start mounting and decompression"
            sudo mkdir iso
            sudo mount -o loop $FILE ./iso
            sudo mkdir iso_modify
            sudo rsync -az ./iso ./iso_modify
            sudo mkdir squashfs
            sudo cp iso/casper/filesystem.squashfs ./squashfs
            cd squashfs
            sudo unsquashfs filesystem.squashfs
            echo "${COL}*${PINK}Done!"
            echo "${COL}*${PINK}Prepare to uninstall iso"
            sudo umount ./iso
            echo "${COL}*${PINK}Done!"
            ;;
            [Nn])            
            echo "Prepare to enter the chroot virtual environment..."
            ./02_chroot-iniso.sh
            echo "${COL}*${PINK}Exited chroot virtual environment"
            read -r -p "Do you want to start building iso? [Y/n]" input
            case $input in
                [Yy])
                clear
                ./03_iso-image.sh
                ;;
                [Nn])
                echo "${COL}*${PINK}Exit!"
                ;;
                *)
                exit 1
                ;;
            esac
            ;;
            [Nn])
            read -r -p "Do you want to start building iso? [Y/n]" input
            case $input in
                [Yy])
                clear
                ./03_iso-image.sh
                ;;
                [Nn])
                echo "${COL}*${PINK}Exit!"
                ;;
                *)
                exit 1
                ;;
            esac
            ;;
            [Nn])
            echo "${COL}*${PINK}Exit!"
            ;;
            *)
            exit 1
            ;;
        esac
    esac      
#Copyright (C) 2023 Floating dream All rights reserved
