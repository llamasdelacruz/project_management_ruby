# admin_interface.rb
require 'tk'
require_relative 'base_datos.rb'
require 'tkextlib/tile'

class AdminInterface
  def initialize(vetana_principal)
    $principal = vetana_principal
    @root = TkToplevel.new do
        title "Administrador"
        geometry "600x400"
    end
    @root.protocol('WM_DELETE_WINDOW') { cerrar_ventana }

    @botones_eliminar = {}
    

    # Colores
    $background_color = "#f0f0f0"
    $label_color = "#333"
    $button_color = "#4caf50"
    $button_hover_color = "#388e3c"

    # Datos de la tabla
    @actividades = []

    # Marco principal
    @main_frame = TkFrame.new(@root) do
      background $background_color
      pack(fill: :both, expand: true)
    end

    # Entrada de nombre de actividad
    TkLabel.new(@main_frame) do
      text "Nombre de la actividad:"
      foreground $label_color
      background $background_color
      pack(pady: 5)
    end

    @actividad_entry = TkEntry.new(@main_frame)
    @actividad_entry.pack(pady: 5)

    # Combo box para prioridad
    TkLabel.new(@main_frame) do
      text "Prioridad:"
      foreground $label_color
      background $background_color
      pack(pady: 5)
    end

    @prioridad_combo = Tk::Tile::Combobox.new(@main_frame) do
      values ['Alta', 'Media', 'Baja']
      pack(pady: 5)
    end
    @prioridad_combo.current()

    # Combo box para responsable
    TkLabel.new(@main_frame) do
      text "Responsable:"
      foreground $label_color
      background $background_color
      pack(pady: 5)
    end

    @estado = Tk::Tile::Combobox.new(@main_frame) do
      values ['Pendiente', 'En proceso', 'Terminada']
      pack(pady: 5)
    end
    @estado.current()

    # Botón Agregar
    @agregar = TkButton.new(@main_frame) do
      text "Agregar"
      font "Helvetica 12 bold"
      foreground "white"
      background $button_color
      borderwidth 0
      activebackground $button_hover_color
      pack(pady: 10)
    end
    @agregar.command = Proc.new { agregar_actividad }

    # Tabla de actividades
    @tabla = Tk::Tile::Treeview.new(@main_frame) do
      columns ["ID",'Nombre', 'Prioridad', 'Responsable', 'Eliminar']
      pack(fill: :both, expand: true)
    end

    mostrar_actividades
  end

  def agregar_actividad

    nombre = @actividad_entry.get
    prioridad = @prioridad_combo.get
    responsable = @estado.get

    # Agregar la actividad a la lista de actividades
   
    @bd_insta = Base_datos_m.new
    @id = @bd_insta.insertar(nombre, prioridad, responsable)
    # Actualizar la tabla
    @eliminar = TkButton.new(@tabla) do
      text "Eliminar"
      grid(column: 3, row: @id.to_i)
    end
    @eliminar.command = Proc.new {eliminar_actividad(@id.to_i) }
    @botones_eliminar.store(@id, @eliminar)
    row = @tabla.insert('', 'end', text: @id ,values: [@id,nombre, prioridad, responsable])

    # Agregar un botón de eliminar a la fila
    
  
  end

  def mostrar_actividades
    @base = Base_datos_m.new
        datos = @base.mostrar
        @tabla.insert('', 'end', values: ["ID","Nombre", "Prioridad", "Estado"])
        datos.each do |id,nombre, prioridad, estado|
           @eliminar = TkButton.new(@tabla) do
              text "Eliminar"
              grid(column: 3, row: id.to_i)
            end
            @eliminar.command = Proc.new { eliminar_actividad(id.to_i) }

            @botones_eliminar.store(id, @eliminar)
          row = @tabla.insert('', 'end', text: id,values: [id,nombre, prioridad, estado])
           
        end

    
  
    
  end

  def eliminar_actividad(id)
    # Eliminar la actividad de la lista de actividades
    @actividades.delete(id)
    @base = Base_datos_m.new
    @base.eliminar_actividad(id)
    @botones_eliminar.each do |key, value|
      value.destroy() 
    end
   
    @tabla.delete(@tabla.children(''))

    mostrar_actividades
    
    
    # Actualizar la tabla
  end

  def cerrar_ventana
    $principal.deiconify()
    @root.destroy()
  end
end
