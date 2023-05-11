from flask import Flask, Blueprint, render_template, request, redirect, url_for

import os
import database as db


template_dir = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))
template_dir = os.path.join(template_dir, 'src', 'templates')

#user = Blueprint('user', __name__, template_folder=template_dir, url_prefix='/user')
user = Blueprint('user', __name__, template_folder=template_dir, url_prefix='/user')

# Rutas de la aplicación
# @app.route('/user')
@user.route("/")
def home():
    # Crear un cursor para la base de datos y ejecutar una consulta SQL
    cursor = db.database.cursor()
    cursor.execute("SELECT usuario.id, usuario.nombre, usuario.correo, usuario.contraseña, usuario.nombre_usuario, usuario.f_nacimiento, usuario.numero_tel, usuario.activo_desde, roles.rol FROM usuario JOIN roles ON usuario.id_rol = roles.id")
    # cursor.execute("SELECT * FROM usuario")
    # Obtener todos los resultados de la consulta
    myresult = cursor.fetchall()

    # Convertir los resultados en un diccionario
    insertObject = []  # Crear una lista vacía para almacenar los registros convertidos
    
    columnNames = [column[0] for column in cursor.description]  #
    for record in myresult:
        # Crear un diccionario que mapea los nombres de columna a los valores de registro
        insertObject.append(dict(zip(columnNames, record)))
        insertObject
    # Cerrar el cursor y devolver una plantilla HTML
    cursor.close()
    return render_template('user.html',data=insertObject)
    #return insertObject


# Ruta para guardar usuariouarios en la base de datos
@user.route('/addUser', methods=['POST'])
def addUser():
    nombre = request.form['nombre']
    correo = request.form['correo']
    contraseña = request.form['contraseña']
    nombre_usuario = request.form['nombre_usuario']
    f_nacimiento = request.form['f_nacimiento']
    numero_tel = request.form['numero_tel']


    if nombre and correo and contraseña and nombre_usuario and f_nacimiento and numero_tel:
        cursor = db.database.cursor()
        sql = "INSERT INTO usuario (nombre, correo, contraseña, nombre_usuario, f_nacimiento, numero_tel, id_rol) VALUES (%s, %s, %s,%s, %s, %s, %s)"
        data = (nombre,correo,contraseña,nombre_usuario, f_nacimiento, numero_tel, 1)
        cursor.execute(sql, data)
        db.database.commit()
    return redirect(url_for('user.home'))
   

@user.route('/deleteUser/<string:id>')
def deleteUser(id):
    # Crea un objeto cursor para ejecutar comandos en la base de datos
    cursor = db.database.cursor()
    sql = "DELETE FROM usuario WHERE id=%s"
    # Crea una tupla con el valor del parámetro id
    data = (id,)
    cursor.execute(sql, data)
    db.database.commit()
    return redirect(url_for('user.home'))

@user.route('/editUser/<string:id>', methods=['POST'])
def editUser(id):
    nombre = request.form['nombre']
    correo = request.form['correo']
    contraseña = request.form['contraseña']
    nombre_usuario = request.form['nombre_usuario']
    f_nacimiento = request.form['f_nacimiento']
    numero_tel = request.form['numero_tel']

    if nombre and correo and contraseña and nombre_usuario and f_nacimiento and numero_tel:
        cursor = db.database.cursor()
        sql = "UPDATE usuario SET nombre = %s, correo = %s, contraseña = %s, nombre_usuario = %s, f_nacimiento = %s, numero_tel = %s WHERE id = %s"
        data = (nombre, correo, contraseña, nombre_usuario, f_nacimiento, numero_tel, id)
        cursor.execute(sql, data)
        db.database.commit()
    return redirect(url_for('user.home'))

# if __name__ == "__main__":
#     app.run(debug=True,port=5000)
