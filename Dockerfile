# Use official Tomcat base image with JDK 17
FROM tomcat:10.1-jdk17

# Clean default webapps (like ROOT, docs, examples)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from the target directory to Tomcat's webapps
COPY target/shlomihemo-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/shlomihemo.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
