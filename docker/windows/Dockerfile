# Use this Windows Nano Server with Miniconda
# image installed
FROM dhirschfeld/nano-miniconda

#set maintainer
MAINTAINER thevirtualbrain <tvb.admin@codemart.ro>

# Setup and install the software
RUN conda config --add channels conda-forge
RUN conda install tvb-framework -y
RUN pip install jaraco.functools allensdk

# Start the application
CMD ["python -m tvb.interfaces.web.run WEB_PROFILE tvb.config"]
