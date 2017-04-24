
#! /bin/bash

##agregar non-free y contrib a repositorios. 
## /etc/apt/sources.list
##deb http://packages.dotdeb.org jessie all
##deb-src http://packages.dotbed.org jessie all
##update.

apt-get install apache2 
apt-get install mysql-server
mysql -u root -p
mysql>CREATE DATABASE dbname DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
mysql>GRANT ALL PRIVILEGES ON dbname.* TO 'dbuser'@'localhost' IDENTIFIED BY 'dbpass';
mysql>exit

apt-get install php7.0
apt-get install php7.0-gd php7.0-mysql 
apt-get install php7.0-cURL php7.0-xmlrpc php7.0-intl
apt-get install php7.0-json
apt-get install php7.0-cli -y
apt-get install php7.0-zip
apt-get install php7.0-xml
service apache2 restart

//TOCAR EL ARCHIVO /etc/php/7.0/apache2/php.ini
// descomentar(sacar el ;) en la linea que diga 'extension=php_curl.dll'


/etc/init.d/apache2 restart
cd /var/www/html/
mkdir moodle
cd moodle/
apt-get install git
git clone https://github.com/moodle/moodle.git
/////otra foirma, por FTP
apt-get install zip -y
unzip -o moodle-latest-32.zip 
/////
mkdir /var/moodledata
chown www-data /var/moodledata/
mysql -u dbuser -p
cd www/html/
chown -R www-data /var/www/html/moodle

//Solo en la instalacion se debe ejecutar:
chmod -R 777 /var/www/*
chown -R www-data: var/www/

//Instalñacion por la web
// SHOW VARIABLES WHERE Variable_name IN ('hostname','port'); para saber puerto


##Ejecutar script
php /var/www/hyml/moodle/admin/cli/install.php
#despues de ejecutarlo este generara un archivo llamado 'config.php' se le debe asignar propietario a www-data (apache) apra que se lo pueda ejecutar desde el cliente.

##HASTA ACA FUNCIONANDO

#Agregando para que envie mails
apt-get install sendmail
apt-get install ssmtp

#/etc/ssmtp/ssmtp.conf
##UseSTARTTLS=YES
##UseTLS=Yes
##root=direcioncorreo@gmail.com
##mailhub=smtp.gmail.com:587
##hostname=localhost
##FromLineOverride=YES
##AuthUser=direcioncorreo
##AuthPass=contraseñadedirecioncorreo
###Se debe tener una cuenta, para poder enviar 
##mail desde esa cuenta se debe tener activada la opcion
##para Aplicaciones menos seguras.
##https://myaccount.google.com/lesssecureapps

