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
import uy.turismo.servidorcentral.logic.datatypes.DtCategory;
import uy.turismo.servidorcentral.logic.datatypes.DtProvider;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity;
import uy.turismo.webapp.functions.Functions;
import uy.turismos.servidorcentral.logic.enums.ActivityState;

/**
 * Servlet implementation class ServletConsultActivity
 */
public class ServletConsultActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletConsultActivity() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IController controller = ControllerFactory.getIController();
		
		List<DtProvider> providers = controller.getListProvider();
		List<DtCategory> categories = controller.getListCategory();
		List<DtTouristicActivity> activitiesStated = controller.getListActivityStated(ActivityState.ACCEPTED);
		
		request.setAttribute("providers",providers);
		request.setAttribute("categories", categories);
		request.setAttribute("activitiesStated", activitiesStated);
		
		Map<Long, String> activityImages = new HashMap<Long, String>();
		
		for(DtTouristicActivity activity : activitiesStated) {
			String activityImagePath = Functions.saveImage(
					activity.getImage(),
					activity.getName(),
					getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
					"activity/");
			
			activityImages.put(activity.getId(), activityImagePath);
		}
		
		request.setAttribute("activityImages", activityImages);
		
		System.out.println(request.getParameter("department"));
		System.out.println("_______________________________________________________");
		System.out.println(request.getParameter("categories"));
		System.out.println("_______________________________________________________");
		System.out.println(request.getParameter("activitiesStated"));
		
		request.getRequestDispatcher("pages/activities/consultActivity.jsp")
		.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
