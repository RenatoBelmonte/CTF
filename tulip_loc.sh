#!/bin/bash

# Directory locale dove salvare i file pcap
local_dir="~/Desktop/CTF/tulip/shared"
echo $local_dir

# Directory remota da cui copiare i file pcap
remote_dir="/root/pcap"

# Indirizzo IP della macchina remota
remote_ip="10.60.3.1"
echo $remote_ip

# Utente della macchina remota
remote_user="root"

# Loop infinito per copiare i nuovi file pcap
while true; do
    # Copia dei nuovi file pcap dalla macchina remota
    scp -r root@10.60.3.1:/root/pcap/* ~/Desktop/CTF/tulip/shared

    # Attesa prima del prossimo controllo
    sleep 60
done

