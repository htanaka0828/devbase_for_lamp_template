#!/bin/bash

if [ ! -d /opt/src/sample ]; then
  mkdir /opt/src/sample
fi

if [ ! -f /opt/src/sample/index.php ]; then
  echo "<?php echo 'こんにちは<br>やさしいせかい！！';" > /opt/src/sample/index.php
  sudo chown vagrant:vagrant -R /opt/src/sample
fi

../common/docker-restart.sh my_php
