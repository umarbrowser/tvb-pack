#!/bin/bash

# Clear the terminal
clear

# Install linux-headers and some build tools
apt-get -y update
apt-get -y install linux-headers-amd64 build-essential libc-dev gcc

# Configure conda-forge as one of conda channels
conda config --add channels conda-forge
# Install all the third party tools needed for tvb packages
conda install networkx numpy numba numexpr matplotlib \
                  pytest scikit-learn scipy cython \
		  BeautifulSoup4 cfflib cherrypy formencode genshi \
                  h5py networkx nibabel Pillow psutil pytest simplejson \
		  sqlalchemy sqlalchemy-migrate
# Install the remaining 3rd party tools that does not exit on any conda channels
# via python pypi	  
pip install jaraco.functools allensdk

# Move to /opt directory and git clone tvb-data
cd /opt && git clone https://github.com/the-virtual-brain/tvb-data.git
# Install it because it does not require any unittest
cd /opt/tvb-data && python setup.py install
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cd /opt && rm -r /tvb-data

# Move to /opt directory and git clone tvb-geodesic
cd /opt && git clone https://github.com/the-virtual-brain/tvb-geodesic.git
# Install it because it does not require any unittest
cd /opt/tvb-geodesic && python setup.py install
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cd /opt && rm -r /tvb-geodesic

# Move to /opt directory and git clone tvb-library
cd /opt && git clone https://github.com/the-virtual-brain/tvb-library.git
# run the pytest for the require unittest
cd /opt/tvb-library
pytest tvb/test
# Install it
python setup.py install
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cd /opt && rm -r /tvb-library

# Move to /opt directory and git clone tvb-framework
cd /opt && git clone https://github.com/the-virtual-brain/tvb-framework.git
# run the pytest for the require unittest
cd /opt/tvb-framework
pytest tvb/tests/framework/interfaces/web/controllers/help_controller_test
# Install it
python setup.py install
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cd /opt && rm -r /tvb-framework
