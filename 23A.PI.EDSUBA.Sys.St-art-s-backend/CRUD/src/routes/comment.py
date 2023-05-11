from flask import Flask, render_template, request, redirect, url_for, Blueprint
import os
import database as db




template_dir = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))
template_dir = os.path.join(template_dir, 'templates')

#product = Blueprint('product', __name__, template_folder=template_dir, url_prefix='/product')
comment = Blueprint('comment', __name__, template_folder=template_dir, url_prefix='/comment')



# Rutas de la aplicación
@comment.route('/')
def home():
    # Crear un cursor para la base de datos y ejecutar una consulta SQL
    cursor = db.database.cursor()
    cursor.execute("SELECT * FROM comentarios")
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
  
    return render_template('comment.html', data=insertObject)
    #return insertObject

# Ruta para guardar usuariosen la base de datos
@comment.route('/addComment', methods=['POST'])
def addComment():
    id_prod = request.form['id_prod']
    id_user = request.form['id_user']
    comentario = request.form['comentario']



    if id_prod and id_user and comentario:
        cursor = db.database.cursor()
        sql = "INSERT INTO comentarios (id_prod, id_user, comentario) VALUES (%s, %s, %s)"
        data = (id_prod,id_user,comentario)
        cursor.execute(sql, data)
        db.database.commit()
    return redirect(url_for('comment.home'))

@comment.route('/deleteComment/<string:id>')
def deleteComment(id):
    # Crea un objeto cursor para ejecutar comandos en la base de datos
    cursor = db.database.cursor()
    sql = "DELETE FROM comentarios WHERE id=%s"
    # Crea una tupla con el valor del parámetro id
    data = (id,)
    cursor.execute(sql, data)
    db.database.commit()
    return redirect(url_for('comment.home'))



@comment.route('/editComment/<string:id>', methods=['POST'])
def editProd(id):
    comentario = request.form['comentario']
   
    if comentario:
        cursor = db.database.cursor()
        sql = "UPDATE comentarios SET comentario = %s WHERE id = %s"
        data = (comentario,id)
        cursor.execute(sql, data)
        db.database.commit()
    return redirect(url_for('comment.home'))

# if __name__ == "__main__":
#      app.run(debug=True,port=5000)
