#!/bin/bash

echo "creating env in $1"

virtualenv --system-site-packages $1
source $1/bin/activate
pip install cherrypy formencode sqlalchemy sqlalchemy-migrate genshi simplejson cfflib networkx nibabel apscheduler mod_pywebsocket psutil minixsv h5py BeautifulSoup mplh5canvas

echo "trying to build geodesic distance module"
pushd geodesic
python setup.py install
popd

echo "done!"
