REM Windows compile and run hellow world example.
RMDIR /S /Q classes
dir /s /b src\*.java > sources.txt & javac --module-path %PATH_TO_FX% -d classes @sources.txt & del sources.txt
java -classpath classes--module-path %PATH_TO_FX% --add-modules javafx.controls com.helloworld.HelloFX
