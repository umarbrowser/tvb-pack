@ECHO OFF
rem This is a comments
rem clear our cmd
cls
rem Move to C:\ directory and create a opt directory
cd C:\ & mkdir opt

rem Create a virtual env for our building development
virtualenv tvb_distribution
rem Activate it
tvb_distribution\Scripts\activate

rem Move to \opt directory and git clone tvb-data
cd C:\opt & git clone https://github.com/the-virtual-brain/tvb-data.git
rem Install it because it does not require any unittest
cd \tvb-data
rem build the .whl
python setup.py bdist_wheel & pip install dist\*.whl
rem Remove the clone directory after everything, Because if we leave it making the image
rem bigger in size.
cd C:\opt & rmdir tvb-data

rem Move to \opt directory and git clone tvb-geodesic
cd C:\opt & git clone https://github.com/the-virtual-brain/tvb-geodesic.git
rem Install it because it does not require any unittest
cd C:\opt\tvb-geodesic
rem build the .whl
python setup.py bdist_wheel & pip install dist\*.whl
rem Remove the clone directory after everything, Because if we leave it making the image
rem bigger in size.
cd C:\opt & rmdir tvb-geodesic

rem Move to \opt directory and git clone tvb-library
cd C:\opt & git clone https://github.com/the-virtual-brain/tvb-library.git
rem run the pytest for the require unittest
cd C:\opt\tvb-library\ & pytest tvb\test
rem build the .whl
python setup.py bdist_wheel & pip install dist\*.whl
rem Remove the clone directory after everything, Because if we leave it making the image
rem bigger in size.
cd C:\opt & rmdir tvb-library

rem Move to \opt directory and git clone tvb-framework
cd C:\opt & git clone https://github.com/the-virtual-brain/tvb-framework.git
rem run the pytest for the require unittest
cd C:\opt\tvb-framework\ & pytest tvb\tests\ramework\interfaces\web\controllers\help_controller_test
rem build the .whl
python setup.py bdist_wheel & pip install dist\*.whl
rem Remove the clone directory after everything, Because if we leave it making the image
rem bigger in size.
cd C:\opt\ & rmdir tvb-framework
