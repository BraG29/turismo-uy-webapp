package uy.turismo.webapp.servlets;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtProvider;
import uy.turismo.servidorcentral.logic.datatypes.DtTourist;
import uy.turismo.servidorcentral.logic.datatypes.DtUser;

/**
 * Servlet implementation class ServletRegister
 */
@WebServlet
@MultipartConfig(location="/tmp", fileSizeThreshold=0, maxFileSize=5242880, maxRequestSize=20971520)
public class ServletRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("pages/users/registerUser.jsp")
			.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		//users
		String name = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		String birthDateStr = request.getParameter("birthDate");		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");	
		LocalDate birthDate = LocalDate.parse(birthDateStr, formatter);
		
		//provider
		String web = request.getParameter("web");
		String description = request.getParameter("description");
		
		//tourist
		String country = request.getParameter("touristCountry");
		
		
		
    	if( request.getParameter("userType").equalsIgnoreCase("provider") ){

    		Part filePart = request.getPart("image"); // "image" debe coincidir con el atributo name del campo en tu formulario
    		InputStream fileContent = filePart.getInputStream();
    		BufferedImage image = ImageIO.read(fileContent);
    		
    		DtUser userData = new DtProvider(
    				null,
    				name,
    				nickname,
    				email,
    				lastName,
    				birthDate,
    				image,
    				web,
    				description,
    				null,
    				password
    				); 
    		
    		IController controller = ControllerFactory.getIController();
    		controller.registerUser(userData);
    	}else {
    		
    		Part filePart = request.getPart("image"); // "image" debe coincidir con el atributo name del campo en tu formulario
    		InputStream fileContent = filePart.getInputStream();
    		BufferedImage image = ImageIO.read(fileContent);
    		
    		DtUser userData =  new DtTourist(
    				null,
    				name,
    				nickname,
    				email,
    				lastName,
    				birthDate,
    				image,
    				country,
    				null,
    				password,
    				null,
    				null
    				);
    		
    		IController controller = ControllerFactory.getIController();
    		controller.registerUser(userData);
    		
    	}

	}

}