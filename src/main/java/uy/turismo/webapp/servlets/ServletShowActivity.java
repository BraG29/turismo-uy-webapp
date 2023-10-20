package uy.turismo.webapp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity;
import uy.turismo.webapp.functions.Functions;

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
		
		IController controller = ControllerFactory.getIController();
		
		DtTouristicActivity activityToShow = controller.getTouristicActivityData(activityId);
		
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
