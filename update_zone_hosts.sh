#!/bin/bash
#Defining Variables
DNS_SERVER="localhost"
DNS_ZONE="lnls-sirius.com.br"

USER_IP=(\
"10.128.151.74,a-m7054b-340342" \
"10.128.150.78,AS-DI-FCTDig" \
"10.128.150.77,AS-DI-FPMDig" \
"10.128.152.57,BO-01D-DI-ScrnCtrl-1" \
"10.128.152.58,BO-01D-DI-ScrnCtrl-2" \
"10.128.150.72,BO-02D-DI-TuneAmpH" \
"10.128.150.73,BO-02D-DI-TuneAmpV" \
"10.128.152.56,BO-02U-DI-ScrnCtrl" \
"10.128.150.53,BO-35D-DI-DCCTDig" \
"10.128.150.76,BO-TUNEPROC-H" \
"10.128.150.103,BO-TUNEPROC-V" \
"10.128.150.69,BO-TuNoiseGen-H" \
"10.128.150.75,BO-TuNoiseGen-V" \
"10.128.153.50,CA-RaTim-CO-CtrlSrv" \
"10.128.153.69,CA-RaTim-CO-IOCSrv" \
"10.128.150.107,CA-Tim-Fout-1" \
"10.128.150.100,CA-Tim-Fout-2" \
"10.128.150.104,CA-Tim-Fout-3" \
"10.128.150.98,CA-Tim-Fout-4" \
"10.128.150.97,CA-Tim-Fout-5" \
"10.128.150.94,IA-01Inj05-EVR" \
"10.128.201.50,IA-01RaBPM-CO-CrateCtrl" \
"10.128.201.51,ia-01rabpm-co-iocsrv" \
"10.128.202.51,IA-02RaBPM-CO-CrateCtrl" \
"10.128.202.50,ia-02rabpm-co-iocsrv" \
"10.128.203.51,IA-03RaBPM-CO-CrateCtrl" \
"10.128.203.52,ia-03rabpm-co-iocsrv" \
"10.128.204.51,IA-04RaBPM-CO-CrateCtrl" \
"10.128.204.52,ia-04rabpm-co-iocsrv" \
"10.128.205.51,IA-05RaBPM-CO-CrateCtrl" \
"10.128.205.50,ia-05rabpm-co-iocsrv" \
"10.128.206.51,IA-06RaBPM-CO-CrateCtrl" \
"10.128.206.50,ia-06rabpm-co-iocsrv" \
"10.128.207.50,IA-07RaBPM-CO-CrateCtrl" \
"10.128.207.52,ia-07rabpm-co-iocsrv" \
"10.128.208.51,IA-08RaBPM-CO-CrateCtrl" \
"10.128.208.50,ia-08rabpm-co-iocsrv" \
"10.128.209.51,IA-09RaBPM-CO-CrateCtrl" \
"10.128.209.50,ia-09rabpm-co-iocsrv" \
"10.128.210.51,IA-10RaBPM-CO-CrateCtrl" \
"10.128.210.52,ia-10rabpm-co-iocsrv" \
"10.128.211.51,IA-11RaBPM-CO-CrateCtrl" \
"10.128.211.50,ia-11rabpm-co-iocsrv" \
"10.128.212.50,IA-12RaBPM-CO-CrateCtrl" \
"10.128.212.51,ia-12rabpm-co-iocsrv" \
"10.128.213.51,IA-13RaBPM-CO-CrateCtrl" \
"10.128.213.50,ia-13rabpm-co-iocsrv" \
"10.128.150.84,IA-14Diag03-EVE" \
"10.128.214.50,IA-14RaBPM-CO-CrateCtrl" \
"10.128.214.51,ia-14rabpm-co-iocsrv" \
"10.128.153.52,IA-14RaDiag03-CO-CtrlSrv" \
"10.128.153.71,IA-14RaDiag03-CO-IOCSrv" \
"10.128.215.51,IA-15RaBPM-CO-CrateCtrl" \
"10.128.215.50,ia-15rabpm-co-iocsrv" \
"10.128.150.109,IA-16BbB-EVE" \
"10.128.153.74,IA-16RaBbB-CO-CtrlSrv" \
"10.128.153.80,IA-16RaBbB-CO-IOCSrv" \
"10.128.150.118,IA-16RaBbB-CO-SerEthConv" \
"10.128.216.50,IA-16RaBPM-CO-CrateCtrl" \
"10.128.216.51,ia-16rabpm-co-iocsrv" \
"10.128.217.51,IA-17RaBPM-CO-CrateCtrl" \
"10.128.217.50,ia-17rabpm-co-iocsrv" \
"10.128.150.74,IA-18Diag04-EVE" \
"10.128.218.51,IA-18RaBPM-CO-CrateCtrl" \
"10.128.218.50,ia-18rabpm-co-iocsrv" \
"10.128.153.53,IA-18RaDiag04-CO-CtrlSrv" \
"10.128.153.70,IA-18RaDiag04-CO-IOCSrv" \
"10.128.150.119,IA-18RaDiag04-CO-SerEthConv" \
"10.128.219.51,IA-19RaBPM-CO-CrateCtrl" \
"10.128.219.50,ia-19rabpm-co-iocsrv" \
"10.128.150.66,IA-20Diag01-EVR" \
"10.128.220.50,IA-20RaBPM-CO-CrateCtrl" \
"10.128.220.51,ia-20rabpm-co-iocsrv" \
"10.128.221.50,IA-20RaBPMTL-CO-CrateCtrl" \
"10.128.221.51,ia-20rabpmtl-co-iocsrv" \
"10.128.153.54,IA-20RaDiag01-CO-CtrlSrv-1" \
"10.128.153.64,IA-20RaDiag01-CO-CtrlSrv-2" \
"10.128.153.68,IA-20RaDiag01-CO-IOCSrv-1" \
"10.128.153.76,IA-20RaDiag01-CO-IOCSrv-2" \
"10.128.153.55,IA-20RaDiag02-CO-CtrlSrv-1" \
"10.128.153.63,IA-20RaDiag02-CO-CtrlSrv-2" \
"10.128.153.73,IA-20RaDiag02-CO-IOCSrv-1" \
"10.128.153.67,IA-20RaDiag02-CO-IOCSrv-2" \
"10.128.150.96,LA-BIRACK2-EVE" \
"10.128.150.93,LA-Ctrl-EVR" \
"10.128.150.95,LA-RFRACK2-EVR" \
"10.128.255.59,lnlsfac-vm" \
"10.128.255.58,lnlsfac-vm2" \
"10.128.150.54,PA-Ctrl-EVR-1" \
"10.128.150.106,PA-Ctrl-EVR-2" \
"10.128.150.111,RA-BO01-EVE" \
"10.128.150.125,RA-MO-EVG" \
"10.128.150.92,RA-MO-Fout" \
"10.128.150.122,RA-SIA01-EVE" \
"10.128.150.110,rssma100a112282" \
"10.128.152.76,SI-01SA-DI-ScrapHCtrl-I" \
"10.128.152.75,SI-01SA-DI-ScrapHCtrl-O" \
"10.128.152.78,SI-01SA-DI-ScrapVCtrl-B" \
"10.128.152.79,SI-01SA-DI-ScrapVCtrl-T" \
"10.128.150.70,SI-01SA-DI-TuneAmpH" \
"10.128.150.52,SI-13C4-DI-DCCTDig" \
"10.128.150.55,SI-14C4-DI-DCCTDig" \
"10.128.150.71,SI-18C4-DI-TuneAmpV" \
"10.128.150.121,SI-TuneProc-H" \
"10.128.150.120,SI-TuneProc-V" \
"10.128.152.63,TB-01-DI-ScrnCtrl-1" \
"10.128.152.50,TB-01-DI-ScrnCtrl-2" \
"10.128.152.62,TB-01-DI-SlitHCtrl-I" \
"10.128.152.61,TB-01-DI-SlitHCtrl-O" \
"10.128.152.59,TB-01-DI-SlitVCtrl-B" \
"10.128.152.60,TB-01-DI-SlitVCtrl-T" \
"10.128.152.51,TB-02-DI-ScrnCtrl-1" \
"10.128.152.53,TB-02-DI-ScrnCtrl-2" \
"10.128.152.52,TB-03-DI-ScrnCtrl" \
"10.128.152.55,TB-04-DI-ScrnCtrl" \
"10.128.152.67,TS-01-DI-ScrnCtrl" \
"10.128.152.69,TS-02-DI-ScrnCtrl" \
"10.128.152.68,TS-03-DI-ScrnCtrl" \
"10.128.152.70,TS-04-DI-ScrnCtrl-1" \
"10.128.152.71,TS-04-DI-ScrnCtrl-2" \
"10.128.152.74,TS-04-DI-ScrnCtrl-3" \
"10.128.255.57,Vac-OPI" \
)

for user_ip in ${USER_IP[*]}; do

    OLDIFS=$IFS; IFS=',';
    # Separate "tuple" arguments with positional notation
    set -- ${user_ip};
    ip=$1
    name=$2

    USER_NAME="$name"
    IP="$ip"
    TTL="1800"
    RECORD="$USER_NAME.$DNS_ZONE. $TTL A $IP"

    echo "
    server $DNS_SERVER
    zone $DNS_ZONE
    debug
    update add $RECORD
    show
    send" | nsupdate -y DDNS_UPDATE:hM+cKNLDL1moAynhQwmr8Q==

done
    
