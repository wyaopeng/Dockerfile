#!/bin/bash
dos2unix java.txt
while read line
do
#创建项目文件夹
  if [ ! -e "/data/project/paas/java/com/$line/" ];then
  mkdir /data/project/paas/java/com/$line/ -p
  else
  echo "project folder exsit"
  fi
#创建日志文件夹
  if [ ! -e "/log/paas/java/$line/" ];then
  mkdir /log/paas/java/$line/app -p
  mkdir /log/paas/java/$line/tomcat -p
  else
  echo "log folder exsit"
  fi

#基于com的template.yaml 生成项目yaml
  cat template.yaml > ./$line/$line.yaml
  sed -i "s/templateapp/$line/g" `grep -w templateapp -rl ./$line/$line.yaml`
  sed -i "s/8080/80$(grep -n "$line" java.txt | cut -d ":" -f 1)/g" `grep 8080 -rl /data/project/paas/java/com/$line/$line.yaml`
  sed -i "s/38080/380$(grep -n "$line" java.txt | cut -d ":" -f 1)/g" `grep 38080 -rl /data/project/paas/java/com/$line/$line.yaml`
  cp ./Dockerfile /data/project/paas/java/com/$line/
#创建catalina.sh的配置文件
  if [ ! -e "/data/project/paas/java/com/$line/catalina.sh" ];then
  cp ./catalina.sh /data/project/paas/java/com/$line/catalina.sh
  chmod u+x /data/project/paas/java/com/$line/catalina.sh
  else
  echo "catalina.sh exsit"
  fi
#创建server.xml文件
  if [ ! -e "/data/project/paas/java/com/$line/server.xml" ];then
  cp server.xml /data/project/paas/java/com/$line/server.xml
  sed -i "s/8080/80$(grep -n "$line" java.txt | cut -d ":" -f 1)/g" `grep 8080 -rl /data/project/paas/java/com/$line/server.xml`
  sed -i "s/8005/81$(grep -n "$line" java.txt | cut -d ":" -f 1)/g" `grep 8005 -rl /data/project/paas/java/com/$line/server.xml`
  sed -i "s/8009/82$(grep -n "$line" java.txt | cut -d ":" -f 1)/g" `grep 8009 -rl /data/project/paas/java/com/$line/server.xml`
  else
  echo "folder exsit"
  fi
#创建redis配置文件
  if [ ! -e "/data/project/paas/java/com/$line/cache.properties" ];then
  cp cache.properties /data/project/paas/java/com/$line/
  else
  echo "redis config file exsit"
  fi
#创建配置文件
  if [ ! -e "/data/project/paas/java/com/$line/laser.properties" ];then
  mkdir /data/project/paas/java/com/$line/ -p
  cp templateconfig.properties /data/project/paas/java/com/$line/laser.properties
  sed -i "s/templateapp/$line/g" `grep -w templateapp -rl ./$line/laser.properties`
  sed -i "s/8080/80$(grep -n "$line" java.txt | cut -d ":" -f 1)/g" `grep 8080 -rl /data/project/paas/java/com/$line/laser.properties`
  kubectl create configmap $line.properties --from-file=/data/project/paas/java/com/$line/laser.properties
  else
  echo "laser.properties exsit"
  fi
#基于java.txt的行号创建对应的cluster-ip
  sed -i "s/appip/$(grep -n "$line" java.txt | cut -d ":" -f 1)/g" `grep appip -rl ./$line/$line.yaml`
done  < ./java.txt
cp search.properties ./com-es/
#修改ctest.yaml
  sed -i "s/8080/805/g" `grep 8080 -rl ./com-ctest/com-ctest.yaml`
  sed -i "s/appip/5/g" `grep appip -rl ./com-ctest/com-ctest.yaml`
#修改ctest的server文件
  sed -i "s/8080/805/g" `grep 8080 -rl ./com-ctest/server.xml`
  sed -i "s/8005/815/g" `grep 8005 -rl ./com-ctest/server.xml`
  sed -i "s/8009/825/g" `grep 8009 -rl ./com-ctest/server.xml`
  sed -i "s/8080/805/g" `grep 8080 -rl ./com-ctest/laser.properties`
