# Used our docker image
FROM thevirtualbrain/debian:tvb-buid

# Set the file author
MAINTAINER thevirtualbrain <tvb.admin@codemart.ro>

# Expose the port host
EXPOSE 8080

# Start the application because we already install the tools
# needed for running our application.
CMD ["/bin/bash", "-c", "/opt/conda/bin/python -m tvb.interfaces.web.run WEB_PROFILE tvb.config"]