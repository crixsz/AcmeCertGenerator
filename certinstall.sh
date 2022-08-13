#/bin/bash
##text styles
bold=$(tput bold)
underline=$(tput smul)
italic=$(tput sitm)
info=$(tput setaf 2)
error=$(tput setaf 160)
warn=$(tput setaf 214)
reset=$(tput sgr0)
echo -e "

─█▀▀█ █▀▀ █▀▄▀█ █▀▀ ─ █▀▀ █──█ 　 ░█▀▀█ █▀▀ █▀▀█ ▀▀█▀▀ 　 ▀█▀ █▀▀▄ █▀▀ ▀▀█▀▀ █▀▀█ █── █── 
░█▄▄█ █── █─▀─█ █▀▀ ▄ ▀▀█ █▀▀█ 　 ░█─── █▀▀ █▄▄▀ ──█── 　 ░█─ █──█ ▀▀█ ──█── █▄▄█ █── █── 
░█─░█ ▀▀▀ ▀───▀ ▀▀▀ █ ▀▀▀ ▀──▀ 　 ░█▄▄█ ▀▀▀ ▀─▀▀ ──▀── 　 ▄█▄ ▀──▀ ▀▀▀ ──▀── ▀──▀ ▀▀▀ ▀▀▀"
echo -e ""
echo -e "Enter your domain?"
echo -e ""
read domain
echo -e "Installing the necessary packages......"
apt-get install socat -y >> /dev/null
apt-get install ca-certificates >> /dev/null
wget -q -O acme.sh https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd .acme.sh
bash acme.sh --register-account -m kimochilol@gmail.com
bash acme.sh --issue --standalone -d $domain --force
bash acme.sh --installcert -d $domain --fullchainpath /root/xray.crt --keypath /root/xray.key
echo "##-	SUCCESS -##"
echo "Your key path is : /root/xray.key"
echo "Your cert path is : /root/xray.crt"
