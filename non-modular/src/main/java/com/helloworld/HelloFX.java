package com.helloworld;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

import java.util.Locale;
import java.util.ResourceBundle;

public class HelloFX extends Application {
    private static ResourceBundle resourceBundle = null;
    @Override
    public void start(Stage stage) {
        stage.setTitle("HelloFX (Non JPMS)");
        String greeting = getProperty("greet");
        String world = getProperty("world");
        String javaVersion = System.getProperty("java.version");
        String javafxVersion = System.getProperty("javafx.version");
        Label l = new Label(String.format("%s %s, JavaFX %s, running on Java %s .", greeting, world, javaVersion, javafxVersion));
        Scene scene = new Scene(new StackPane(l), 640, 480);
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }

    private static String getProperty(String property) {
        return getResourceBundle().getString(property);
    }

    private static ResourceBundle getResourceBundle() {
        if (resourceBundle == null) {
            try {
                Locale defaultLocal = Locale.getDefault();
                resourceBundle = ResourceBundle.getBundle("com.helloworld.App", defaultLocal);
            } catch (RuntimeException re) {
                Locale usLocal = new Locale("en","US");
                resourceBundle = ResourceBundle.getBundle("com.helloworld.App", usLocal);
            }
        }
        return resourceBundle;
    }

}
