mkdir -p /var/reviewbot/tools
cd /var/reviewbot/tools
wget https://github.com/pmd/pmd/releases/download/pmd_releases%2F6.17.0/pmd-bin-6.17.0.zip
unzip pmd-bin-6.17.0.zip
rm pmd-bin-6.17.0.zip
echo "export PATH=/var/reviewbot/tools/pmd-bin-6.17.0/bin/:$PATH">>~/.bashrc
mkdir -p /etc/xdg/reviewbot/
touch /etc/xdg/reviewbot/config.py
echo "pmd_path = '/var/reviewbot/tools/pmd-bin-6.17.0/bin/run.sh'" >> /etc/xdg/reviewbot/config.py

cd /var/reviewbot/tools
mkdir checkstyle
cd checkstyle
wget -O checkstyle.jar https://search.maven.org/remotecontent?filepath=com/puppycrawl/tools/checkstyle/8.23/checkstyle-8.23.jar
chmod +x checkstyle.jar
echo "export PATH=/var/reviewbot/tools/checkstyle/checkstyle.jar:$PATH">>~/.bashrc
echo "checkstyle_path = '/var/reviewbot/tools/checkstyle/checkstyle.jar'" >> /etc/xdg/reviewbot/config.py
cd 
reviewbot worker -b amqp://reviewbot_worker:reviewbot_worker@"$RABBITMQ_HOST":5672/