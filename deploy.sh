#!/bin/sh
export BUILD_ID=dontKillMe
export groupId=$(mvn org.apache.maven.plugins:maven-help-plugin:evaluate -Dexpression=project.groupId -q -DforceStdout)
export artifactId=$(mvn org.apache.maven.plugins:maven-help-plugin:evaluate -Dexpression=project.artifactId -q -DforceStdout)
export version=$(mvn org.apache.maven.plugins:maven-help-plugin:evaluate -Dexpression=project.version -q -DforceStdout)
export filename="${artifactId}"-"${version}"
echo "filename is : " "$filename"
h=$(ps -aux | grep -v grep | grep "${filename}" | awk '{print $2}')
if [ -n "$h" ]; then
  kill -9 "$h"
  echo "stop service done"
  else
    echo "did not run service"
fi
nohup /usr/lib/jvm/java-8-openjdk-amd64/bin/java -jar /var/lib/jenkins/workspace/whh.pw/target/"${filename}".jar --spring.profiles.active=prod >/var/log/main.log 2>&1 &
echo "deploy done"
echo $! >service.pid
