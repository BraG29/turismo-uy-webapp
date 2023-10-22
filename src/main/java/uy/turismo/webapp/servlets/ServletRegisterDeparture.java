//package uy.turismo.webapp.servlets;
//
//import java.awt.image.BufferedImage;
//import java.io.IOException;
//import java.io.InputStream;
//import java.time.LocalDate;
//import java.time.format.DateTimeFormatter;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.imageio.ImageIO;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.Part;
//
//import uy.turismo.servidorcentral.logic.controller.Controller;
//import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
//import uy.turismo.servidorcentral.logic.controller.IController;
//import uy.turismo.servidorcentral.logic.datatypes.DtCategory;
//import uy.turismo.servidorcentral.logic.datatypes.DtDepartment;
//import uy.turismo.servidorcentral.logic.datatypes.DtProvider;
//import uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity;
//import uy.turismos.servidorcentral.logic.enums.ActivityState;
//
//@MultipartConfig(location="/tmp", fileSizeThreshold=0, maxFileSize=5242880, maxRequestSize=20971520)
//public class ServletRegisterDeparture extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//    public ServletRegisterDeparture() {
//        super();
//    }
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        IController controller = ControllerFactory.getIController();
//		List<DtProvider> providers = controller.getListProvider();
//		List<DtTouristicActivity> activities = controller.getListTouristicActivity();
//		
//		request.setAttribute("providers",providers);
//		request.setAttribute("activities", activities);
//		request.getRequestDispatcher("pages/departures/consultDeparture.jsp")
//		.forward(request, response);
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        
//		String nameActivity = request.getParameter("nameActivity");
//		String nameDeparture = request.getParameter("nameDeparture");
//		String dateString = request.getParameter("startingDate");
//		LocalDate startingDate = LocalDate.parse(dateString, formatter);
//
//		int hour = Integer.parseInt(request.getParameter("hour")); // TOOD: ¿¿Aca se envia todo junto con la fecha o es un campo separado ???
//		int maxTourists = Integer.parseInt(request.getParameter("maxTourists"));
//		String place = request.getParameter("place");
//		String localDate =  formatter.format(LocalDate.now()).toString(); // TOOD: Aca verificar si se pone como String o como Date
//        
//        Part filePart = request.getPart("image"); // "image" debe coincidir con el atributo name del campo en tu formulario
//		InputStream fileContent = filePart.getInputStream();
//		BufferedImage image = ImageIO.read(fileContent);	
//
//        ActivityState state = ActivityState.ADDED;
//        DtProvider provider = new DtProvider(Long.parseLong((String) request.getParameter("provider")), "", "", null);
//		DtDepartment department = new DtDepartment(Long.parseLong(request.getParameter("department")));
//		
//
//		ImageIO image = request.getParameter("image"); // TODO: Aca hay que poner el path hacia la imagen. Pls no enviar la imagen hacia la BD
//			// Como miercoles se recoge la extension a la imagen
//			// assets/images/" + nameDeparture + "extension
//
//        IController controller = ControllerFactory.getIController();
//		DtTouristicDeparture departureData = new DtTouristicDeparture(
//                null,
//				nameActivity,
//				nameDeparture,
//				startingDate,
//				hour,
//				maxTourists,
//				place,
//				localDate,
//				image
//				);
//		
//		controller.registerDeparture(departureData);
//	}
//}