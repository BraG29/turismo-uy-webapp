package uy.turismo.webapp.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import uy.turismo.servidorcentral.logic.controller.Controller;
import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtDepartment;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicDeparture;

public class RegisterDeparture extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletRegisterDeparture() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("pages/departures/consultDeparture.jsp")
			.forward(request, response);
	}


	protected List<String> getActivityForDeparture(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
        List<String> list = new ArrayList<String>();
		
        list.add("Thing1");
        list.add("Thing2");
        list.add("Thing3");
        return list;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		String nameActivity = request.getParameter("nameActivity");
		String nameDeparture = request.getParameter("nameDeparture");

		String dateString = request.getParameter("startingDate");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate startingDate = LocalDate.parse(dateString, formatter);

		int hour = Integer.parseInt(request.getParameter("hour")); // TOOD: ¿¿Aca se envia todo junto con la fecha o es un campo separado ???
		int maxTourists = Integer.parseInt(request.getParameter("maxTourists"));
		String place = request.getParameter("place");
		String localDate =  myFormatObj.format(LocalDate.now()).toString(); // TOOD: Aca verificar si se pone como String o como Date

		ImageIO image = request.getParameter("image"); // TODO: Aca hay que poner el path hacia la imagen. Pls no enviar la imagen hacia la BD
			// Como miercoles se recoge la extension a la imagen
			// assets/images/" + nameDeparture + "extension

		DtTouristicDeparture departureData = new DtTouristicDeparture(
				nameActivity,
				nameDeparture,
				startingDate,
				hour,
				maxTourists,
				place,
				localDate,
				image
				); 
		
		IController controller = ControllerFactory.getIController();
		controller.registerDeparture(departureData);
	}
}