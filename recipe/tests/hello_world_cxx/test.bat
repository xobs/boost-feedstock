set TOOLSET=msvc-14.1
bjam hello cxxflags=-I%CONDA_PREFIX%\include --debug-configuration -d+2 release toolset=%TOOLSET% > cxxflags-hacked-working.log 2>&1
bin\%TOOLSET%\release\hello.exe | rg "Hello World CXX"
rename bin bin.hacked-working
timeout 1
if exist bin rename bin bin.hacked-working
timeout 1
bjam hello --debug-configuration -d+2 release toolset=%TOOLSET% > cxxflags-unhacked-broken.log 2>&1
bin\%TOOLSET%\release\hello.exe | rg "Hello World CXX"
rename bin bin.unhacked-broken
