puts '==> Initializing the \'states\' table...'

# Elimina todos los registros existentes.
State.delete_all

# Reinicia la secuencia de id a 1.
ActiveRecord::Base.connection.reset_pk_sequence!('states')
