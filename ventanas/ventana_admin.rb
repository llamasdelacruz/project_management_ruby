# admin_interface.rb
require 'tk'

class AdminInterface
  def initialize(vetana_principal)
    $principal = vetana_principal
    @root = TkToplevel.new do
        title "Administrador"
        geometry "600x400"
    end
    @root.protocol('WM_DELETE_WINDOW') { cerrar_ventana }
    

    @main_frame = TkFrame.new(@root) do
      background "#fff"
      pack(fill: :both, expand: true)
    end

    # Crear la tabla de tareas
    @task_table = Tk::Tile::Treeview.new(@main_frame) do
      columns ['Nombre de la tarea', 'Descripción', 'Encargado']
      pack(fill: :both, expand: true)
    end

    # Agregar datos de ejemplo a la tabla de tareas
    add_task("Tarea 1", "Descripción de la tarea 1", "Juan")
    add_task("Tarea 2", "Descripción de la tarea 2", "María")
    add_task("Tarea 3", "Descripción de la tarea 3", "Pedro")

    
  end

  def add_task(name, description, assignee)
    @task_table.insert('', 'end', values: [name, description, assignee])
  end

  def cerrar_ventana
    $principal.deiconify()
    @root.destroy()
  end
end
