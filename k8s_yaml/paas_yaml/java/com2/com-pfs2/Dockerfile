from registry-vpc.cn-shanghai.aliyuncs.com/qianjian/tomcat7.0.9
RUN rm -rf /usr/local/tomcat/webapps/*
ADD ./ROOT.war /usr/local/tomcat/webapps/
#设置环境变量
ENV LC_ALL en_US.utf8
ENV JAVA_HOME /usr/local/jdk1.7.0_80
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]

