# Set the base image to used
FROM continuumio/miniconda

# Set the file author
MAINTAINER thevirtualbrain <tvb.admin@codemart.ro>

# Install linux-headers and some build tools
RUN apt-get -y update
RUN apt-get -y install linux-headers-amd64 build-essential libc-dev gcc

# Configure conda-forge as one of conda channels
RUN conda config --add channels conda-forge
# Install all the third party tools needed for tvb packages
RUN conda install networkx numpy numba numexpr matplotlib \
                  pytest scikit-learn scipy cython \
		  BeautifulSoup4 cfflib cherrypy formencode genshi \
                  h5py networkx nibabel Pillow psutil pytest simplejson \
		  sqlalchemy sqlalchemy-migrate
# Install the remaining 3rd party tools that does not exit on any conda channels
# via python pypi	  
RUN pip install jaraco.functools allensdk

# Copy our bash file from current host directory to /opt docker gust.
COPY tvb-build.sh /opt

# Goto our /opt directory and start our bash file
RUN cd /opt && /bin/bash tvb-build.sh
