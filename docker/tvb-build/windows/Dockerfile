# Set the base image to use
FROM microsoft/vsts-agent:windows-servercore-10.0.14393

# Set the file author
MAINTAINER thevirtualbrain <tvb.admin@codemart.ro>


ENV chocolateyUseWindowsCompression=false

# Install using chocolatey
# Chocolatey is a software management solution unlike anything else you've ever experienced on Windows.
# It focuses on simplicity, security, and #scalability. You write a software deployment in PowerShell once 
# for any software (not just installers), then you can deploy it everywhere you have Windows with any solution 
# that can manage systems (configuration management, endpoint management, etc) and track and manage updates of that software over time.
RUN @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

RUN choco config set cachelocation C:\chococache

RUN choco install \
    git  \
    python2 \
    --confirm

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Install .NET Core
ENV DOTNET_VERSION 1.1.1
ENV DOTNET_DOWNLOAD_URL https://dotnetcli.blob.core.windows.net/dotnet/release/1.1.0/Binaries/$DOTNET_VERSION/dotnet-win-x64.$DOTNET_VERSION.zip

RUN Invoke-WebRequest $Env:DOTNET_DOWNLOAD_URL -OutFile dotnet.zip; \
    Expand-Archive dotnet.zip -DestinationPath $Env:ProgramFiles\dotnet -Force; \
    Remove-Item -Force dotnet.zip

# Install .NET Core
ENV DOTNET_VERSION 1.0.4
ENV DOTNET_DOWNLOAD_URL https://dotnetcli.blob.core.windows.net/dotnet/preview/Binaries/$DOTNET_VERSION/dotnet-win-x64.$DOTNET_VERSION.zip

RUN Invoke-WebRequest $Env:DOTNET_DOWNLOAD_URL -OutFile dotnet.zip; \
    Expand-Archive dotnet.zip -DestinationPath $Env:ProgramFiles\dotnet -Force; \
    Remove-Item -Force dotnet.zip
    
# Install .NET Core SDK
ENV DOTNET_SDK_VERSION 1.0.1
ENV DOTNET_SDK_DOWNLOAD_URL https://dotnetcli.blob.core.windows.net/dotnet/Sdk/$DOTNET_SDK_VERSION/dotnet-dev-win-x64.$DOTNET_SDK_VERSION.zip

RUN Invoke-WebRequest $Env:DOTNET_SDK_DOWNLOAD_URL -OutFile dotnet.zip; \
    Expand-Archive dotnet.zip -DestinationPath $Env:ProgramFiles\dotnet -Force; \
    Remove-Item -Force dotnet.zip

SHELL ["cmd", "/S", "/C"]

RUN setx /M PATH "%PATH%;%ProgramFiles%\dotnet"

# Trigger the population of the local package cache
ENV NUGET_XMLDOC_MODE skip

# Install 3rd party tools using pypi
RUN pip install networkx numpy numba numexpr matplotlib \
                  pytest scikit-learn scipy cython wheel \
		  BeautifulSoup4 cfflib cherrypy formencode genshi \
                  h5py networkx nibabel Pillow psutil pytest simplejson \
		  sqlalchemy sqlalchemy-migrate jaraco.functools allensdk virtualenv

# Copy our powershell script file from current host directory to C:\.
COPY tvb-build.ps1 C:\

# Set our working directory
WORKDIR C:\

# Start our bash file
CMD ["powershell", "./tvb-build.ps1"]
