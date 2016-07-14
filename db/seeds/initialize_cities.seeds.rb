after :initialize_colonies do
  puts '==> Initializing the \'cities\' table...'

# Elimina todos los registros existentes.
  City.delete_all

# Reinicia la secuencia de id a 1.
  ActiveRecord::Base.connection.reset_pk_sequence!('cities')
end
