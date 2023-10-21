package uy.turismo.webapp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicDeparture;
import uy.turismo.webapp.functions.Functions;

public class ServletShowDeparture extends HttpServlet {
	private static final long serialVersionUID = 1L;       
	
    public ServletShowDeparture() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		Long departureId = Long.parseLong(request.getParameter("departureId"));
		
		IController controller = ControllerFactory.getIController();
		
		DtTouristicDeparture departureToShow = controller.getTouristicDepartureData(departureId);
		
		String departureImagePath = Functions.saveImage(
				departureToShow.getImage(),
				departureToShow.getName(),
				getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
				"departure/");
		
		request.setAttribute("departureToShow", departureToShow);
		request.setAttribute("departureImagePath", departureImagePath);

		request.getRequestDispatcher("pages/activities/showDeparture.jsp")
		.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}