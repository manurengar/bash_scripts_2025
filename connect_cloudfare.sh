#!/bin/bash
# Connect to cloudfare DSN

echo  "Execute command: nmcli connection show"
echo -n  "Now input the name of the connection:"
read con

connection_name=$(nmcli connection show | grep -m 1 $con)
echo "Connection retrieved ${connection_name}."
connection_name="${connection_name%% *}"
if [ -z "$connection_name" ]; then
	echo "No connection name was found"
	exit 1
fi
echo "Connection name: ${connection_name}"

DNS_NAME_1=$(nmcli dev show | grep -m 1 DNS)
DNS_NAME_1=${DNS_NAME_1##* }
DNS_NAME_2=$(nmcli dev show | grep -m 2 DNS)
DNS_NAME_2=${DNS_NAME_2##* }
echo "Current values of DNS are:"
echo "DNS[1]: ${DNS_NAME_1}"
echo "DNS[2]: ${DNS_NAME_2}"

echo ""
echo -n "Do you want to proceed? (Y/n)"
read proceed
if [ "$proceed" == "n"  ]; then
	echo "Cancelled"
	exit 1;
fi


nmcli connection modify "${connection_name}" ipv4.dns "1.1.1.1 1.1.0.1"
nmcli connection modify "${connection_name}" ipv4.ignore-auto-dsn yes

# Apply connection
nmcli connection down "${connection_name}" && nmcli connection up "${connection_name}"

# New connection
DNS_NAME=$(nmcli dev show | grep DNS)
echo "Updated DNS values: ${DNS_NAME}"
