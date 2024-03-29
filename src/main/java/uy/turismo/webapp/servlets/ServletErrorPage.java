package uy.turismo.webapp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletErrorPage
 */
public class ServletErrorPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletErrorPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String errorType = (String) request.getAttribute("errorType");
		
		String error = (String) request.getAttribute("error");
		
		
		
		
			switch(errorType) {
			
				case "User":
					request.setAttribute("errorType", errorType);
					
					request.setAttribute("error", error);
					
					request.getRequestDispatcher("templates/ErrorPage.jsp").forward(request, response);
					break;
					
				case "Activity":
					
					request.setAttribute("errorType", errorType);
					

					request.setAttribute("error", error);
					
					request.getRequestDispatcher("templates/ErrorPage.jsp").forward(request, response);
					break;
					
					
				case "Purchase":
					//movi este bundleID a cuando realmente es necesario, sino explota el servlet.
					Long bundleId = Long.parseLong(request.getParameter("bundleId")); //bundle al que volver desde el boton
					
					request.setAttribute("bundleId", bundleId);
					
					request.setAttribute("errorType", errorType);
					
					request.setAttribute("error", error);
					
					request.getRequestDispatcher("templates/ErrorPage.jsp").forward(request, response);
					
					break;
					
				case "Departure":
					
					request.setAttribute("errorType", errorType);
					

					request.setAttribute("error", error);
					
					request.getRequestDispatcher("templates/ErrorPage.jsp").forward(request, response);
				break;
				
				case "FinishedActivity":
					
					request.setAttribute("errorType", errorType);

					request.setAttribute("error", error);
					
					request.getRequestDispatcher("templates/ErrorPage.jsp").forward(request, response);
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
