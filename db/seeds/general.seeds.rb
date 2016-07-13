puts '==> Filling the \'General\' tables...'

# Elimina todos los registros existentes.
Gender.delete_all

# Reinicia la secuencia de id a 1.
ActiveRecord::Base.connection.reset_pk_sequence!('genders')
#ActiveRecord::Base.connection.reset_pk_sequence!('categories')
#ActiveRecord::Base.connection.reset_pk_sequence!('areas')

# Contenido.
Gender.create(name: 'Hombre')
Gender.create(name: 'Mujer')

# Entry.create(name: 'Web')

# Category.create(name: '', data_type: :project)

# Area.create(name: '')
