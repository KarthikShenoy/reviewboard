mkdir -p /var/www/
while ! mysqladmin ping -h"$DBHOST" --silent; do
    sleep 1
done
echo "ServerName localhost" >> /etc/apache2/apache2.conf
apache2ctl restart
# CONFFILE=/var/www/reviewboard/conf/settings_local.py


    rb-site install --noinput \
        --domain-name="localhost" \
        --site-root="/" \
        --static-url=static/ --media-url=media/ \
        --db-type=mysql \
        --db-name="reviewboard" \
        --db-host="$DBHOST" \
        --db-user="$DBUSER" \
        --db-pass="$DBPASSWORD" \
        --cache-type=memcached --cache-info="$MEMCACHED" \
        --web-server-type=apache --python-loader=wsgi \
        --admin-user=admin --admin-password=admin --admin-email=admin@example.com \
        /var/www/reviewboard/
rb-site upgrade /var/www/reviewboard
chown www-data:www-data -R /var/www/reviewboard/data /var/www/reviewboard/htdocs/
ls -la /var/www/reviewboard/conf/
ls -la /var/www/reviewboard/htdocs/
cp /var/www/reviewboard/conf/apache-wsgi.conf /etc/apache2/sites-available/rb.conf
cd /etc/apache2/sites-enabled/
ln -s ../sites-available/rb.conf

rm /etc/apache2/sites-enabled/000-default.conf
apache2ctl stop
apache2ctl -DFOREGROUND