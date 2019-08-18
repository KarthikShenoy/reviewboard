mkdir -p /var/reviewbot/tools
cd /var/reviewbot/tools
wget https://github.com/pmd/pmd/releases/download/pmd_releases%2F6.17.0/pmd-bin-6.17.0.zip
unzip pmd-bin-6.17.0.zip
rm pmd-bin-6.17.0.zip
echo "export PATH=//var/reviewbot/tools/pmd-bin-6.17.0/bin/:$PATH">>~/.bashrc
mkdir -p /etc/xdg/reviewbot/
touch /etc/xdg/reviewbot/config.py
echo "pmd_path = '/var/reviewbot/tools/pmd-bin-6.17.0/bin/run.sh'" >> /etc/xdg/reviewbot/config.py
reviewbot worker -b amqp://reviewbot_worker:reviewbot_worker@"$RABBITMQ_HOST":5672/