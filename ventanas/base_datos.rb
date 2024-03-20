# creame un crud para sqlite3 con ruby


require 'sqlite3'

class Base_datos_m


    def insertar(nombre, prioridad, estado)
        begin
            @db = SQLite3::Database.new "projects.db"
            @db.execute "INSERT INTO task(nombre, prioridad, estado) VALUES('#{nombre}', '#{prioridad}', '#{estado}')"
        rescue SQLite3::Exception => e
            puts "Exception occurred"
            puts e
        ensure
            @db.close if @db
        end
    end

    def mostrar
        begin
            actividades = []
            @db = SQLite3::Database.new "projects.db"
            @db.execute "SELECT * FROM task" do |row|
                actividades << row
            end
            return actividades
        rescue SQLite3::Exception => e
            puts "Exception occurred"
            puts e
        ensure
            @db.close if @db
        end
    end

    def login_comparacion(usuario, password)
        begin
            @db = SQLite3::Database.new "projects.db"
            @db.execute "SELECT * FROM usuarios WHERE usuario = '#{usuario}' AND password = '#{password}'" do |row|
                return true
            end
            return false
        rescue SQLite3::Exception => e
            puts "Exception occurred"
            puts e
        ensure
            @db.close if @db
        end
    end

    def recuperar_tipo_usuario(usuario)
        begin
            @db = SQLite3::Database.new "projects.db"
            @db.execute "SELECT tipo FROM usuarios WHERE usuario = '#{usuario}'" do |row|
                return row[0]
            end
        rescue SQLite3::Exception => e
            puts "Exception occurred"
            puts e
        ensure
            @db.close if @db
        end
    end

end

