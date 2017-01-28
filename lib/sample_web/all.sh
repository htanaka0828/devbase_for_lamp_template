#!/bin/bash

../common/docker-restart.sh httpd
../common/wait-proc.sh httpd

sudo chown vagrant:vagrant -R /opt/src/sample

if [ ! -f /opt/src/sample/index.php ]; then
  echo "<?php echo 'こんにちは<br>やさしいせかい！！';" > /opt/src/sample/index.php
fi

# httpの起動
docker exec -d sampleweb_httpd_1 systemctl start httpd
