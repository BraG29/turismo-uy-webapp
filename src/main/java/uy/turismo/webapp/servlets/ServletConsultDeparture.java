package uy.turismo.webapp.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicDeparture;
import uy.turismo.webapp.functions.Functions;

/**
 * Servlet implementation class ServletConsultDeparture
 */
public class ServletConsultDeparture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletConsultDeparture() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IController controller = ControllerFactory.getIController();
		
		if(request.getParameter("activityId") != null) {
			
			Long activityId = Long.parseLong(request.getParameter("activityId"));
		
			List<DtTouristicDeparture> departures = controller.getListTouristicDeparture(activityId);
			
			if(!departures.isEmpty()) {
				
				Map<Long, String> departureImages = new HashMap<Long, String>();
				
				for(DtTouristicDeparture departure : departures) {
					
					String departureImagePath = Functions.saveImage(
							departure.getImage(),
							departure.getName(),
							getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
							"departure/");
					
					departureImages.put(departure.getId(), departureImagePath);
				}
				
				request.setAttribute("departureImages", departureImages);
				
			}
			
			request.setAttribute("departures", departures);
			
			request.getRequestDispatcher("pages/departures/consultDeparture.jsp")
			.forward(request, response);
			
		}else if(request.getParameter("departureId") != null){

			Long departureId = Long.parseLong(request.getParameter("departureId"));
			
			DtTouristicDeparture departureData = controller.getTouristicDepartureData(departureId);
			
			
			String departureImagePath = Functions.saveImage(
					departureData.getImage(),
					departureData.getName(),
					getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
					"departure/");
			
			request.setAttribute("departureImage", departureImagePath);
			request.setAttribute("departure", departureData);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}