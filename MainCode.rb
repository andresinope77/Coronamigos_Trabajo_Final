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
  def registrarTutor(tutor)
    for alumno in listaAlumnos  #busca el alumno que le corresponde al tutor
      if alumno.dni == tutor.dniAlumno
        n = alumno.listaTutores.length
        raise "El alumno ya cuenta con 2 tutores registrados." if n == 2  #comprueba que el alumno no tenga más de dos tutores
        alumno.listaTutores.push(tutor)
      end
    end
  end
end

