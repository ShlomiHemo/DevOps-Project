FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:8.5-jdk8
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/shlomihemo-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/shlomihemo.war
EXPOSE 8080
CMD ["catalina.sh", "run"]