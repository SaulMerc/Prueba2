from flask import Flask, render_template, request, redirect, url_for, Blueprint
import os
import database as db




template_dir = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))
template_dir = os.path.join(template_dir, 'templates')

#product = Blueprint('product', __name__, template_folder=template_dir, url_prefix='/product')
product = Blueprint('product', __name__, template_folder=template_dir, url_prefix='/product')



@product.route('/ruta')
def mostrarRuta():
    return template_dir

# Rutas de la aplicación
@product.route('/')
def home():
    # Crear un cursor para la base de datos y ejecutar una consulta SQL
    cursor = db.database.cursor()
    cursor.execute("SELECT * FROM productos")
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
  
    return render_template('product.html', data=insertObject)
    #return insertObject

# Ruta para guardar usuariosen la base de datos
@product.route('/addProduct', methods=['POST'])
def addProduct():
    id_user = request.form['id_user']
    titulo = request.form['titulo']
    descripcion = request.form['descripcion']
    existencia = request.form['existencia']
    precio = request.form['precio']
    categoria = request.form['categoria']


    if id_user and titulo and descripcion and existencia and precio and categoria:
        cursor = db.database.cursor()
        sql = "INSERT INTO productos (id_user, titulo, descripcion, existencia, precio, categoria) VALUES (%s, %s, %s, %s, %s, %s)"
        data = (id_user,titulo,descripcion,existencia, precio, categoria)
        cursor.execute(sql, data)
        db.database.commit()
    return redirect(url_for('product.home'))

@product.route('/deleteProd/<string:id>')
def deleteProd(id):
    # Crea un objeto cursor para ejecutar comandos en la base de datos
    cursor = db.database.cursor()
    sql = "DELETE FROM productos WHERE id=%s"
    # Crea una tupla con el valor del parámetro id
    data = (id,)
    cursor.execute(sql, data)
    db.database.commit()
    return redirect(url_for('product.home'))



@product.route('/editProd/<string:id>', methods=['POST'])
def editProd(id):
    
    titulo = request.form['titulo']
    descripcion = request.form['descripcion']
    existencia = request.form['existencia']
    precio = request.form['precio']
    categoria = request.form['categoria']

    if titulo and descripcion and existencia and precio and categoria:
        cursor = db.database.cursor()
        sql = "UPDATE productos SET  titulo = %s, descripcion = %s, existencia = %s, precio = %s, categoria = %s WHERE id = %s"
        data = (titulo, descripcion, existencia, precio, categoria, id)
        cursor.execute(sql, data)
        db.database.commit()
    return redirect(url_for('product.home'))

# if __name__ == "__main__":
#      app.run(debug=True,port=5000)
