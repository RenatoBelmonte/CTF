#!/bin/bash

# Directory dove salvare i file pcap
dir="/root/pcap"

# Interfaccia di rete da monitorare
interface="game"

# Durata della cattura in secondi
duration=120

# Creazione della directory se non esiste
mkdir -p $dir

# Loop infinito per creare file pcap ogni 2 minuti
while true; do
	rm /root/pcap/*
    # Creazione del nome del file con timestamp
    filename=$(date +"%Y%m%d%H%M%S").pcap

    # Avvio di tcpdump
    tcpdump -i $interface -w $dir/$filename -G $duration

    # Attesa per la prossima cattura
    sleep $duration
done

