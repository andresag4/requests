after :roles do
  puts '==> Creating the \'god user\'...'

# Elimina todos los registros existentes.
  User.delete_all

# Reinicia la secuencia de id a 1.
  ActiveRecord::Base.connection.reset_pk_sequence!('users')

# Contenido.
  role = Role.find_by_key('god')

  user = User.new(email: 'god@uach.mx', password: 'password', password_confirmation: 'password',
                  first_name: 'God', last_name: 'System', mother_last_name: 'User')

  user.role = role
  user.confirm
end
