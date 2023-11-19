package uy.turismo.webapp.servlets;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uy.turismo.webapp.ws.controller.DtTouristicActivityWS;
import uy.turismo.webapp.ws.controller.DtTouristicDepartureWS;
import uy.turismo.webapp.functions.Functions;

import uy.turismo.webapp.functions.Functions;
import uy.turismo.webapp.ws.controller.Publisher;
import uy.turismo.webapp.ws.controller.PublisherService;

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
		
		PublisherService service = new PublisherService();
		
		Publisher controller = service.getPublisherPort();
		
		if(request.getParameter("activityId") != null) {
			
			Long activityId = Long.parseLong(request.getParameter("activityId"));
		
			//esta lista esta pidiendo un id : LT
			List<DtTouristicDepartureWS> departures = controller.getDeparturesByActivity(activityId).getItem();
			//List<DtTouristicDepartureWS> departures = controller.getListTouristicDeparture().getItem();
			
			if(!departures.isEmpty()) {
				
				Map<Long, String> departureImages = new HashMap<Long, String>();
				
				for(DtTouristicDepartureWS departure : departures) {
					
					BufferedImage departureImage = Functions.convertArrayToBI(departure.getImage());
					
					if(departureImage != null) {
						String departureImagePath = Functions.saveImage(
								departureImage,
								departure.getName(),
								getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
								"departure/");
						
						departureImages.put(departure.getId(), departureImagePath);
					}
					
				}
				
				request.setAttribute("departureImages", departureImages);
				
			}
			
			request.setAttribute("departures", departures);
			
			request.getRequestDispatcher("pages/departures/consultDeparture.jsp")
			.forward(request, response);
			
		}else if(request.getParameter("departureId") != null){

			Long departureId = Long.parseLong(request.getParameter("departureId"));
			
			DtTouristicDepartureWS departureData = controller.getTouristicDepartureData(departureId);
			
			BufferedImage departureImage = Functions.convertArrayToBI(departureData.getImage());
			String departureImagePath = Functions.saveImage(
					departureImage,
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
