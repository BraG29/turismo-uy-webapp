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
		
		DtTourist touristData = new DtTourist();
		try {
			touristData = (DtTourist) controller.getUserData(touristId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<DtPurchase> listPurchases = touristData.getPurchases();
		
		
		DtTourist tourist = new DtTourist(touristId, null, null, null);
		
		Long validityDays = Long.parseLong(request.getParameter("validity")); //dias de validez del paquete , tambien lo uso para la compra
		
		Integer touristAmount = Integer.parseInt(request.getParameter("touristAmount")); //cantidad de turistas

		
		LocalDate purchaseDate = LocalDate.now(); //fecha de cuando se compra el paquete
		
		//para saber fecha de vencimiento del paquete
		String uploadDateStr = request.getParameter("uploadDate");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate uploadDate = LocalDate.parse(uploadDateStr,formatter);
		
		
		String priceStr = request.getParameter("priceToServlet");
		Double price = Double.parseDouble(priceStr);
		
		LocalDate expireDate = purchaseDate.plusDays(validityDays); //sumarle X que es el periodo de validez para obtener fecha de vencimiento de la compra.
		
		//LocalDate expiredBundleDate = uploadDate.plusDays(validityDays);
		
		for(int i = 0; i < listPurchases.size(); i++) {
			if(listPurchases.get(i).getBundle().getId() == bundleId ) { //si ya compro el paquete, o esta vencido
				String errorType = "Purchase";
				
				request.setAttribute("errorType", errorType);
				
				request.setAttribute("bundleId", bundleId);
				
				String error = "Ya compraste este paquete, verifique e intente nuevamente";
				
				request.setAttribute("error", error);
				
				request.getRequestDispatcher("/errorPage").forward(request, response);
			}
		}
		
		
		try {
			DtPurchase purchase = new DtPurchase(null, purchaseDate, touristAmount, price, expireDate, tourist, bundle);
			
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
