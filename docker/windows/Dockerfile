FROM windowsservercore

#set maintainer
MAINTAINER thevirtualbrain <tvb.admin@codemart.ro>
WORKDIR C:/Users/Administrator

# Use Unix-like path for destination.
# See https://github.com/docker/docker/issues/21697
ADD ./miniconda3_custom.exe /Users/Administrator/miniconda3_custom.exe

RUN miniconda3_custom.exe /S /D=C:\Users\Administrator\miniconda3 | more

# Appending to the existing path wasn't working in the Dockerfile,
# So set the full system path here. The first part is the default.
# The last bit is the part added in this Dockerfile.
ENV PATH=C:\\Windows\\system32;C:\\Windows;C:\Windows\\System32\\Wbem;C:\\Windows\\System32\\WindowsPowerShell\\v1.0;C:\\Users\\Administrator\\miniconda3;C:\\Users\\Administrator\\miniconda3\\Scripts;C:\\Users\\Administrator\\miniconda3\\Library\\bin

# Setup and install the software
RUN conda config --add channels conda-forge
RUN conda install tvb-framework -y
RUN pip install jaraco.functools

# Start the application
CMD ["python -m tvb.interfaces.web.run WEB_PROFILE tvb.config"]