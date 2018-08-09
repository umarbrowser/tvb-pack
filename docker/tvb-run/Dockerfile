# Set the base image to used
FROM continuumio/miniconda

# Set the file author
MAINTAINER thevirtualbrain <tvb.admin@codemart.ro>

# Download tvb package
RUN apt-get -y update
RUN apt-get -y install linux-headers-amd64 build-essential libc-dev gcc

RUN conda config --add channels conda-forge
RUN conda install tvb-framework -y
RUN conda install matplotlib=2.0.2
RUN pip install jaraco.functools allensdk

# Setup application
CMD ["/bin/bash", "-c", "/opt/conda/bin/python -m tvb.interfaces.web.run WEB_PROFILE tvb.config"]
