package uy.turismo.webapp.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtDepartment;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicDeparture;

public class RegisterDeparture extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletRegisterDeparture() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("pages/departures/consultDeparture.jsp")
			.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		String name = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");	
		String birthDateStr = request.getParameter("birthDate");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		LocalDate birthDate = LocalDate.parse(birthDateStr, formatter);		

		DtUser userData = new DtProvider(
				null,
				name,
				nickname,
				email,
				lastName,
				birthDate,
				null,
				web,
				description,
				null,
				password
				); 
		
		IController controller = ControllerFactory.getIController();
		controller.registerUser(userData);
	}
}