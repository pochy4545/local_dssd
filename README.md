# local_dssd
  
  * Aplicacion para la organización, gestión y
administración de los comparendos de internos (presos) con diversos actores del ámbito judicial
(Jueces, Abogados, Procuradores, etc) en el transcurso de la ejecución de su pena
  
# Requerimientos:

  * Rails 5.2.3
  * Mysql 8.0.17
  * Angular CLI: 8.3.17
  
# Set Up:

  * Clonar repositorio.

# Set Up Backend:

  * Ubicarse dentro de la carpeta del repositorio dssd.
  * Ejecutar bundle install
  * Ejecutar rails db:migrate
  * Levantar el servidor: ejecutar rails server
  
  *Aclaracion: por el momento no posee un archivo de seeds que inicialice la base de datos. por lo tanto es necesario para su correcto funcionamiento generar tanto los usuarios, como los roles y las unidades manipulando directamente la base de datos*
  
# set Up Frontend:
  
  * Ubicarse dentro de la carpeta del repositoreo frontend.
  * Ejecutar npm install
  * Levantar el servidor: ejecutar ng s

