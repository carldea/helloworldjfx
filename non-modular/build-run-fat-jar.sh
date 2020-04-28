#!/bin/bash
echo "JAVA_HOME=${JAVA_HOME}"
echo "PATH_TO_FX=${PATH_TO_FX}"

rm -rf out
javac --module-path $PATH_TO_FX --add-modules javafx.controls -d out $(find src/ -name "*.java")
mkdir -p out/com/helloworld
#find src/main/resources -type f -name "*.properties" -print -exec cp {} out \;
cp -r src/main/resources/ out

find $PATH_TO_FX/{javafx.base.jar,javafx.graphics.jar,javafx.controls.jar} -exec unzip -nq {} -d out \;

#uncomment for Linux:
#cp $PATH_TO_FX/{libprism*.so,libjavafx*.so,libglass*.so,libdecora_sse.so} out

#uncomment for Mac:
cp $PATH_TO_FX/{libprism*.dylib,libjavafx*.dylib,libglass.dylib,libdecora_sse.dylib} out

rm out/META-INF/MANIFEST.MF out/module-info.class
mkdir libs
jar --create --file=libs/hellofx.jar --main-class=com.helloworld.Launcher -C out .
java -jar libs/hellofx.jar

