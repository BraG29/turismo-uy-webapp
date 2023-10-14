package uy.turismo.webapp.servlets;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtUser;
import uy.turismo.webapp.functions.Functions;

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

        InputStream inputStream = getClass().getClassLoader().getResourceAsStream("configWebapp.properties");
        String imagePath = Functions.saveImage(userData.getImage(), userData.getNickname() , inputStream);
		
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