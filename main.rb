require_relative 'ventanas/ventana_admin.rb'
require 'tk'

class LoginInterface
  def initialize
    $background_color = "#f0f0f0"  # Definir un color de fondo válido aquí
    $label_color = "#333"
    $button_color = "#4caf50"
    $button_hover_color = "#388e3c"
    $font = "Helvetica"
    create_gui
    
  end
  
  def create_gui
    @root =  TkRoot.new do
      title "Inicio de Sesión"
      geometry "300x250"
    end

    @main_frame = TkFrame.new(@root) do
      background $background_color
      pack(fill: :both, expand: true)
    end

    TkLabel.new(@main_frame) do
      text "Inicio de Sesión"
      font "#{$font} 16"
      foreground $label_color
      background $background_color
      pack(pady: 10)
    end

    TkLabel.new(@main_frame) do
      text "Usuario:"
      font "#{$font} 12"
      foreground $label_color
      background $background_color
      pack(pady: 5)
    end

    @username_entry = TkEntry.new(@main_frame) do
      font "#{$font} 12"
      pack(pady: 5)
    end

    TkLabel.new(@main_frame) do
      text "Contraseña:"
      font "#{$font} 12"
      foreground $label_color
      background $background_color
      pack(pady: 5)
    end

    @password_entry = TkEntry.new(@main_frame) do
      font "#{$font} 12"
      show "*"
      pack(pady: 5)
    end

    @button = TkButton.new(@main_frame) do
      text "Iniciar Sesión"
      font "#{$font} 12"
      foreground "white"
      background $button_color
      borderwidth 0
      activebackground $button_hover_color
     
      pack(pady: 10)
    end

    @button.command = Proc.new { login }
     
    
  end

  def login
    # Aquí puedes agregar la lógica de inicio de sesión
    if @username_entry.get == "a" && @password_entry.get == "a"
      
      @root.withdraw()
      AdminInterface.new(@root)
      
    else
      Tk.messageBox(title: "Mensaje", message: "Inicio de sesión fallido")
    end
  end
end

LoginInterface.new
Tk.mainloop

