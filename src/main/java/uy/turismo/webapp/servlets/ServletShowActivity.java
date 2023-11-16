package uy.turismo.webapp.servlets;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uy.turismo.webapp.functions.Functions;
import uy.turismo.webapp.ws.controller.ActivityState;
import uy.turismo.webapp.ws.controller.DtProviderWS;
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
		
		HttpSession session = request.getSession();
		String userType = (String) session.getAttribute("userType");
		
		if(userType != null) {
			if(userType.equalsIgnoreCase("provider")) {
				
				Long providerId = (Long) session.getAttribute("userId");
				DtProviderWS providerData = (DtProviderWS) controller.getUserData(providerId);
				List<DtTouristicActivityWS> providerActivities = providerData.getTouristicActivities();
				request.setAttribute("providerActivities", providerActivities);
			}
		}
		
		
		
		
		//arreglar con el tema de byte[]
		BufferedImage imageToShow = Functions.convertArrayToBI(activityToShow.getImage());
		
		
		String activityImagePath = Functions.saveImage(
				imageToShow,
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
		
		PublisherService service = new PublisherService();

        Publisher controller = service.getPublisherPort();
        
        Long activityId = Long.parseLong(request.getParameter("activityId"));
        ActivityState state = ActivityState.FINISHED;
        
        controller.changeActivityState(activityId, state);
		
		response.sendRedirect(request.getContextPath() + "/consultActivity?redirectTo=activity");
	}

}
