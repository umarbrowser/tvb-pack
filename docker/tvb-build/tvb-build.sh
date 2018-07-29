#!/bin/bash
# Clear the terminal
clear

# Create a virtual env for our building development
virtualenv tvb_distribution
# Activate it
source tvb_distribution/bin/activate && pip install --upgrade pip && pip install wheel

# Move to /opt directory and git clone tvb-data
cd /opt && git clone https://github.com/the-virtual-brain/tvb-data.git
# Install it because it does not require any unittest
cd /opt/tvb-data
# build the .whl
python setup.py bdist_wheel
pip install dist/tvb_data-1.5.6-py2-none-any.whl
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cd /opt && rm -rf /tvb-data

# Move to /opt directory and git clone tvb-geodesic
cd /opt && git clone https://github.com/the-virtual-brain/tvb-geodesic.git
# Install it because it does not require any unittest
cd /opt/tvb-geodesic
# build the .whl
python setup.py bdist_wheel
pip install dist/tvb_gdist-1.5.6-cp27-cp27mu-linux_x86_64.whl
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cd /opt && rm -rf /tvb-geodesic

# Move to /opt directory and git clone tvb-library
cd /opt && git clone https://github.com/the-virtual-brain/tvb-library.git
# run the pytest for the require unittest
cd /opt/tvb-library
pytest tvb/test
# build the .whl
python setup.py bdist_wheel
pip install dist/tvb_library-1.5.6-py2-none-any.whl
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cd /opt && rm -rf /tvb-library

# Move to /opt directory and git clone tvb-framework
cd /opt && git clone https://github.com/the-virtual-brain/tvb-framework.git
# run the pytest for the require unittest
cd /opt/tvb-framework
pytest tvb/tests/framework/interfaces/web/controllers/help_controller_test
# build the .whl
python setup.py bdist_wheel
pip install dist/tvb_framework-1.5.6-py2-none-any.whl
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cd /opt && rm -rf /tvb-framework
