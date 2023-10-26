package uy.turismo.webapp.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtPurchase;
import uy.turismo.servidorcentral.logic.datatypes.DtTourist;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicBundle;
import uy.turismo.servidorcentral.logic.datatypes.DtUser;

/**
 * Servlet implementation class ServletBundleProfile
 */
public class ServletBundleProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBundleProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long bundleId = Long.parseLong(request.getParameter("id"));
	
		request.setAttribute("idBundle", bundleId);
		
		request.setAttribute("stream", getClass().getClassLoader().getResourceAsStream("configWebapp.properties"));
		
		request.getRequestDispatcher("pages/bundles/consultBundle.jsp")
		.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		IController controller = ControllerFactory.getIController();

		Long bundleId = Long.parseLong(request.getParameter("bundleId"));
		
		DtTouristicBundle bundle = new DtTouristicBundle(bundleId);
		
		Long touristId = Long.parseLong(request.getParameter("touristId"));
		
		DtTourist tourist = new DtTourist(touristId, null, null, null);
		
		Long validityDays = Long.parseLong(request.getParameter("validity"));
		
		LocalDate purchaseDate = LocalDate.now();
		
		String priceStr = request.getParameter("priceToServlet");
		
		Double price = Double.parseDouble(priceStr);
	
		Integer touristAmount = Integer.parseInt(request.getParameter("touristAmount"));
		
		LocalDate expireDate = purchaseDate.plusDays(validityDays); //sumarle X que es el periodo de validez para obtener fecha de vencimiento.
		
		// armar DtPurchase
		DtPurchase purchase = new DtPurchase(null, purchaseDate, touristAmount, price, expireDate, tourist, bundle);
		try {
			controller.registerPurchase(purchase);
			
			String successType = "Purchase";
				
			request.setAttribute("successType", successType);	
			
			request.getRequestDispatcher("/successPage").forward(request, response);	
			
		}catch(Exception e) {

			String errorType = "Purchase";
			
			request.setAttribute("errorType", errorType);
			
			request.setAttribute("error", e.getLocalizedMessage());
			
			request.getRequestDispatcher("/errorPage").forward(request, response);
			
		}

	}

}
