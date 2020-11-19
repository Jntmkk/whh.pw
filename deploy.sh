export groupId=$(mvn org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate -Dexpression=project.groupId -q -DforceStdout)
export artifactId=$(mvn org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate -Dexpression=project.artifactId -q -DforceStdout)
export version=$(mvn org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate -Dexpression=project.version -q -DforceStdout)
export filename="${artifactId}"-"${groupId}"-"${version}"

h=$(ps -aux | grep -v grep | grep "${filename}" | awk '{print $2}')
if [ -n "$h" ]; then
  kill -9 h
fi
nohup /usr/lib/jvm/java-8-openjdk-amd64/bin/java -jar /var/lib/jenkins/workspace/whh.pw/target/"${filename}".jar --spring.pofiles.active=prod >/var/log/main.log 2>&1 &
echo $! >service.pid
