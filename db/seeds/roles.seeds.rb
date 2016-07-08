puts '==> Filling the \'roles\' table...'

# Elimina todos los registros existentes.
Role.delete_all

# Reinicia la secuencia de id a 1.
ActiveRecord::Base.connection.reset_pk_sequence!('roles')

# Contenido.
Role.create(name: 'God', key: 'god',
            description: 'Super administrador del sistema. Tiene acceso a todo y superpoderes.', scope: 0)
