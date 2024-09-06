#!/bin/sh

# Check if certificates already exist
if [ ! -f /etc/letsencrypt/live/fullchain.pem ]; then
    # Obtain the certificate
    certbot certonly --nginx --noninteractive --agree-tos --register-unsafely-without-email -d idptest.server.ivy-cloud.com
fi

# Start crond for certificate renewal
crond

# Renew certificates every 12 hours
echo "0 */12 * * * certbot renew --quiet" | crontab -

# Start Nginx
exec "$@"