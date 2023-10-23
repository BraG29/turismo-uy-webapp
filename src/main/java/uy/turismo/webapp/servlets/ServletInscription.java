package uy.turismo.webapp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**
 * Caso de uso Inscripción a Salida Turística
El caso de uso comienza cuando un turista desea registrarse para una salida turística.  
El turista elige una y el sistema muestra los datos básicos de las salidas vigentes, si existen. 
El turista indica la salida a la que se quiere inscribir, la cantidad de turistas
para la inscripción y la forma de pago (general o por paquete).
En caso de que el turista haya comprado paquetes que aún estén vigentes y
que incluyan la actividad turística de la salida seleccionada y posea
inscripciones disponibles, el sistema muestra estos paquetes y el turista
podrá elegir uno de ellos para realizar la inscripción. En este caso, se
deberán descontar la cantidad de inscripciones indicada del paquete
seleccionado y la actividad turística correspondiente.
En caso de que ya exista un registro de el/la turista a la salida turística o
se haya alcanzado el límite máximo de turistas para la salida, el turista
podrá (dependiendo del caso): cambiar la salida seleccionada o cancelar el
caso de uso. Finalmente, el sistema realiza la inscripción de el/la turista a
la salida en la fecha actual y con el costo de la inscripción quef
corresponda.
 */
public class ServletInscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletInscription() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		/* 
		 * Get Salidas Vigentes.
		 * 			if ( De aquellas actividades que estén con el State 'Confirmada' AND Cantidad inscripciones seleccionadas < inscripciones disponibles de la salida)
		 * 			{ Show Salidas; }
		 * 			
		 * 			if ( Usuario está inscripto a Salida )
		 * 			{
		 * 				Show Botones con Cancelar inscripción;
		 * 			}
		 * 
		 * 
		 * 
		 * Del usuario se busca si tiene un paquete comprado
		 * 			if ( Date Paquete Vigente, 
		 * 					Bool Paquete incluye esa Actividad Turística, 
		 * 					Int  Cantidad inscripciones seleccionadas < inscripciones disponibles del paquete )
		 * 				{ Show Paquetes }
		 * 				
		 * 			else
		 * 				Se hace la inscripcion sin un paquete
		 * 
		 * 
		 */
		




		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/* Viene el id de una departure
		 * Viene la cantidad de turistas que el quiere inscribir
		 * Viene la forma de pago (general o por paquete)
		 * 
		 * 
		 * if ( selecciono paquete ) {
		 * 		>> Ir a Paquete >>
		 * 		Int inscripciones disponibles - Cantidad inscripciones seleccionadas
		 * 		Delete (Actividad dentro de paquete)
		 * 	}
		 * 
		 * Registro con UsuarioId, Salida, Paquete, LocalDate, Costo
		 * 
		 */









		doGet(request, response);
	}

}