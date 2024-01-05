#!/bin/bash
insta="$(terraform output -raw vpca-instance-public-dns)"
instb="$(terraform output -raw vpcb-instance-public-dns)"

inboundipa="$(terraform output -raw vpca-inbound-resolver-ipA)"
inboundipb="$(terraform output -raw vpca-inbound-resolver-ipB)"

privateZone="environment-a.private.com"
cname="google"
entry="${cname}.${privateZone}"

exe() { echo "\$ $@" ; "$@" ; }

echo "===================================================="
echo "Test DNS resolution from Environment A"
echo "===================================================="
exe ssh -o StrictHostKeyChecking=no  ubuntu@${insta}    nslookup ${entry}
exe ssh -o StrictHostKeyChecking=no  ubuntu@${insta}    nslookup ${entry} ${inboundipa}

echo "===================================================="
echo "Test DNS resolution from Environment B"
echo "===================================================="
exe ssh -o StrictHostKeyChecking=no  ubuntu@${instb}    nslookup ${entry}
exe ssh -o StrictHostKeyChecking=no  ubuntu@${instb}    nslookup ${entry} ${inboundipa}
