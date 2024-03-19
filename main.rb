require 'sqlite3'

class  BaseDeDatos
  def initialize

    @db = SQLite3::Database.new "prueba.db";
  end

  def insertar_registro(nombre, tipo)
    @db.execute "INSERT INTO mi_tabla (columa1,columna2) VALUES (?, ?)", [nombre, tipo]
  end   

end

@m = BaseDeDatos.new
@m.insertar_registro("usuario1", 1)