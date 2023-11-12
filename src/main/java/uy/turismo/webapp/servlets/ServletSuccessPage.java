package uy.turismo.webapp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletSucessPage
 */
public class ServletSuccessPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSuccessPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String successType = (String) request.getAttribute("successType");
		
		
		String successMessage = null;
		
			switch(successType) {
				
//				case "Inscription":
//					
//					Long departureId = Long.parseLong(request.getParameter("departureId"));
//					
//					request.setAttribute("departureId", departureId);
//					
//					request.setAttribute("successType", successType );
//					
//					successMessage = "Se ha inscripto con exito";
//					
//					request.setAttribute("successMessage", successMessage);
//					
//					request.getRequestDispatcher("templates/SuccessPage.jsp").forward(request, response);
//					
//					break;
					
				case "User":
					request.setAttribute("successType", successType);
					
					successMessage = "El usuario fue creado con exito";
					
					request.setAttribute("successMessage", successMessage);
					
					request.getRequestDispatcher("templates/SuccessPage.jsp").forward(request, response);
					break;
					
				case "Activity":
					
					request.setAttribute("successType", successType);
					
					successMessage = "La actividad fue realizada con exito";
					request.setAttribute("successMessage", successMessage);
					
					request.getRequestDispatcher("templates/SuccessPage.jsp").forward(request, response);
					
					
					break;
					
				case "Purchase":
					
					request.setAttribute("successType", successType);
					
					successMessage = "La compra fue realizada con exito";
					request.setAttribute("successMessage", successMessage);
					
					request.getRequestDispatcher("templates/SuccessPage.jsp").forward(request, response);
					
					break;
					
				case "Departure":
					
					request.setAttribute("successType", successType);
					
					successMessage = "La salida fue realizada con exito";
					request.setAttribute("successMessage", successMessage);
					
					request.getRequestDispatcher("templates/SuccessPage.jsp").forward(request, response);
					
				break;
			
			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
