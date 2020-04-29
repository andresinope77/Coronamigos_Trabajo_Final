#Trabajo Final
#Grupo Coronamigos
#Programación Orientada a Objetos

class Alumno
  attr_accessor :dni, :nombre, :apellido, :edad, :genero, :CS, :RE, :EC, :puntajeFinal, :listaTutores, :resultado
  def initialize(dni, nombre, apellido, edad, genero)
    @dni, @nombre, @apellido, @edad, @genero = dni, nombre, apellido, edad, genero
    @listaTutores = Array.new
    @CS = 0
    @RE = 0
    @EC = 0
    @puntajeFinal = 0
    @resultado = "NO INGRESA"
  end
end

class AlumnoNacional < Alumno
	attr_accessor :tipo, :promedio2do, :colegio
  	def initialize(dni, nombre, apellido, edad, genero, tipo, promedio2do)
 		super(dni, nombre, apellido, edad, genero)
 		@colegio = "NACIONAL"
 		@tipo = tipo.upcase
 		@promedio2do = promedio2do
 	end
 	def calificarSocioEconomica
 		if tipo == "RURAL"
 			return 100
		elsif tipo == "URBANA"
 			return 100
 		else
 			return 0
 		end
 	end

 	def calificarRendimiento
 		if promedio2do < 11
 			return 0
		elsif promedio2do < 14
 			return 20
		elsif promedio2do < 16
 			return 40
		elsif promedio2do < 18
 			return 60
		elsif promedio2do < 19
 			return 80
 		else
 			return 100
 		end
 	end
end

class AlumnoParticular < Alumno
	attr_accessor :pension, :puesto2do, :colegio
 	def initialize(dni, nombre, apellido, edad, genero, pension, puesto2do)
 		super(dni, nombre, apellido, edad, genero)
 		@colegio = "PARTICULAR"
 		@pension = pension
 		@puesto2do = puesto2do
 	end
 	def calificarSocioEconomica
 		if pension <= 200
 			return 90
  	elsif pension <= 400
  		return 70
		elsif pension <= 600
 			return 50
 		else
 			return 40
 		end
 	end

 	def calificarRendimiento
 		if puesto2do < 4
 			return 100
		elsif puesto2do < 6
 			return 80
		elsif puesto2do < 11
 			return 60
		elsif puesto2do < 21
 			return 40
 		else
 			return 0
 		end
 	end

end

class Tutor
	attr_accessor :dniAlumno, :dniTutor, :nombre, :apellido, :parentesco
	def initialize(dniAlumno, dniTutor, nombre, apellido, parentesco)
		@dniAlumno, @dniTutor, @nombre, @apellido, @parentesco = dniAlumno, dniTutor, nombre, apellido, parentesco
	end
end

class Examen
	attr_accessor :codigoEvaluacion, :numeroPregunta, :listaRespuestasAlumno, :listaRespuestasCorrectas
	def initialize(codigoEvaluacion, numeroPregunta)
		@codigoEvaluacion, @numeroPregunta = codigoEvaluacion, numeroPregunta
    @listaRespuestasAlumno = Array.new(numeroPregunta)
    @listaRespuestasCorrectas = Array.new(numeroPregunta)
	end

  def simularResultados(examen)
    #lógica para recorrer todo el array y asignale una letra aleatoria
    n = examen.numeroPregunta - 1
    for i in 0..n
      a = ('a'..'d').to_a.sample            #comando para sacar una letra aleatoria a - d (siendo d la respuesta en blanco)
      examen.listaRespuestasAlumno[i] = a   #se ingresa la letra aleatoria al array
    end
    #puts "#{examen.listaRespuestasAlumno}" #prueba de imprimir el array para ver los resultados del aleatorio
  end
end

class Ministerio
  attr_accessor :listaAlumnos, :listaExamenes, :listaIngresantes, :listaNoIngresantes, :listaDatosEstadisticos
	def initialize
    #Arrays para toda la lógica
		@listaAlumnos = Array.new
    @listaExamenes = Array.new
    @listaIngresantes = Array.new
    @listaNoIngresantes = Array.new
    #Variables para estadísticas
    @listaDatosEstadisticos = Array.new(10)
    #cantPostulanteMasculino, cantPostulanteFemenino, cantIngresanteMasculino, cantIngresanteFemenino, cantNoIngresanteMasculino, cantNoIngresanteFemenino
    #ingresanteCN, ingresanteCP, noIngresanteCN, noIngresanteCP
	end

  def obtenerPostulantesGenero
    a = b = 0
    for alumno in listaAlumnos
      if alumno.genero == "Masculino"
        a += 1
      elsif alumno.genero == "Femenino"
        b += 1
      else
        #No hace nada.
      end
    end

    listaDatosEstadisticos[0] = a
    listaDatosEstadisticos[1] = b
  end

  def obtenerIngresantesGenero
    a = b = 0
    for alumno in listaIngresantes
      if alumno.genero == "Masculino"
        a += 1
      elsif alumno.genero == "Femenino"
        b += 1
      else
        #No hace nada.
      end
    end

    listaDatosEstadisticos[2] = a
    listaDatosEstadisticos[3] = b
  end

  def obtenerNoIngresantesGenero
    a = b = 0
    for alumno in listaNoIngresantes
      if alumno.genero == "Masculino"
        a += 1
      elsif alumno.genero == "Femenino"
        b += 1
      else
        #No hace nada.
      end
    end

    listaDatosEstadisticos[4] = a
    listaDatosEstadisticos[5] = b
  end

  def obtenerIngresantesColegio
    a = b = 0
    c = listaIngresantes.length

    for alumno in listaIngresantes
      if alumno.colegio == "NACIONAL"
        a += 1
      elsif alumno.colegio == "PARTICULAR"
        b += 1
      else
        #No hace nada.
      end
    end

    listaDatosEstadisticos[6] = (a.to_f / c.to_f * 100.0).round(2)
    listaDatosEstadisticos[7] = (b.to_f / c.to_f * 100.0).round(2)
  end

  def obtenerNoIngresantesColegio
    a = b = 0
    c = listaNoIngresantes.length

    for alumno in listaNoIngresantes
      if alumno.colegio == "NACIONAL"
        a += 1
      elsif alumno.colegio == "PARTICULAR"
        b += 1
      else
        #No hace nada.
      end
    end

    listaDatosEstadisticos[8] = (a.to_f / c.to_f * 100.0).round(2)
    listaDatosEstadisticos[9] = (b.to_f / c.to_f * 100.0).round(2)
  end

  def obtenerEstadisticas
    obtenerPostulantesGenero
    obtenerIngresantesGenero
    obtenerNoIngresantesGenero
    obtenerIngresantesColegio
    obtenerNoIngresantesColegio

    return listaDatosEstadisticos
  end

  def registrarAlumno(alumno)
    validarExistenciaAlumno(alumno.dni)
    listaAlumnos.push(alumno)
  end

  def obtenerAlumno(dniAlumno)
    for alumno in listaAlumnos
      if alumno.dni == dniAlumno
        return alumno
      end
    end
  end
	
	def validarExistenciaAlumno(dni)
    for alumno in listaAlumnos
      raise "El alumno ya ha sido registrado." if alumno.dni == dni
    end
  end
	
  def registrarExamen(examen)
    validarExistenciaExamen(examen.codigoEvaluacion)
    listaExamenes.push(examen)
  end

  def validarExistenciaExamen(codigoEvaluacion)
    for examen in listaExamenes
      raise "El examen ya ha sido registrado." if examen.codigoEvaluacion == codigoEvaluacion
    end
  end
	
  def registrarTutor(tutor)
    for alumno in listaAlumnos  #busca el alumno que le corresponde al tutor
      if alumno.dni == tutor.dniAlumno
        n = alumno.listaTutores.length
        raise "El alumno ya cuenta con 2 tutores registrados." if n == 2  #comprueba que el alumno no tenga más de dos tutores
        alumno.listaTutores.push(tutor)
      end
    end
  end

  def obtenerTutores(dniAlumno)
    for alumno in listaAlumnos
      if alumno.dni == dniAlumno
        return alumno.listaTutores
      end
    end
  end
	
  def registrarTutor(tutor)
    for alumno in listaAlumnos  #busca el alumno que le corresponde al tutor
      if alumno.dni == tutor.dniAlumno
        n = alumno.listaTutores.length
        raise "El alumno ya cuenta con 2 tutores registrados." if n == 2  #comprueba que el alumno no tenga más de dos tutores
        alumno.listaTutores.push(tutor)
      end
    end
  end
	
  def validarCantidadRespuestas(examen, respuestas)
    m = respuestas.length
    raise "La cantidad de respuestas no coincide con la cantidad de preguntas del examen." if m != examen.numeroPregunta
  end
end

class Factoria
  def self.dameObjeto(tipo, *arg)
    case tipo
    when "AN"
      AlumnoNacional.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5],arg[6])
    when "AP"
      AlumnoParticular.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5],arg[6])
    when "EX"
      Examen.new(arg[0], arg[1])
    when "TU"
      Tutor.new(arg[0], arg[1], arg[2], arg[3], arg[4])
    end
  end
end


class Vista
  def listarDatosGenerales(datos)
    puts ""
    puts "***************Listado Total - Datos Generales***************"
    puts "DNI".ljust(10) + "NOMBRE".ljust(10) + "APELLIDO".ljust(10) + "EDAD".ljust(5) + "GENERO"
    for alumno in datos
      puts "#{alumno.dni}".ljust(10) + "#{alumno.nombre}".ljust(10) + "#{alumno.apellido}".ljust(10) + "#{alumno.edad}".ljust(5) + "#{alumno.genero}"
    end
  end

  def listarIngresantes(listaIngresantes)
    puts ""
    puts "***************Listado de Alumnos Ingresantes***************"
    puts "DNI".ljust(10) + "NOMBRE".ljust(10) + "APELLIDO".ljust(10) + "PUNTAJE"
    for alumno in listaIngresantes
      puts "#{alumno.dni}".ljust(10) + "#{alumno.nombre}".ljust(10) + "#{alumno.apellido}".ljust(10) + "#{alumno.puntajeFinal}".ljust(4)
    end
  end

  def listarNoIngresantes(listaNoIngresantes)
    puts ""
    puts "***************Listado de Alumnos No Ingresantes***************"
    puts "DNI".ljust(10) + "NOMBRE".ljust(10) + "APELLIDO".ljust(10) + "PUNTAJE"
    for alumno in listaNoIngresantes
      puts "#{alumno.dni}".ljust(10) + "#{alumno.nombre}".ljust(10) + "#{alumno.apellido}".ljust(10) + "#{alumno.puntajeFinal}".ljust(4)
    end
  end

  def listarResultadosGenerales(listaAlumnos)
    puts ""
    puts "***************Listado de Resultados Generales***************"
    puts "DNI".ljust(10) + "NOMBRE".ljust(10) + "APELLIDO".ljust(10) + "CS".ljust(4) + "RE".ljust(4) + "EC".ljust(6) + "PUNTAJE".ljust(8) + "RESULTADO"
    for alumno in listaAlumnos
      puts "#{alumno.dni}".ljust(10) + "#{alumno.nombre}".ljust(10) + "#{alumno.apellido}".ljust(10) + "#{alumno.CS}".ljust(4) + "#{alumno.RE}".ljust(4) + "#{alumno.EC}".ljust(6) + "#{alumno.puntajeFinal}".ljust(8) + "#{alumno.resultado}"
    end
  end

  def listarDatosEstudiante(alumno)
    puts ""
    puts "***************Datos Generales de Alumno***************"
    puts "DNI:" + "#{alumno.dni}".ljust(12) + "NOMBRE:" + "#{alumno.nombre}".ljust(12) + "APELLIDO:" + "#{alumno.apellido}"
    puts "EDAD:" + "#{alumno.edad}".ljust(11) + "GENERO:" + "#{alumno.genero}".ljust(12) + "COLEGIO:" + "#{alumno.colegio}"
    puts "CS:" + "#{alumno.CS}".ljust(5) + "RE:" + "#{alumno.RE}".ljust(5) + "EC:" + "#{alumno.EC}".ljust(5) + "PF:" + "#{alumno.puntajeFinal}".ljust(8) + "RESULTADO:" + "#{alumno.resultado}"
  end

  def listarTutores(listaTutores)
    puts ""
    puts "***************Datos de los Tutores del Alumno***************"
    puts "DNI ALUMNO".ljust(12) + "DNI".ljust(10) + "NOMBRE".ljust(10) + "APELLIDO".ljust(10) + "PARENTESCO"
    for tutor in listaTutores
      puts "#{tutor.dniAlumno}".ljust(12) + "#{tutor.dniTutor}".ljust(10) + "#{tutor.nombre}".ljust(10) + "#{tutor.apellido}".ljust(10) + "#{tutor.parentesco}"
    end
  end

  def listarEstadisticas(datos)
    puts ""
    puts "***************Datos Estadísticos del Proceso de Admisión***************"
    puts "Cantidad de Postulantes por Género:    Masculinos: " + datos[0].to_s.ljust(4) + "Femeninos: " + datos[1].to_s
    puts "Cantidad de Ingresantes por Género:    Masculinos: " + datos[2].to_s.ljust(4) + "Femeninos: " + datos[3].to_s
    puts "Cantidad de No Ingresantes por Género: Masculinos: " + datos[4].to_s.ljust(4) + "Femeninos: " + datos[5].to_s
    puts "Porcentaje ingresantes por tipo de Colegio.    Nacional: " + "#{datos[6].to_s}%".ljust(8) + "Particular: " + datos[7].to_s + "%"
    puts "Porcentaje no ingresantes por tipo de Colegio. Nacional: " + "#{datos[8].to_s}%".ljust(8) + "Particular: " + datos[9].to_s + "%"
  end
	
	def mensajeError(m)
    puts "Error: #{m}"
  end

  def mostrarValido(m)
    puts m
  end
end

class Controlador
  attr_accessor :vista, :modelo
  def initialize(vista, modelo)
    @vista = vista
    @modelo = modelo
  end

  def registrarAlumno(tipo, *arg)
    alum = Factoria.dameObjeto(tipo, *arg)
    begin
      modelo.registrarAlumno(alum)
      vista.mostrarValido("Alumno registrado exitosamente!")
    rescue Exception => e 
      vista.mensajeError(e.message)
    end
  end

  def registrarExamen(tipo, *arg)
    ex = Factoria.dameObjeto(tipo, *arg)
    begin
      modelo.registrarExamen(ex)
      vista.mostrarValido("Examen registrado exitosamente!")
    rescue Exception => e 
      vista.mensajeError(e.message)
    end
  end

  def registrarTutor(tipo, *arg)
    tut = Factoria.dameObjeto(tipo, *arg)
    begin
      modelo.registrarTutor(tut)
      vista.mostrarValido("Tutor registrado exitosamente!")
    rescue Exception => e 
      vista.mensajeError(e.message)
    end
  end
end

minedu = Ministerio.new
vista = Vista.new
controlador = Controlador.new(vista, minedu)

controlador.registrarAlumno("AP", 78945612, "Andres", "Inope", 15, "Masculino", 1200, 5)
controlador.registrarAlumno("AN", 12365478, "Paolo", "Guerrero", 11, "Masculino", "RURAL", 15)
controlador.registrarAlumno("AP", 65412877, "Adriana", "Lima", 12, "Femenino", 1800, 8)
controlador.registrarAlumno("AN", 65412888, "Chapo", "Guzman", 13, "Masculino", "RURAL", 14)
controlador.registrarAlumno("AP", 98744113, "Pablo", "Escobar", 11, "Masculino", 2500, 1)

controlador.registrarTutor("TU", 78945612, 65412382, "German", "Carty", "Padre")
controlador.registrarTutor("TU", 78945612, 65421555, "Johan", "Solis", "Tio")
controlador.registrarTutor("TU", 98744113, 65412382, "Frodo", "Arendale", "Tio")

controlador.registrarExamen("EX", 45, 10)
controlador.registrarExamen("EX", 12, 20)

resp1 = Array["a","b","c","a","b","c","a","b","c","a"]
controlador.ingresarRespuestasCorrectas(45, resp1)
resp2 = Array["a","b","c","a","b","c","a","b","c","a","a","b","c","a","b","c","a","b","c","a"]
controlador.ingresarRespuestasCorrectas(12, resp2)
