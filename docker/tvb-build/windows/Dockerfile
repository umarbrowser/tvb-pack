# Set the base image to use
FROM microsoft/windowsservercore:latest

# Set the file author
MAINTAINER thevirtualbrain <tvb.admin@codemart.ro>

# Install Chocolatey
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
# Install packages that we will want
RUN choco install git.install python2 -y

# Install 3rd party tools using pypi
RUN pip install networkx numpy numba numexpr matplotlib \
                  pytest scikit-learn scipy cython wheel \
		  BeautifulSoup4 cfflib cherrypy formencode genshi \
                  h5py networkx nibabel Pillow psutil pytest simplejson \
		  sqlalchemy sqlalchemy-migrate jaraco.functools allensdk virtualenv

# Move to C directory and create a opt directory
RUN cd C:\ & mkdir opt

# Create a virtual env for our building development
RUN virtualenv tvb_distribution
# Activate it
RUN tvb_distribution\Scripts\activate

# Move to \opt directory and git clone tvb-data
RUN cd C:\opt & git clone https://github.com/the-virtual-brain/tvb-data.git
# Install it because it does not require any unittest
RUN cd \tvb-data
# build the .whl
RUN python setup.py bdist_wheel
RUN pip install dist\*.whl
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
RUN cd C:\opt & rmdir tvb-data

# Move to \opt directory and git clone tvb-geodesic
RUN cd C:\opt & git clone https://github.com/the-virtual-brain/tvb-geodesic.git
# Install it because it does not require any unittest
RUN cd C:\opt\tvb-geodesic
# build the .whl
RUN python setup.py bdist_wheel
RUN pip install dist\*.whl
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
RUN cd C:\opt & rmdir tvb-geodesic

# Move to \opt directory and git clone tvb-library
RUN cd C:\opt & git clone https://github.com/the-virtual-brain/tvb-library.git
# run the pytest for the require unittest
RUN cd C:\opt\tvb-library
RUN pytest tvb\test
# build the .whl
RUN python setup.py bdist_wheel
RUN pip install dist\*.whl
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
RUN cd C:\opt & rmdir tvb-library

# Move to \opt directory and git clone tvb-framework
RUN cd C:\opt & git clone https://github.com/the-virtual-brain/tvb-framework.git
# run the pytest for the require unittest
RUN C:\opt\tvb-framework\
RUN pytest tvb\tests\ramework\interfaces\web\controllers\help_controller_test
# build the .whl
RUN python setup.py bdist_wheel
RUN pip install dist\*.whl
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
RUN cd C:\opt\ && rmdir tvb-framework
