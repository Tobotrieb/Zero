@echo off
:a
set /p project="Enter Project Name: "
set /p filepath="Enter file path: "

if not %filepath%==. (
	set realfilepath=\%filepath%
	set filepath=/%filepath%
) else (
	set realfilepath=
	set filepath=
)

set /p filename="Enter class name without postfix: "

if not x%filename:.=%==x%filename% (
	echo Filename must NOT include postfix
	goto a
)

echo Delete Header include\%project%%filepath%\%filename%.h?
echo Delete CppFile    src\%project%%filepath%\%filename%.cpp?
set /p doit="Do it? (y/n): "
if %doit%==y (
	del /f /q include\%project%%realfilepath%\%filename%.h
	del /f /q src\%project%%realfilepath%\%filename%.cpp
) else (
	goto a
)

premake