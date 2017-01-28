FROM centos:centos7
MAINTAINER htanaka0828 <htanaka0828@gmail.com>


RUN yum -y update

# 文字コード設定
RUN yum -y reinstall glibc-common
RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo "";
env LANG=ja_JP.UTF-8
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# パッケージのinstall
RUN yum -y install git vim sudo tar wget mlocate

RUN yum install -y epel-release
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

RUN yum -y install httpd
RUN yum -y install mysql mysql-devel
RUN yum -y install --enablerepo=remi,remi-php56 php php-devel php-mbstring php-pdo php-gd php-mysql php-xml

# httpdのconf設定
COPY stat/php.ini /etc/php.ini
COPY stat/httpd.conf /etc/httpd/conf/
COPY stat/app.conf /etc/httpd/conf.d/
RUN rm -f /etc/httpd/conf.d/welcome.conf

# composerのinstall
RUN curl -sS https://getcomposer.org/installer | sudo php
RUN mv composer.phar /usr/local/bin/composer

EXPOSE 80

CMD /sbin/init
