sudo apt-get update -qq
sudo apt-get install -y -qq libssh2-1-dev libssh2-php
whoami
echo `whoami`":1234" | sudo chpasswd

sudo netstat -lntup

ROOT_DIR=/home/travis/build/ET-NiK/GameAP

# Make files
sudo mkdir ${ROOT_DIR}/Files
sudo chmod 777 ${ROOT_DIR}/Files

echo FILE_CONTENTS >> ${ROOT_DIR}/Files/File01.txt
echo FILE_CONTENTS >> ${ROOT_DIR}/Files/File02.txt
sudo chmod 666 ${ROOT_DIR}/Files/File01.txt
sudo chmod 666 ${ROOT_DIR}/Files/File02.txt

phpunit --version

mv ${ROOT_DIR}/tests/Test.php ${ROOT_DIR}/upload/application/controllers/Test.php
mv ${ROOT_DIR}/tests/gameap_config.php ${ROOT_DIR}/upload/application/config/gameap_config.php
phpunit --configuration ${ROOT_DIR}/tests/phpunit-dbinst.xml

phpunit --configuration ${ROOT_DIR}/tests/phpunit.xml
exit $?
