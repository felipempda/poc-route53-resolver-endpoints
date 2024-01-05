#!/bin/bash
insta="$(terraform output -raw vpca-instance-public-dns)"
instb="$(terraform output -raw vpcb-instance-public-dns)"

inboundipa="$(terraform output -raw vpca-inbound-resolver-ipA)"
inboundipb="$(terraform output -raw vpca-inbound-resolver-ipB)"

privateZone="environment-a.private.com"
cname="google"
entry="${cname}.${privateZone}"

sshremote() {
    server=$1
    command=$2
    echo "\$ $command" ; eval "ssh -o StrictHostKeyChecking=no  $server $command" ;
}

echo "===================================================="
echo "Test DNS resolution from Environment A"
echo "===================================================="
sshremote "ubuntu@${insta}" "nslookup ${entry}"
sshremote "ubuntu@${insta}" "nslookup ${entry} ${inboundipa}"

echo "===================================================="
echo "Test DNS resolution from Environment B"
echo "===================================================="
sshremote "ubuntu@${instb}" "nslookup ${entry}"
sshremote "ubuntu@${instb}" "nslookup ${entry} ${inboundipa}"
