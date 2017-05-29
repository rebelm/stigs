
#!/bin/bash

RANDOM_PASS=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;)

sed -i -e "s/public/${RANDOM_PASS}/g" /etc/snmp/snmpd.conf
sed -i -e "s/private/${RANDOM_PASS}/g" /etc/snmp/snmpd.conf
