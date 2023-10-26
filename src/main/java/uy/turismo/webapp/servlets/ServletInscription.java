package uy.turismo.webapp.servlets;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtInscription;
import uy.turismo.servidorcentral.logic.datatypes.DtTourist;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicDeparture;




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
		Long touristId = Long.parseLong(request.getParameter("touristId"));
		Long departureId = Long.parseLong(request.getParameter("departureId"));
		Integer touristAmount = Integer.parseInt(request.getParameter("touristAmount"));
		LocalDate inscriptionDate = LocalDate.now();
		
		IController controller = ControllerFactory.getIController();
		
		DtTouristicDeparture departureData = controller.getTouristicDepartureData(departureId);
		DtTourist touristData = new DtTourist(
				touristId,
				null,
				null,
				null
				);
		
		DtInscription inscriptionData = new DtInscription(
				null,
				inscriptionDate,
				null,
				touristAmount,
				touristData,
				departureData
				);
		try {
			controller.registerInscription(inscriptionData);
			
		} catch (Exception e) {
			System.out.println("No se ha podido dar de alta la Inscripcion");
		}
		
		request.getRequestDispatcher("/showDeparture?id=" + departureId)
			.forward(request, response);
				
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
