package uy.turismo.webapp.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uy.turismo.webapp.ws.controller.Publisher;
import uy.turismo.webapp.ws.controller.PublisherService;
import uy.turismo.webapp.functions.Functions;
import uy.turismo.webapp.ws.controller.DtPurchaseWS;
import uy.turismo.webapp.ws.controller.DtTouristWS;
import uy.turismo.webapp.ws.controller.DtTouristicBundleWS;



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
		
		PublisherService service = new PublisherService();
		
		Publisher controller = service.getPublisherPort();
		
		
		Long bundleId = Long.parseLong(request.getParameter("bundleId"));
		
		//bundleId
		DtTouristicBundleWS bundle = new DtTouristicBundleWS();
		
		bundle.setId(bundleId);
		
		Long touristId = Long.parseLong(request.getParameter("touristId"));
		
		DtTouristWS touristData = new DtTouristWS();
		
		try {
			touristData = (DtTouristWS) controller.getUserData(touristId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<DtPurchaseWS> listPurchases = touristData.getPurchases();
		
		
		Long validityDays = Long.parseLong(request.getParameter("validity")); //dias de validez del paquete , tambien lo uso para la compra
		
		Integer touristAmount = Integer.parseInt(request.getParameter("touristAmount")); //cantidad de turistas

		
		LocalDate purchaseDate = LocalDate.now(); //fecha de cuando se compra el paquete	
		String purchaseDateStr = Functions.convertDateToString(purchaseDate);
		
		
		String priceStr = request.getParameter("priceToServlet");
		Double price = Double.parseDouble(priceStr);
		
		LocalDate expireDate = purchaseDate.plusDays(validityDays); //sumarle X que es el periodo de validez para obtener fecha de vencimiento de la compra.
		String expireDateStr = Functions.convertDateToString(expireDate);
		
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
			DtPurchaseWS purchase = new DtPurchaseWS();
			
			purchase.setPurchaseDate(purchaseDateStr);
			purchase.setTouristAmount(touristAmount);
			purchase.setTotalCost(price);
			purchase.setExpireDate(expireDateStr);
			purchase.setTourist(touristData);
			purchase.setBundle(bundle);
			
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
