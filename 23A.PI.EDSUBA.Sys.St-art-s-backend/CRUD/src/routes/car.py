from flask import Flask, render_template, request, redirect, url_for, Blueprint
import os
import database as db


template_dir = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))
template_dir = os.path.join(template_dir, 'templates')

#product = Blueprint('product', __name__, template_folder=template_dir, url_prefix='/product')
car = Blueprint('car', __name__, template_folder=template_dir, url_prefix='/car')



# Rutas de la aplicación
@car.route('/')
def home():
    # Crear un cursor para la base de datos y ejecutar una consulta SQL
    cursor = db.database.cursor()
    cursor.execute("SELECT * FROM carrito")
    # cursor.execute("SELECT * FROM usuario")
    # Obtener todos los resultados de la consulta
    myresult = cursor.fetchall()

    # Convertir los resultados en un diccionario
    insertObject = []  # Crear una lista vacía para almacenar los registros convertidos
    columnNames = [column[0] for column in cursor.description]  #
    for record in myresult:
        # Crear un diccionario que mapea los nombres de columna a los valores de registro
        insertObject.append(dict(zip(columnNames, record)))

    # Cerrar el cursor y devolver una plantilla HTML
    cursor.close()
  
    return render_template('car.html', data=insertObject)
    #return insertObject

# Ruta para guardar usuariosen la base de datos
@car.route('/addCar', methods=['POST'])
def addCar():
    vendido = request.form['vendido']





    if vendido:
        cursor = db.database.cursor()
        sql = "INSERT INTO carrito (vendido) VALUES (%s)"
        data = (vendido,)
        cursor.execute(sql, data)
        db.database.commit()
    return redirect(url_for('car.home'))

@car.route('/deleteCar/<string:id>')
def deleteCar(id):
    # Crea un objeto cursor para ejecutar comandos en la base de datos
    cursor = db.database.cursor()
    sql = "DELETE FROM carrito WHERE id=%s"
    # Crea una tupla con el valor del parámetro id
    data = (id,)
    cursor.execute(sql, data)
    db.database.commit()
    return redirect(url_for('car.home'))



@car.route('/editCar/<string:id>', methods=['POST'])
def editCar(id):
    vendido = request.form['vendido']
   
    if vendido:
        cursor = db.database.cursor()
        sql = "UPDATE carrito SET vendido = %s WHERE id = %s"
        data = (vendido,id)
        cursor.execute(sql, data)
        db.database.commit()
    return redirect(url_for('car.home'))

# if __name__ == "__main__":
#      app.run(debug=True,port=5000)
