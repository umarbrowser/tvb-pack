# Move to C:\ directory and create a opt directory
cmd /c "cd C:\ & mkdir opt"

# Create a virtual env for our building development
cmd /c "virtualenv tvb_distribution"
# Activate it
cmd /c "tvb_distribution\Scripts\activate"

# Move to \opt directory and git clone tvb-data
cmd /c "cd C:\opt & git clone https://github.com/the-virtual-brain/tvb-data.git"
# Install it because it does not require any unittest
cmd /c "cd \tvb-data"
# build the .whl
cmd /c "python setup.py bdist_wheel"
cmd /c "pip install dist\*.whl"
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cmd /c "cd C:\opt & rmdir tvb-data"

# Move to \opt directory and git clone tvb-geodesic
cmd /c "cd C:\opt & git clone https://github.com/the-virtual-brain/tvb-geodesic.git"
# Install it because it does not require any unittest
cmd /c "cd C:\opt\tvb-geodesic"
# build the .whl
cmd /c "python setup.py bdist_wheel"
cmd /c "pip install dist\*.whl"
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cmd /c "cd C:\opt & rmdir tvb-geodesic"

# Move to \opt directory and git clone tvb-library
cmd /c "cd C:\opt & git clone https://github.com/the-virtual-brain/tvb-library.git"
# run the pytest for the require unittest
cmd /c "pytest tvb\test"
# build the .whl
cmd /c "python setup.py bdist_wheel"
cmd /c "pip install dist\*.whl"
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cmd /c "cd C:\opt & rmdir tvb-library"

# Move to \opt directory and git clone tvb-framework
cmd /c "cd C:\opt & git clone https://github.com/the-virtual-brain/tvb-framework.git"
# run the pytest for the require unittest
cmd /c "cd C:\opt\tvb-framework\"
cmd /c "pytest tvb\tests\ramework\interfaces\web\controllers\help_controller_test"
# build the .whl
cmd /c "python setup.py bdist_wheel"
cmd /c "pip install dist\*.whl"
# Remove the clone directory after everything, Because if we leave it making the image
# bigger in size.
cmd /c "cd C:\opt\ & rmdir tvb-framework"