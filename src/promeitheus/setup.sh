#!/bin/bash
set -e

outputtext=""

# sudo chmod +x filename

#To add or modifies the password for user tom
#htpasswd /home/pwww/.htpasswd-users tom
output () {
    echo $outputtext
}


genusername () {
    BUILD_ID="5555"
    export username="prom"$BUILD_ID
    export outputtext="User:"$username
    output
}


genworkdir (){
    export workdir="./"$username
    mkdir -p $workdir
    export outputtext=$workdir" Directory Created "
    output

}

gensecrets () {
    htpasswd -c $workdir/.hideme $username
    export outputtext="Secrets Created"
    output

}

genewebyml () {
    echo "tls_server_config:" >> web.yml
    echo "  cert_file: /path/to/mycert.pem" >> web.yml
    echo "  key_file: /path/to/mykey.pem" >> web.yml
    echo "basic_auth_users:" >> web.yml
    cat $workdir/.hideme >> web.yml

}

cleanup1 () {
    rm $workdir/.hideme
    export outputtext="Secrets Deleted"

    rm -d $workdir
    export outputtext=$workdir" Directory Deleted "
    output
}


Debugrun () {
    genusername
    genworkdir
    gensecrets
    genewebyml
    
}

Debugrun