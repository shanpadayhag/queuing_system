import sys, os

# MODULE IMPORTS
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine

# SELF CREATED MODULE IMPORTS
from classes import splashScreen, login


# INSTANCE CLASS
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    SplashScreen = splashScreen.splashScreen()

    engine.rootContext().setContextProperty("SplashScreen", SplashScreen)

    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))
    
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
    # LOADS THE SPLASH SCREEN UI