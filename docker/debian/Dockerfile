# Set the base image to used
FROM continuumio/miniconda

# Set the file author
MAINTAINER thevirtualbrain <tvb.admin@codemart.ro>

# Download tvb package
RUN apt-get -y update
RUN apt-get -y install linux-headers-amd64 build-essential libc-dev gcc

RUN conda config --add channels conda-forge
# Some times when you have a limmited internet connection
# The installation of the entire tvb-fraework is around
# 577MB that why i break it in to two form and the download will not fail
RUN conda install mkl -y
RUN conda install tvb-framework -y
RUN pip install jaraco.functools

# Setup application
CMD ["/bin/bash", "-c", "/opt/conda/bin/python -m tvb.interfaces.web.run WEB_PROFILE tvb.config"]
