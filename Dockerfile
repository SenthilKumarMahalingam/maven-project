FROM tomcat:latest

ADD ./webapp/target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]

RUN docker run -it -p 8383:8080 tomcatwebapp:7