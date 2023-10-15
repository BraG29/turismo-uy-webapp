package uy.turismo.webapp.servlets;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uy.turismo.servidorcentral.logic.controller.Controller;
import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtDepartment;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity;
import uy.turismos.servidorcentral.logic.enums.ActivityState;

/**
 * Servlet implementation class ServletRegisterActivity
 */
public class ServletRegisterActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegisterActivity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("pages/activities/registerActivity.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		Long id = null;
		String name = request.getParameter("activityName");
		String description = request.getParameter("description");
		Double duration = Double.parseDouble(request.getParameter("duration"));
		Double cost = Double.parseDouble(request.getParameter("cost"));
		String city = request.getParameter("city");
		BufferedImage image = null; //File in HTML
		ActivityState state = ActivityState.ADDED;
		
		String dateString = request.getParameter("uploadDate");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate uploadDate = LocalDate.parse(dateString, formatter);
		
		//el Proveedor nunca se pide en la web
		
		Long departmentNumber = Long.parseLong(request.getParameter("department"));
		
		DtDepartment department = new DtDepartment(departmentNumber);
		System.out.println(request.getParameter("department"));
		
		IController controller = ControllerFactory.getIController();
		
		DtTouristicActivity DTA = new DtTouristicActivity(id,
														name,
														description,
														duration,
														cost,
														city,
														image,
														state,
														uploadDate,
														null,
														department,
														null,
														null,
														null);
		controller.registeTouristicActivity(DTA);
		*/
	}

}
