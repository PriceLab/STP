Aishah.~> python
Python 2.7.10 (default, Oct  6 2017, 22:29:07) 
[GCC 4.2.1 Compatible Apple LLVM 9.0.0 (clang-900.0.31)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> 
Aishah.~> type -a python
type -a python
python is /usr/bin/python
Aishah.~> ls
ls
Applications	Downloads	Music		anaconda3	practice
Desktop		Library		Pictures	github
Documents	Movies		Public		isb projects
Aishah.~> cd github/
cd github/
Aishah.github> ls
ls
RCyjs			interactionNetworks	project
STP			interactionNetworksOLD
Aishah.github> cd STP/
cd STP/
Aishah.STP> ls
ls
LICENSE		README.md	chapter2
Aishah.STP> cd chapter2/aishah/
cd chapter2/aishah/
Aishah.aishah> ls
ls
hello.R		hello.R~	hello.py
Aishah.aishah> typa -a python
typa -a python
bash: typa: command not found
Aishah.aishah> type -a python
type -a python
python is /usr/bin/python
Aishah.aishah> python
python
Python 2.7.10 (default, Oct  6 2017, 22:29:07) 
[GCC 4.2.1 Compatible Apple LLVM 9.0.0 (clang-900.0.31)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> source ("hello.py")
source ("hello.py")
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'source' is not defined
>>> open ("hello.py")
open ("hello.py")
<open file 'hello.py', mode 'r' at 0x1034695d0>
>>> print("hello, world")
print("hello, world")
hello, world
>>> 