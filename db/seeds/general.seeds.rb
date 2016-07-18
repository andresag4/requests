puts '==> Filling the \'General\' tables...'

# Elimina todos los registros existentes.
Gender.delete_all

# Reinicia la secuencia de id a 1.
ActiveRecord::Base.connection.reset_pk_sequence!('genders')
ActiveRecord::Base.connection.reset_pk_sequence!('entries')
ActiveRecord::Base.connection.reset_pk_sequence!('categories')
ActiveRecord::Base.connection.reset_pk_sequence!('areas')
ActiveRecord::Base.connection.reset_pk_sequence!('titles')

# Contenido.
Gender.create(name: 'Hombre')
Gender.create(name: 'Mujer')

Entry.create(name: 'Web')
Entry.create(name: 'Presencial')
Entry.create(name: 'Telefónica')
Entry.create(name: 'Correo Electrónico')

Category.create(name: 'Agrario', data_type: :project)
Category.create(name: 'Agrícola', data_type: :project)
Category.create(name: 'Altruista', data_type: :project)
Category.create(name: 'Asesoría', data_type: :project)
Category.create(name: 'Arte y Cultura', data_type: :project)
Category.create(name: 'Educación', data_type: :project)
Category.create(name: 'Ecológico', data_type: :project)
Category.create(name: 'Economico y Finanzas', data_type: :project)
Category.create(name: 'Salud', data_type: :project)
Category.create(name: 'Transporte', data_type: :project)
Category.create(name: 'Construcción', data_type: :project)
Category.create(name: 'Social', data_type: :project)
Category.create(name: 'Ciencia y Tecnología', data_type: :project)
Category.create(name: 'Deporte', data_type: :project)
Category.create(name: 'Otro', data_type: :project)

Category.create(name: 'Gobernador', data_type: :audience)
Category.create(name: 'Rocio Reza', data_type: :audience)
Category.create(name: 'Representante', data_type: :audience)

Category.create(name: 'Económico', data_type: :management)
Category.create(name: 'Especie', data_type: :management)
Category.create(name: 'Trámite', data_type: :management)
Category.create(name: 'Consultoría', data_type: :management)

Area.create(name: 'Proyectos')
Area.create(name: 'Quejas y Denuncias')
Area.create(name: 'Audiencias')
Area.create(name: 'Curriculums')
Area.create(name: 'Gestorías')

Title.create(name: 'Sr.')
Title.create(name: 'Sra.')
Title.create(name: 'Lic.')
Title.create(name: 'Ing.')
Title.create(name: 'Maestro.')
Title.create(name: 'Dr.')


names = [
    'CASA DE LAS ARTESANÍAS',
    'COLEGIO DE BACHILLERES DEL ESTADO DE CHIHUAHUA',
    'COLEGIO DE EDUCACIÓN PROFESIONAL TÉCNICA DEL ESTADO DE CHIHUAHUA',
    'COLEGIO DE ESTUDIOS CIENTÍFICOS Y TECNOLÓGICOS DEL ESTADO DE CHIHUAHUA',
    'COMISIÓN ESTATAL DE VIVIENDA, SUELO E INFRAESTRUCTURA DE CHIHUAHUA',
    'COMISIÓN ESTATAL PARA LA PROTECCIÓN CONTRA RIESGOS SANITARIOS',
    'CONSEJO ESTATAL DE POBLACIÓN',
    'COORDINACIÓN DE PROYECTOS ESPECIALES',
    'COORDINACIÓN ESTATAL DE LA TARAHUMARA',
    'CHIHUAHUA VIVE',
    'DESARROLLO INTEGRAL DE LA FAMILIA DEL ESTADO DE CHIHUAHUA',
    'EL COLEGIO DE CHIHUAHUA',
    'ESCUELA NORMAL SUPERIOR DEL ESTADO PROF. J. E. MEDRANO',
    'INSTITUTO CHIHUAHUENSE DE EDUCACIÓN PARA ADULTOS',
    'INSTITUTO CHIHUAHUENSE DE INFRAESTRUCTURA FÍSICA EDUCATIVA',
    'INSTITUTO CHIHUAHUENSE DE LA CULTURA',
    'INSTITUTO CHIHUAHUENSE DE LA JUVENTUD',
    'INSTITUTO CHIHUAHUENSE DE LA MUJER',
    'INSTITUTO CHIHUAHUENSE DE SALUD',
    'INSTITUTO CHIHUAHUENSE DEL DEPORTE Y CULTURA FÍSICA',
    'INSTITUTO DE APOYO AL DESARROLLO TECNOLÓGICO',
    'INSTITUTO DE CAPACITACIÓN PARA EL TRABAJO DEL ESTADO DE CHIHUAHUA',
    'INSTITUTO DE INNOVACIÓN Y COMPETITIVIDAD',
    'INSTITUTO TECNOLÓGICO SUPERIOR DE NUEVO CASAS GRANDES',
    'JUNTA CENTRAL DE AGUA Y SANEAMIENTO',
    'JUNTA DE ASISTENCIA PRIVADA DEL ESTADO',
    'PENSIONES CIVILES DEL ESTADO',
    'PROMOTORA DE LA INDUSTRIA CHIHUAHUENSE',
    'SEGURO POPULAR',
    'SERVICIOS DE SALUD DE CHIHUAHUA',
    'SERVICIOS EDUCATIVOS DEL ESTADO DE CHIHUAHUA',
    'SUBSISTEMA DE PREPARATORIA ABIERTA DEL ESTADO DE CHIHUAHUA',
    'UNIVERSIDAD PEDAGÓGICA NACIONAL',
    'UNIVERSIDAD POLITÉCNICA DE CHIHUAHUA',
    'UNIVERSIDAD TECNOLÓGICA DE PAQUIMÉ',
    'UNIVERSIDAD TECNOLÓGICA DE CIUDAD JUÁREZ',
    'UNIVERSIDAD TECNOLÓGICA DE CHIHUAHUA',
    'UNIVERSIDAD TECNOLÓGICA DE CHIHUAHUA SUR',
    'UNIVERSIDAD TECNOLÓGICA PASO DEL NORTE CD. JUÁREZ',
    'CONSEJERÍA JURÍDICA DEL ESTADO',
    'COORDINACIÓN DE COMUNICACIÓN SOCIAL',
    'COORDINACIÓN DE RELACIONES PÚBLICAS',
    'DESPACHO DEL C. GOBERNADOR',
    'FISCALÍA GENERAL DEL ESTADO',
    'SECRETARÍA DE COMUNICACIONES Y OBRAS PÚBLICAS',
    'SECRETARÍA DE DESARROLLO RURAL',
    'SECRETARÍA DE DESARROLLO SOCIAL',
    'SECRETARÍA DE DESARROLLO URBANO Y ECOLOGÍA',
    'SECRETARÍA DE ECONOMÍA',
    'SECRETARÍA DE EDUCACIÓN, CULTURA Y DEPORTE',
    'SECRETARÍA DE HACIENDA',
    'SECRETARÍA DE LA CONTRALORÍA',
    'SECRETARÍA DE SALUD',
    'SECRETARÍA DE TRABAJO Y PREVISIÓN SOCIAL',
    'SECRETARÍA GENERAL DE GOBIERNO',
    'FIDEAPECH',
    "FIDEICOMISO 'PRONABES' PROGRAMA NACIONAL DE BECAS",
    'FIDEICOMISO CASA CHIHUAHUA CENTRO DE PATRIMONIO CULTURAL',
    'FIDEICOMISO ESCUELAS DE CALIDAD',
    'FIDEICOMISO EXPO CHIHUAHUA',
    'FIDEICOMISO FONDO DE ATENCIÓN A NIÑOS Y NIÑAS HIJOS DE LAS VÍCTIMAS DE LA LUCHA CONTRA EL CRIMEN',
    'FIDEICOMISO FONDO MIXTO CONACYT',
    'FIDEICOMISO PARA LA COMPETITIVIDAD Y SEGURIDAD CIUDADANA',
    'FIDEICOMISO POLICÍA AMIGO',
    'FIDEICOMISO TRÁNSITO AMIGO',
    'FOSEG',
]

names.each do |name|
  Category.create(name: name, data_type: :complaint)
  Category.create(name: name, data_type: :resume)
end