FROM centos:latest
MAINTAINER YEB
RUN yum install -y java-1.8.0-openjdk-devel.x86_64
RUN yum install -y tomcat
RUN yum install -y which
RUN mkdir /logs/
ENV NAME mama
ADD http://52.29.97.136:8081/artifactory/libs-snapshot-local/org/springframework/samples/spring-petclinic-YEB007/1.1.0-SNAPSHOT/spring-petclinic-YEB007-1.1.0-20160602.114323-1.war /usr/share/tomcat/webapps
CMD tomcat start && tail -F /logs/catalina.out
