#!/bin/bash

# удаляем openjdk 
sudo apt purge openjdk-\* 
# создаем папку под джава
sudo mkdir -p /usr/local/java
# распаковываем архив в нее
sudo tar -xzf $2 -C /usr/local/java

# прописываем пути к джава
sudo echo "JAVA_HOME=/usr/local/java/$1" >> /etc/profile
sudo echo 'JRE_HOME=$JAVA_HOME/jre' >> /etc/profile
sudo echo 'PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin' >> /etc/profile
sudo echo "export JAVA_HOME" >> /etc/profile
sudo echo "export JRE_HOME" >> /etc/profile
sudo echo "export PATH" >> /etc/profile

# Эта команда уведомляет систему, что Oracle Java JRE доступна для использования.
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/$1/bin/java" 1
# Эта команда уведомляет систему, что Oracle Java JDK доступна для использования.
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/$1/bin/javac" 1
# Эта команда уведомляет систему, что Web Start Oracle Java доступна для использования.
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/$1/bin/javaws" 1
# Эта команда установит среду исполнения Java.
sudo update-alternatives --set java /usr/local/java/$1/bin/java
# Эта команда установит компилятор Javac.
sudo update-alternatives --set javac /usr/local/java/$1/bin/javac
# Эта команда установит Java Web start.
sudo update-alternatives --set javaws /usr/local/java/$1/bin/javaws
# Перезагрузить системный файл /etc/profile следующей командой
. /etc/profile
