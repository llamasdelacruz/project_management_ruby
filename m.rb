require 'tk'

# Crear la ventana principal
root = TkRoot.new do
  title "Inicio de Sesión"
  geometry "300x200"
end

# Estilos
background_color = "#f0f0f0"
label_color = "#333"
button_color = "#4caf50"
button_hover_color = "#388e3c"
font = "Helvetica"

# Frame principal
main_frame = TkFrame.new(root) do
  background background_color
  pack(fill: :both, expand: true)
end

# Etiqueta de título
title_label = TkLabel.new(main_frame) do
  text "Inicio de Sesión"
  font "#{font} 16 bold"
  foreground label_color
  background background_color
  pack(pady: 10)
end

# Entradas de usuario y contraseña
username_label = TkLabel.new(main_frame) do
  text "Usuario:"
  font "#{font} 12"
  foreground label_color
  background background_color
  pack(pady: 5)
end

username_entry = TkEntry.new(main_frame) do
  font "#{font} 12"
  pack(pady: 5)
end

password_label = TkLabel.new(main_frame) do
  text "Contraseña:"
  font "#{font} 12"
  foreground label_color
  background background_color
  pack(pady: 5)
end

password_entry = TkEntry.new(main_frame) do
  font "#{font} 12"
  show "*"
  pack(pady: 5)
end

# Botón de inicio de sesión
login_button = TkButton.new(main_frame) do
  text "Iniciar Sesión"
  font "#{font} 12"
  foreground "white"
  background button_color
  borderwidth 0
  activebackground button_hover_color
  command do
    # Aquí puedes agregar la lógica de inicio de sesión
    Tk.messageBox(title: "Mensaje", message: "Inicio de sesión exitoso")
  end
  pack(pady: 10)
end

# Mantener la ventana abierta
Tk.mainloop
