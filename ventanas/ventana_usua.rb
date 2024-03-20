# admin_interface.rb
require 'tk'
require_relative 'base_datos.rb'
require 'tkextlib/tile'

class UsuaInterface
  def initialize(vetana_principal)
        $principal = vetana_principal
        @root = TkToplevel.new do
            title "Usuario normal"
            geometry "800x300"
        end
        @root.protocol('WM_DELETE_WINDOW') { cerrar_ventana }
        

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

        # rellenar tabla 
        @tabla = Tk::Tile::Treeview.new(@main_frame) do
            columns ['Nombre', 'Prioridad', 'Responsable', 'Eliminar']
            pack(fill: :both, expand: true)
        end
        @base = Base_datos_m.new
        datos = @base.mostrar
        @tabla.insert('', 'end', values: ["ID","Nombre", "Prioridad", "Estado"])
        datos.each do |id,nombre, prioridad, estado|
            @tabla.insert('', 'end', values: [id,nombre, prioridad, estado])
        end


    end


    

  def cerrar_ventana
    $principal.deiconify()
    @root.destroy()
  end

end
