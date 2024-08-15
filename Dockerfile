# Use the official Tomcat image as the base image
FROM tomcat:8.5.100-jdk8

# Copy the web application war file to the webapps directory in Tomcat
COPY webapps/ /usr/local/tomcat/webapps/

# Copy the library files to the lib directory in Tomcat
COPY lib/ /usr/local/tomcat/lib/

COPY conf/logging.properties /usr/local/tomcat/conf/

# Copy the data files to a directory in the Tomcat container
COPY lims/ /lims/lib


# Expose the default Tomcat port
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
