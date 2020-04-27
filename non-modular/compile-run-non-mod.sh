#!/bin/bash
echo "JAVA_HOME=${JAVA_HOME}"
echo "PATH_TO_FX=${PATH_TO_FX}"
rm -rf classes
javac --module-path $PATH_TO_FX --add-modules javafx.controls -d classes $(find src/ -name "*.java")
mkdir -p classes/com/helloworld
cp src/main/resources/com/helloworld/*.properties classes/com/helloworld
java -classpath classes --module-path $PATH_TO_FX --add-modules javafx.controls com.helloworld.HelloFX
