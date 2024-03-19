require 'fox16'
include Fox


class Interfaz < FXMainWindow
  def initialize(app)
    super(app, "Interfaz de prueba", :width => 400, :height => 400)
    #agregar etiqueta
    FXLabel.new(self, "Nombre: ", :opts => LAYOUT_EXPLICIT, :width => 100, :height => 20, :x => 0, :y => 0)

    #caja de texto
    @caja = FXTextField.new(self, 20, :opts => LAYOUT_EXPLICIT, :width => 100, :height => 20, :x => 100, :y => 0)

    #boton
    boton = FXButton.new(self, "Aceptar", :opts => LAYOUT_EXPLICIT, :width => 100, :height => 20, :x => 100, :y => 50)
    boton.connect(SEL_COMMAND) do
      puts "Boton presionado"
      puts @caja.text
    end

  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

app = FXApp.new

Ventana = Interfaz.new(app)
app.create
app.run
