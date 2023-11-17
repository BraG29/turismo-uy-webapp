package uy.turismo.webapp.servlets;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import uy.turismo.webapp.functions.Functions;
import uy.turismo.webapp.ws.controller.ActivityState;
import uy.turismo.webapp.ws.controller.DtTouristWS;
import uy.turismo.webapp.ws.controller.DtTouristicActivityWS;
import uy.turismo.webapp.ws.controller.DtTouristicDepartureWS;
import uy.turismo.webapp.ws.controller.Publisher;
import uy.turismo.webapp.ws.controller.PublisherService;

@MultipartConfig(location="/tmp", fileSizeThreshold=0, maxFileSize=5242880, maxRequestSize=20971520)
public class ServletRegisterDeparture extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletRegisterDeparture() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PublisherService service = new PublisherService();
		Publisher controller = service.getPublisherPort();
		//TODO conseguir las actividades ACEPTADAS del PROVEDOR en el que estoy parado.
		
		List<DtTouristicActivityWS> activitiesStated = controller.getListActivityStated(ActivityState.ACCEPTED).getItem();
		
		request.setAttribute("activitiesStated", activitiesStated);

		request.getRequestDispatcher("pages/departures/registerDeparture.jsp")
		.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		Long activityId = Long.parseLong(request.getParameter("activityId"));
		String nameDeparture = request.getParameter("nameDeparture");
		
		String dateString = request.getParameter("startingDate");
//		DateTimeFormatter formatterLocalDateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
//		LocalDateTime startingDate = LocalDateTime.parse(dateString, formatterLocalDateTime);//DepartureDateTime
//		
//		//Codigo agregado: LT
//		String startingDateStr = Functions.convertDateTimeToString(startingDate);
		
		
		int maxTourists = Integer.parseInt(request.getParameter("maxTourists"));
		
		String place = request.getParameter("place");
		
		LocalDate uploadDate = LocalDate.now();
		String uploadDateStr = Functions.convertDateToString(uploadDate);
		
		Part filePart = request.getPart("image"); // "image" debe coincidir con el atributo name del campo en tu formulario
		InputStream fileContent = filePart.getInputStream();
		BufferedImage imageRequest = ImageIO.read(fileContent);
		
		byte[] image = null;

		if(imageRequest != null) {
			image = Functions.convertImageToArray(imageRequest);
		}
		
		
		PublisherService service = new PublisherService();
		Publisher controller = service.getPublisherPort();
		
		
		DtTouristicActivityWS activity = controller.getTouristicActivityData(activityId);
		DtTouristWS tourist = new DtTouristWS();
		List<DtTouristWS> tourists = new ArrayList<DtTouristWS>();
		tourists.add(tourist);
		
		DtTouristicDepartureWS departureData = new DtTouristicDepartureWS(
               
				);
		/*
		 *  null,
				nameDeparture,
				maxTourists,
				uploadDate,
				startingDate,
				place,
				image,
				activity,
				tourists
		 * */
		
		departureData.setName(nameDeparture);
		departureData.setMaxTourist(maxTourists);
		departureData.setUploadDate(uploadDateStr);
		departureData.setDepartureDateTime(dateString);
		departureData.setPlace(place);
		departureData.setImage(image);
		departureData.setTouristicActivity(activity);
		//departureData.setTourist(tourists);
		
		try {
			controller.registerTouristicDeparture(departureData);
			
			String successType = "Departure";
				
			request.setAttribute("successType", successType);	
			
			request.getRequestDispatcher("/successPage").forward(request, response);	
			
		} catch (Exception e) {
			
			String errorType = "Departure";
			
			request.setAttribute("errorType", errorType);
			
			request.setAttribute("error", e.getLocalizedMessage());
			
			request.getRequestDispatcher("/errorPage").forward(request, response);
		}
		
	}
}
