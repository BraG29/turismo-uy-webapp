package uy.turismo.webapp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import uy.turismo.webapp.functions.Functions;
import uy.turismo.webapp.ws.controller.DtTouristicActivityWS;
import uy.turismo.webapp.ws.controller.Publisher;
import uy.turismo.webapp.ws.controller.PublisherService;

/**
 * Servlet implementation class ServletShowActivity
 */
public class ServletShowActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public ServletShowActivity() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		Long activityId = Long.parseLong(request.getParameter("activityId"));
		
		PublisherService service = new PublisherService();
		Publisher controller = service.getPublisherPort();
		
		DtTouristicActivityWS activityToShow = controller.getTouristicActivityData(activityId);
		
		String activityImagePath = Functions.saveImage(
				activityToShow.getImage(),
				activityToShow.getName(),
				getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
				"activity/");
		
		request.setAttribute("activityToShow", activityToShow);
		request.setAttribute("activityImagePath", activityImagePath);

		request.getRequestDispatcher("pages/activities/showActivity.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
