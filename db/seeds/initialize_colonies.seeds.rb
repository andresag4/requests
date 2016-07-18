puts '==> Initializing the \'colonies\' table...'

# Elimina todos los registros existentes.
Colony.delete_all

# Reinicia la secuencia de id a 1.
ActiveRecord::Base.connection.reset_pk_sequence!('colonies')
