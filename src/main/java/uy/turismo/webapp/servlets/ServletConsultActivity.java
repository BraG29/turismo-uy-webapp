package uy.turismo.webapp.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uy.turismo.servidorcentral.logic.controller.Controller;
import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtCategory;
import uy.turismo.servidorcentral.logic.datatypes.DtDepartment;
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
		
		//Codigo al pedo
//		String algoPrueba = null;
//		algoPrueba = request.getParameter("selectControl");
		
		String redirectTo = request.getParameter("redirectTo");
		
		if(redirectTo.equalsIgnoreCase("activity")) {
			request.setAttribute("redirectTo", "activity");
			
		}else if(redirectTo.equalsIgnoreCase("departure")){
			request.setAttribute("redirectTo", "departure");
		}
		
		if(request.getParameter("selectControl") == null) {
			IController controller = ControllerFactory.getIController();
			
			List<DtTouristicActivity> activitiesStated = controller.getListActivityStated(ActivityState.ACCEPTED);
			List<DtCategory> categories = new ArrayList<DtCategory>();
			List<DtDepartment> departments = new ArrayList<DtDepartment>();
			
			Map<Long, String> activityImages = new HashMap<Long, String>();
			
			Map<Long, List<DtTouristicActivity>> filteredByDepartment = new HashMap<Long, List<DtTouristicActivity>>();
			
			Map<Long, List<DtTouristicActivity>> filteredByCategory = new HashMap<Long, List<DtTouristicActivity>>();
			
			
			for(DtTouristicActivity activity : activitiesStated) {
				
				Long departmentKey = activity.getDepartment().getId();
				
				if(!filteredByDepartment.containsKey(departmentKey)){
					List<DtTouristicActivity> activityListDepartment = new ArrayList<DtTouristicActivity>();
					activityListDepartment.add(activity);

					filteredByDepartment.put(departmentKey, activityListDepartment);
					departments.add(activity.getDepartment());
				}else{
					((List<DtTouristicActivity>) filteredByDepartment.get(departmentKey)).add(activity);
				}
				
				
				for(DtCategory category : activity.getCategories()){
					
					Long categoryKey = category.getId();
					
					if(!filteredByCategory.containsKey(categoryKey)){
						List<DtTouristicActivity> activityListCategory = new ArrayList<DtTouristicActivity>();
						
						activityListCategory.add(activity);
						filteredByCategory.put(categoryKey, activityListCategory);
						
						categories.add(category);
					}else{
						((List<DtTouristicActivity>) filteredByCategory.get(categoryKey)).add(activity);
					}
				}
			}
	
			for(DtTouristicActivity activity : activitiesStated) {
				String activityImagePath = Functions.saveImage(
						activity.getImage(),
						activity.getName(),
						getClass().getClassLoader().getResourceAsStream("configWebapp.properties"),
						"activity/");
				activityImages.put(activity.getId(), activityImagePath);
			}
			
			HttpSession session = request.getSession();
//			Long userId = (Long) session.getAttribute("userId");
//			
//			if(userId != null) {
//				
//			}
			
			session.removeAttribute("activityStated");
			session.removeAttribute("activityImages");
			session.removeAttribute("filteredByDepartment");
			session.removeAttribute("filteredByCategory");
			session.removeAttribute("categories");
			session.removeAttribute("departments");

			session.setAttribute("activityStated", activitiesStated);
			session.setAttribute("activityImages", activityImages);
			session.setAttribute("filteredByDepartment", filteredByDepartment);
			session.setAttribute("filteredByCategory", filteredByCategory);
			session.setAttribute("categories", categories);
			session.setAttribute("departments", departments);
			

		}else{
			switch (request.getParameter("selectControl")) {
			case "option2":
				Long idDepartment = Long.parseLong(request.getParameter("department"));
				String valorDepartment = "department";
				request.setAttribute("department", idDepartment);
				request.setAttribute("control", valorDepartment);
				break;
				
			case "option3":

				request.setAttribute("category", request.getParameter("categories"));
				request.setAttribute("control", "category");
				break;
				
			default:
				System.out.println("nada");
				break;
			}
		}
			
		
		request.getRequestDispatcher("pages/activities/consultActivity.jsp")
		.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
