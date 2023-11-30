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
import uy.turismo.webapp.ws.controller.DtTouristWS;
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
		
		String actionType =request.getParameter("actionType");
		
		PublisherService service = new PublisherService();

        Publisher controller = service.getPublisherPort();
		
		switch (actionType) {
		
			case "Favourite":{
				
				HttpSession session = request.getSession();
				
				Long userId = (Long) session.getAttribute("userId");
				Long activityId = Long.parseLong(request.getParameter("activityId"));
				
				controller.markFavoriteActivty(userId,activityId);
				
				List<DtTouristicActivityWS> favActivities = (List<DtTouristicActivityWS>) session.getAttribute("favActivities");
				
				DtTouristicActivityWS activitytoFav = new DtTouristicActivityWS();
				activitytoFav.setId(activityId);
				favActivities.add(activitytoFav);
				session.removeAttribute("favActivities");
				session.setAttribute( "favActivities",favActivities);
				
				response.sendRedirect(request.getContextPath() + "/showActivity?activityId="+ activityId);
				break;}
				
			case "UnFavourite":{

				HttpSession session = request.getSession();
				
				Long userId = (Long) session.getAttribute("userId");
				Long activityId = Long.parseLong(request.getParameter("activityId"));
				
				controller.unMarkFavoriteActivity(userId,activityId);
				
				DtTouristicActivityWS activityToRemove = new DtTouristicActivityWS();
				activityToRemove.setId(activityId);

				List<DtTouristicActivityWS> favActivities = (List<DtTouristicActivityWS>) session.getAttribute("favActivities");
				
				favActivities.remove(activityToRemove);
				session.setAttribute("favActivities",favActivities);
				
				response.sendRedirect(request.getContextPath() + "/showActivity?activityId="+ activityId);
				
				break;}
				
			case "Finish":{
				
		        
		        Long activityId = Long.parseLong(request.getParameter("activityId"));
		        ActivityState state = ActivityState.FINISHED;
		        
		        try {
		        	controller.changeActivityState(activityId, state);
				} catch (Exception e) {

					String errorType = "FinishedActivity";
					
					request.setAttribute("errorType", errorType);
					
					request.setAttribute("error", "No se puede dar de baja la actividad porque aun tiene Salidas vigentes");
					
					request.getRequestDispatcher("/errorPage")
					.forward(request, response);
				}
		        
				
				response.sendRedirect(request.getContextPath() + "/consultActivity?redirectTo=activity");
				break;}
	
			default:
				
				break;
		}
	}

}
