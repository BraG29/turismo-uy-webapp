package uy.turismo.webapp.servlets;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import uy.turismo.webapp.functions.Functions;
import uy.turismo.webapp.ws.controller.DtProviderWS;
import uy.turismo.webapp.ws.controller.DtPurchaseWS;
import uy.turismo.webapp.ws.controller.DtTouristWS;
import uy.turismo.webapp.ws.controller.DtTouristicActivityWS;
import uy.turismo.webapp.ws.controller.DtTouristicDepartureWS;
import uy.turismo.webapp.ws.controller.DtUserWS;
import uy.turismo.webapp.ws.controller.Publisher;
import uy.turismo.webapp.ws.controller.PublisherService;

/**
 * Servlet implementation class ServletProfile
 */
public class ServletProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PublisherService service = new PublisherService();
		Publisher controller = service.getPublisherPort();
		
		//para obtener los seguidos del usuario.
		
		
		
		
		Long userId = Long.parseLong(request.getParameter("id"));
		DtUserWS userData = null;
		
		try {
			userData = controller.getUserData(userId);
			
		} catch (Exception e) {
			System.err.println("Error en Profile: " + e.getMessage());
		}
		
//        InputStream inputStream = getClass().getClassLoader().getResourceAsStream("configWebapp.properties");
		BufferedImage userImage = Functions.convertArrayToBI(userData.getImage());
		if(userData != null) {
			String imagePath = Functions.saveImage(
					userImage,
					userData.getNickname(),
					getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
					"user/");
			
			
			if(userData instanceof DtProviderWS) {
				DtProviderWS providerData = (DtProviderWS) userData;
				if(providerData.getTouristicActivities() != null) {
					
					Map<Long, String> activityImages = new HashMap<Long, String>();
					
					for(DtTouristicActivityWS activity : providerData.getTouristicActivities()) {
						
						BufferedImage activityImage = Functions.convertArrayToBI(activity.getImage());
						
						if(activityImage != null) {
							String activityImagePath = Functions.saveImage(
									activityImage,
									activity.getName(),
									getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
									"activity/");
							activityImages.put(activity.getId(), activityImagePath);							
						}

					}
					
					request.setAttribute("activityImages", activityImages);
				}
			}else {
				DtTouristWS touristData = (DtTouristWS) userData;
				if(touristData.getDepartures() != null) {
					
					Map<Long, String> departureImages = new HashMap<Long, String>();
					
					for(DtTouristicDepartureWS departure : touristData.getDepartures()) {

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
				if(touristData.getPurchases() != null) {
					
					Map<Long, String> bundleImages = new HashMap<Long, String>();
					
					for(DtPurchaseWS purchase : touristData.getPurchases()) {
						BufferedImage bundleImage = Functions.convertArrayToBI(purchase.getBundle().getImage());

						if(bundleImage != null) {
							String bundleImagePath = Functions.saveImage(
									bundleImage,
									purchase.getBundle().getName(),
									getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
									"bundle/");
							
							bundleImages.put(purchase.getBundle().getId(), bundleImagePath);
							
						}
						
					}
					
					request.setAttribute("bundleImages", bundleImages);
				}
				
			}
			
			request.setAttribute("userData", userData);
			request.setAttribute("imagePath", imagePath);
			
		}
		
		request.getRequestDispatcher("pages/users/consultUser.jsp")
			.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PublisherService service = new PublisherService();
		Publisher controller = service.getPublisherPort();
		
		String action = request.getParameter("action");
		String userFollowedStr = request.getParameter("pageUserId");
		String userFollowerStr = request.getParameter("sessionUserId");
		
		Long userFollowed = Long.parseLong(userFollowedStr);
		Long userFollower = Long.parseLong(userFollowerStr);
		
		if("follow".equals(action)) {
			controller.followUser(userFollower, userFollowed);
			HttpSession session = request.getSession();
			
			List<DtUserWS> updatedFollowedList = controller.getUserData(userFollower).getFollows();
			session.setAttribute("followed", updatedFollowedList);
	
		}
		
		if ("unFollow".equals(action)) {
			controller.unFollowUser(userFollower, userFollowed);
			HttpSession session = request.getSession();		
			List<DtUserWS> updatedFollowedList = controller.getUserData(userFollower).getFollows();
			session.setAttribute("followed", updatedFollowedList);
		}
		
		response.sendRedirect(request.getContextPath() + "/profile?id="+userFollowed);
	}

}