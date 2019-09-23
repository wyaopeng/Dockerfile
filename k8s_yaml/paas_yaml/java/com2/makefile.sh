#!/bin/bash
dos2unix java.txt
while read line
do
#创建项目文件夹
  if [ ! -e "./$line/" ];then
  mkdir ./$line/ -p
  else
  echo "project folder exsit"
  fi
#基于com的template.yaml 生成项目yaml
  if [ ! -e "./$line/$line.yaml" ];then
  cat template.yaml > ./$line/$line.yaml
  sed -i "s/templateapp2/$line/g" `grep templateapp2 -rl ./$line/$line.yaml`
  sed -i "s/8080/80$(grep -n "$line" java.txt | cut -d ":" -f 1)/g" `grep 8080 -rl ./$line/$line.yaml`
  cp ./Dockerfile ./$line/
  cp ./context.xml ./$line/
  else
  echo "yaml file exsit"
  fi
#创建catalina.sh的配置文件
  if [ ! -e "./$line/catalina.sh" ];then
  cp ./catalina.sh ./$line/catalina.sh
  chmod u+x ./$line/catalina.sh
  else
  echo "catalina.sh exsit"
  fi
#创建server.xml文件
  if [ ! -e "./$line/server.xml" ];then
  cp server.xml ./$line/server.xml
  sed -i "s/8080/80$(grep -n "$line" java.txt | cut -d ":" -f 1)/g" `grep 8080 -rl ./$line/server.xml`
  sed -i "s/8005/81$(grep -n "$line" java.txt | cut -d ":" -f 1)/g" `grep 8005 -rl ./$line/server.xml`
  sed -i "s/8009/82$(grep -n "$line" java.txt | cut -d ":" -f 1)/g" `grep 8009 -rl ./$line/server.xml`
  else
  echo "folder exsit"
  fi
#创建redis配置文件
  if [ ! -e "./$line/cache.properties" ];then
  cp cache.properties ./$line/
  else
  echo "redis config file exsit"
  fi
#创建配置文件
  if [ ! -e "./$line/laser.properties" ];then
  mkdir ./$line/ -p
  cp templateconfig.properties ./$line/laser.properties
  sed -i "s/templateapp/$line/g" `grep templateapp -rl ./$line/laser.properties`
  sed -i "s/8080/80$(grep -n "$line" java.txt | cut -d ":" -f 1)/g" `grep 8080 -rl ./$line/laser.properties`
  else
  echo "laser.properties exsit"
  fi
#基于java.txt的行号创建对应的cluster-ip
  sed -i "s/appip/$(grep -n "$line" java.txt | cut -d ":" -f 1)/g" `grep appip -rl ./$line/$line.yaml`
done  < ./java.txt
cp search.properties ./com-es2/
#修改ctest.yaml
  sed -i "s/8080/805/g" `grep 8080 -rl ./com-ctest2/com-ctest2.yaml`
#修改ctest的server文件
  sed -i "s/8080/805/g" `grep 8080 -rl ./com-ctest2/server.xml`
  sed -i "s/8005/815/g" `grep 8005 -rl ./com-ctest2/server.xml`
  sed -i "s/8009/825/g" `grep 8009 -rl ./com-ctest2/server.xml`
  sed -i "s/8080/805/g" `grep 8080 -rl ./com-ctest2/laser.properties`
  for i in */*.yaml;do sed -i '23s/2//' $i;done
  for i in */laser.properties; do sed -i '2s/2//' $i;done
  for i in */laser.properties; do sed -i '1s/2//' $i;done
  for i in */*.yaml;do sed -i '28s/2//' $i;done
  for i in */*.yaml;do sed -i '35s/2//' $i;done
