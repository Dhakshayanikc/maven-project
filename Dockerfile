FROM tomcat:8.0

ADD ./webapp/target/*.war D:/Baxalta/apache-tomcat-7.0.81-windows-x64/apache-tomcat-7.0.81/webapps/

EXPOSE 8080

CMD ["cataline.sh","run"]