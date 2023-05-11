'''
Modulo para la API

Autores: Seryev Oyser, Agergen sus nombres, Agregen sus nombres
Fecha de creacion: 19 de abril del 2023
Derechos resrevados: (c) 2023 EDSUBA. Todos los derechos reservados.
Version: 0.1
Dependecias: Python3 (version ?????),Flask, mariadb (version ?????)

Descripcion: Lorem_impus
'''
from flask import Flask #Importamos Flask para usar sus utilidades
#Importamos nuestros Blueprints, 
from routes.products import app as products_app #
from routes.users import app as users_app 

app = Flask(__name__) #Creamos una instancia

#Registramos todos nuestros Blueprints
app.register_blueprint(products_app) 
app.register_blueprint(users_app)

if __name__ == '__main__':
    app.run() # Ejecutamos la aplicacion 


