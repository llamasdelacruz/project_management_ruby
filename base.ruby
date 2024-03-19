require 'mysql2'

cliente = Mysql2::Client.new(:host => "localhost", :username => "proyectoBD", password: "Aigll3802A@",
database: "proyectoBD")

results = cliente.query("SELECT * FROM tabla1")

results.each do |row|
  #puts row['nombre'], row['paterno'], row['materno'], row['edad']
  puts "nombre: #{row['nombre']}, apellido paterno: #{row['paterno']}, apellido materno: #{row['materno']}, edad: #{row['edad']}"
end

# Cierra la conexión cuando hayas terminado de trabajar con la base de datos
cliente.close
