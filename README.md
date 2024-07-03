## Access to VM
First of all, launch the `script.sh` in order to grather the access through ssh and clone the files in the local directory.
Then, remember to update services information inside `configurations.py`.
Next, update the configuration files using `runme.sh`
## RUN TULIP
Tulip is used to analyze the pcap files produced on the VM through the `tulip_vm.sh` launched only once. 
On the host, `tulip_loc.sh` is runned in background to download the packets and show on [localhost:3333](https://localhost:3333) the analyzing result.

Then, start the service through `tulip/start.sh`
## RUN DESRUCTIVE FARM 
Destructive farm is used to perform an exploit against all other teams, then it will submit the obtained flags.
Firstly, launch the server through `DestructiveFarm/server/start_server.sh` and connect to [localhost:5000](https://localhost:5000) 
Then, you can launch also the exploit:
```bash
./start_sploit.py my_sploit.py -u http://0.0.0.0:5000
```

## TODO
- Change from bash scripts to Makefile
