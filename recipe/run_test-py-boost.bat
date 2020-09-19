pushd libs\python\example\tutorial
  set CONDA_BUILD=1
  echo "WARNING :: On Windows, at present, if we had used --layout=versioned then this attempts to link to"
  echo "WARNING ::   boost_python.lib instead of e.g. boost_python38-vc140-mt-x64-1_73.lib. AFAICT this is"
  echo "WARNING ::   not a regression in AD packages."
  :: Ignore failures:
  :: bjam -q -d+2 --debug --debug-configuration || VER>NUL
  :: python -c 'from __future__ import print_function; import hello_ext; print(hello_ext.greet())' || VER>NUL
  :: Fail on failures:
  bjam --debug-configuration toolset=msvc-14.1 --layout=versioned
  if errorlevel 1 exit /b 1
  python -c 'from __future__ import print_function; import hello_ext; print(hello_ext.greet())'
  if errorlevel 1 exit /b 1
popd
