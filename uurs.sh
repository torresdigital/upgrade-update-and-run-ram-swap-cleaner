#!/bin/bash
## Script Developed by atorres: github.com/atorresbr (( atorresnh@gmail.com ))
## contact: https://www.facebook.com/profile.php?id=61565132277449
## ATORRES Portfolio
## https://github.com/atorresbr


## this functio send the error mesage to user if his not use the sudo command
if [ "$(whoami)" != "root" ]
then
  echo
    echo -e " 🔴 use sudo to run this script "
  echo
  exit 1
fi

red_intense='\033[1;91m'  # Red
on_blue='\033[0;94m'      # Blue
on_yellow='\033[0;93m'    # Yellow
on_green='\033[42m'       # Green
b_black='\033[1;30m'      # black
b_green='\033[1;32m'      # Bold Green
green='\033[0;32m'        # Light Green
red='\033[0;31m'          # Red
nc='\033[0m'              # No Color

sleep 2
echo -ne ${b_green} " 

   * ================================================== * 
  *           Executando os Comandos de Shell            *
   * ================================================== * 
    
         " ${nc}
echo
echo

sleep 2

#  * ================================================== * 
# * =        Executando os Comandos de Shell             *
#  * ================================================== *

# 

# excuta primeiro um upgrade, e depois um update pra depois outro upgrade 
# com a sequência de script para limpeza de memoria ram e swap.

echo -e " excuta primeiro um upgrade e depois um update pra depois outro upgrade 
com a sequência de do script de limpeza de memoria e swap."

echo
sleep 1

echo  -e ${b_green} " 🔴  sudo apt-get upgrade -y " #1

echo
sleep 1
echo -ne ${b_green}'🟩🟩🟩🟩🟩    (25%)\r '
sleep 1
echo -ne '🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩    (76%)\r '
sleep 1
echo -ne '🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩    (100%)\r ' ${nc} 
echo -ne '\n'
sleep 2

echo
echo 

sudo apt-get upgrade -y

echo
echo -e " Sucess ! "
echo

echo
sleep 1

echo  -e ${b_green} " 🔴  sudo apt-get update " #1

echo
sleep 1
echo -ne ${b_green}'🟩🟩🟩🟩🟩    (25%)\r '
sleep 1
echo -ne '🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩    (76%)\r '
sleep 1
echo -ne '🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩    (100%)\r ' ${nc} 
echo -ne '\n'
sleep 2

echo
echo 

sudo apt-get update &&

echo
echo -e " Sucess ! "
echo

echo
sleep 1

echo  -e ${b_green} " 🔴  sudo apt-get upgrade -y " #1

echo
sleep 1
echo -ne ${b_green}'🟩🟩🟩🟩🟩    (25%)\r '
sleep 1
echo -ne '🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩    (76%)\r '
sleep 1
echo -ne '🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩    (100%)\r ' ${nc} 
echo -ne '\n'
sleep 2

echo
echo 

sudo apt-get upgrade -y &&

echo
echo -e " Sucess ! "
echo

echo
sleep 1

#sh ./ram-and-swap-cleaner.sh

sleep 2
echo -e ${b_green} " 

   * ================================================== * 
  *            Welcome to Ram Swap Cleaner               *
   * ================================================== * 
    
         " ${nc}
echo
echo

sleep 2

echo -e ${b_green} "  This script will clear the memory swap and cached memory to free up your RAM. 🙌" ${nc}

echo
echo

free_h=$(free -h)

echo -e ${on_yellow} 
echo "$free_h "
echo -e ${nc}

# Get Memory Information
freemem_before=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_before=$(echo "$freemem_before/1024.0" | bc)
cachedmem_before=$(cat /proc/meminfo | grep "^Cached" | tr -s ' ' | cut -d ' ' -f2) && cachedmem_before=$(echo "$cachedmem_before/1024.0" | bc)

# Output Information
# echo -e "This script will clear cached memory and free up your ram.\n\nAt the moment you have $cachedmem_before MiB cached and $freemem_before MiB free # memory."

echo
echo

# Test sync
if [ "$?" != "0" ]
then
  echo "Something went wrong, It's impossible to sync the filesystem."
  exit 1
fi

# Clear Filesystem Buffer using "sync" and Clear Caches
sync && echo 3 > /proc/sys/vm/drop_caches

freemem_after=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_after=$(echo "$freemem_after/1024.0" | bc)

## Output Summary
## echo -e "This freed $(echo "$freemem_after - $freemem_before" | bc) MiB, so now you have $freemem_after MiB of free RAM."
## exit 0

echo -e " ${red_intense}🧮 Cleaning you Swap Memory " 
echo
sleep 1

swapoff -a && swapon  -a && \
echo
sleep 1

echo -e " ${on_yellow}🧮 Cleaning you cached Memory " ${nc}
echo
echo
sleep 2

## Output Information
echo -ne " ${b_green} At the moment you have $cachedmem_before MiB cached and $freemem_before MiB free memory." ${nc}

## Get Memory Information to make a new clean
freemem_before=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_before=$(echo "$freemem_before/1024.0" | bc)
cachedmem_before=$(cat /proc/meminfo | grep "^Cached" | tr -s ' ' | cut -d ' ' -f2) && cachedmem_before=$(echo "$cachedmem_before/1024.0" | bc)

echo
echo

## Test sync
if [ "$?" != "0" ]
then
  echo "Something went wrong, It's impossible to sync the file system."
  exit 1
fi

## Clear File system Buffer using "sync" and Clear Caches
sync && echo 3 > /proc/sys/vm/drop_caches

freemem_after=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_after=$(echo "$freemem_after/1024.0" | bc)

## Output Summary

echo -e "${on_green}This freed $(echo "$freemem_after - $freemem_before" | bc) MiB, so now you have $freemem_after MiB of free RAM. 😀" ${nc}
 
echo
echo
echo -ne " Share this script ! 🙌 😘 "

exit 0


#O comando sudo apt upgrade no Linux Ubuntu atualiza os pacotes instalados no sistema para as versões mais recentes: Remove versões antigas de #pacotes que não são mais necessários, Corrige conflitos. 
#
#
# Para garantir que o sistema esteja completamente atualizado, é # recomendado usar os comandos sudo apt update e sudo apt 
# upgrade #juntos. 
#
# O sudo apt update atualiza o banco de dados local de pacotes, # enquanto o sudo apt upgrade atualiza os pacotes instalados de # acordo com esse banco de dados. 
#
#
# Para atualizar o Ubuntu via terminal, é possível criar um     # script Bash que inclua os comandos:
#
#
# 1 - sudo su para pedir permissão de acesso como administrador
# 2 - sudo apt update para atualizar todos os pacotes instalados
# 3 - sudo apt-get upgrade para atualizar a distribuição geral
# 4 - sudo apt-get autoremove para remover pacotes que não serão mais necessários 


