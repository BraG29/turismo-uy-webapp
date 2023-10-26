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

import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtTourist;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicDeparture;
import uy.turismos.servidorcentral.logic.enums.ActivityState;

@MultipartConfig(location="/tmp", fileSizeThreshold=0, maxFileSize=5242880, maxRequestSize=20971520)
public class ServletRegisterDeparture extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletRegisterDeparture() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IController controller = ControllerFactory.getIController();
		List<DtTouristicActivity> activitiesStated = controller.getListActivityStated(ActivityState.ACCEPTED);
		
		request.setAttribute("activitiesStated", activitiesStated);

		request.getRequestDispatcher("pages/departures/registerDeparture.jsp")
		.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		Long activityId = Long.parseLong(request.getParameter("activityId"));
		String nameDeparture = request.getParameter("nameDeparture");
		
		String dateString = request.getParameter("startingDate");
		DateTimeFormatter formatterLocalDateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		LocalDateTime startingDate = LocalDateTime.parse(dateString, formatterLocalDateTime);//DepartureDateTime
		
		int maxTourists = Integer.parseInt(request.getParameter("maxTourists"));
		
		String place = request.getParameter("place");
		
		LocalDate uploadDate = LocalDate.now();
		
		Part filePart = request.getPart("image"); // "image" debe coincidir con el atributo name del campo en tu formulario
		InputStream fileContent = filePart.getInputStream();
		BufferedImage image = ImageIO.read(fileContent);
		
		IController controller = ControllerFactory.getIController();
		
		DtTouristicActivity activity = controller.getTouristicActivityData(activityId);
		DtTourist tourist = new DtTourist();
		List<DtTourist> tourists = new ArrayList<DtTourist>();
		tourists.add(tourist);
		
		DtTouristicDeparture departureData = new DtTouristicDeparture(
                null,
				nameDeparture,
				maxTourists,
				uploadDate,
				startingDate,
				place,
				image,
				activity,
				tourists
				);
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
