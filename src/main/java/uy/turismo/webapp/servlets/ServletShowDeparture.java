package uy.turismo.webapp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import uy.turismo.webapp.ws.DtTouristicActivity;
//import uy.turismo.webapp.ws.DtTouristicDeparture;
//import uy.turismo.webapp.functions.Functions;

public class ServletShowDeparture extends HttpServlet {
	private static final long serialVersionUID = 1L;       
	
    public ServletShowDeparture() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		Long departureId = Long.parseLong(request.getParameter("id"));
		
		request.setAttribute("departureId", departureId);
		
		request.setAttribute("stream", getClass().getClassLoader().getResourceAsStream("configWebapp.properties"));
		
		request.getRequestDispatcher("pages/departures/showDeparture.jsp")
		.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}