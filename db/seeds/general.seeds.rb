puts '==> Filling the \'General\' tables...'

# Elimina todos los registros existentes.
Gender.delete_all

# Reinicia la secuencia de id a 1.
ActiveRecord::Base.connection.reset_pk_sequence!('genders')
#ActiveRecord::Base.connection.reset_pk_sequence!('entries')
#ActiveRecord::Base.connection.reset_pk_sequence!('categories')
#ActiveRecord::Base.connection.reset_pk_sequence!('areas')
ActiveRecord::Base.connection.reset_pk_sequence!('titles')

# Contenido.
Gender.create(name: 'Hombre')
Gender.create(name: 'Mujer')

# Entry.create(name: 'Web')

# Category.create(name: '', data_type: :project)

# Area.create(name: '')

Title.create(name: 'Sr.')
Title.create(name: 'Sra.')
Title.create(name: 'Lic.')
Title.create(name: 'Ing.')
Title.create(name: 'Maestro.')
Title.create(name: 'Dr.')
