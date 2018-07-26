# Set the base image to used
FROM continuumio/miniconda

# Set the file author
MAINTAINER thevirtualbrain <tvb.admin@codemart.ro>

# Copy our bash file from current host directory to /opt docker gust.
COPY source-build.sh /opt

# Goto our /opt directory and start our bash file
RUN ./opt/source-build.sh

# Expose the port to host
EXPOSE 8080

# Setup application
CMD ["/bin/bash", "-c", "/opt/conda/bin/python -m tvb.interfaces.web.run WEB_PROFILE tvb.config"]
