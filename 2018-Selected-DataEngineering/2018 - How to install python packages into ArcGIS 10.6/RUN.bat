REM RUNNING THE DATALAB PYTHON INSTALLER SCRIPT FOR SHAN'S CLASS

REM LOADING PACKAGES TO USER DIRECTORIES 
"C:\Program Files\ArcGIS\Pro\bin\Python\envs\arcgispro-py3\python.exe" -m pip install --user PyHamcrest
"C:\Program Files\ArcGIS\Pro\bin\Python\envs\arcgispro-py3\python.exe" -m pip install --user seaborn
"C:\Program Files\ArcGIS\Pro\bin\Python\envs\arcgispro-py3\python.exe" -m pip install --user networkx==2.1
"C:\Program Files\ArcGIS\Pro\bin\Python\envs\arcgispro-py3\python.exe" -m pip install --user cartoframes
"C:\Program Files\ArcGIS\Pro\bin\Python\envs\arcgispro-py3\python.exe" -m pip install --user shapely

REM PACKAGES HAVE COMPLETED, PRINTING

"C:\Program Files\ArcGIS\Pro\bin\Python\envs\arcgispro-py3\python.exe" -m pip freeze 

TIMEOUT /t 15 

REM SAVED PACKAGES TO CURRENT DIRECTORY
ECHO %cd%

REM PRINTING CURRENT PACKAGE STATUS TO PACKAGES INSTALLED TEXT FILE 
"C:\Program Files\ArcGIS\Pro\bin\Python\envs\arcgispro-py3\python.exe" -m pip freeze > packages_installed.txt
