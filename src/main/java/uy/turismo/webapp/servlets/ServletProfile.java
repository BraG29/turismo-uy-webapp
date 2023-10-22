package uy.turismo.webapp.servlets;

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

import com.mysql.cj.Session;

import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtProvider;
import uy.turismo.servidorcentral.logic.datatypes.DtPurchase;
import uy.turismo.servidorcentral.logic.datatypes.DtTourist;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicDeparture;
import uy.turismo.servidorcentral.logic.datatypes.DtUser;
import uy.turismo.webapp.functions.Functions;
import uy.turismos.servidorcentral.logic.enums.ActivityState;

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
		IController controller = ControllerFactory.getIController();
		
		Long userId = Long.parseLong(request.getParameter("id"));
		DtUser userData = controller.getUserData(userId);
		
		

//        InputStream inputStream = getClass().getClassLoader().getResourceAsStream("configWebapp.properties");
        String imagePath = Functions.saveImage(
        		userData.getImage(),
        		userData.getNickname(),
        		getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
        		"user/");
        
        
        if(userData instanceof DtProvider) {
        	DtProvider providerData = (DtProvider) userData;
        	if(providerData.getTouristicActivities() != null) {
        		
    			Map<Long, String> activityImages = new HashMap<Long, String>();
    			
    			for(DtTouristicActivity activity : providerData.getTouristicActivities()) {
    				String activityImagePath = Functions.saveImage(
    						activity.getImage(),
    						activity.getName(),
    						getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
    						"activity/");
    				activityImages.put(activity.getId(), activityImagePath);
    			}
    				
    			request.setAttribute("activityImages", activityImages);
        	}
        }else {
        	DtTourist touristData = (DtTourist) userData;
        	if(touristData.getDepartures() != null) {
        		
    			Map<Long, String> departureImages = new HashMap<Long, String>();
    			
    			for(DtTouristicDeparture departure : touristData.getDepartures()) {
    				String departureImagePath = Functions.saveImage(
    						departure.getImage(),
    						departure.getName(),
    						getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
    						"departure/");
    				departureImages.put(departure.getId(), departureImagePath);
    			}
    				
    			request.setAttribute("departureImages", departureImages);
        	}
        	if(touristData.getPurchases() != null) {
        		
    			Map<Long, String> bundleImages = new HashMap<Long, String>();
    			
    			for(DtPurchase purchase : touristData.getPurchases()) {
    				String bundleImagePath = Functions.saveImage(
    						purchase.getBundle().getImage(),
    						purchase.getBundle().getName(),
    						getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
    						"bundle/");
    				bundleImages.put(purchase.getBundle().getId(), bundleImagePath);
    			}
    				
    			request.setAttribute("bundleImages", bundleImages);
        	}
        	
        	
        	
        }
		
		request.setAttribute("userData", userData);
		request.setAttribute("imagePath", imagePath);
		
		request.getRequestDispatcher("pages/users/consultUser.jsp")
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