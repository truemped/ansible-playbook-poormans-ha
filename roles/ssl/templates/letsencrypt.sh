
#!/bin/bash

set -e

cd /storage/shared/ssl

function run_acme_client {
    LE=$(/root/simp_le/venv/bin/simp_le --email mail@example.com -f account_key.json -f fullchain.pem -f key.pem -d example.com -d host1.example.com -d host2.example.comz --default_root /storage/shared/ssl/ > /var/log/letsencrypt.log)
}

function restart_services {
    systemctl reload nginx
}

run_acme_client

if [ $? -eq 0 ]
then
    echo "Certificate created"
    restart_services
elif [ $? -eq 1 ]
then
    echo "Certificates up to date"
elif [ $? -eq 2 ]
then
    echo "Errors during letsencrypt"
fi
