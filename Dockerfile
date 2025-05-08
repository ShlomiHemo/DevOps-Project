# Use official Tomcat base image with JDK 17
FROM tomcat:10.1-jdk17

# Clean default webapps (like ROOT, docs, examples)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR or webapp folder into Tomcat
COPY . /usr/local/tomcat/webapps/ROOT/

# Expose port 8080
EXPOSE 8080

# Start Tomcat (already defined in base image)
CMD ["catalina.sh", "run"]
