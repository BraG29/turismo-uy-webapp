package uy.turismo.webapp.servlets;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import uy.turismo.webapp.functions.Functions;
import uy.turismo.webapp.ws.controller.DtProviderWS;
import uy.turismo.webapp.ws.controller.DtTouristWS;
import uy.turismo.webapp.ws.controller.Publisher;
import uy.turismo.webapp.ws.controller.PublisherService;

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
		
		PublisherService service = new PublisherService();
		Publisher controller = service.getPublisherPort();
		
		String email = request.getParameter("email"); //llega bien	

		request.setCharacterEncoding("UTF-8");

		//response
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		
		String nickname = request.getParameter("nickname"); 
		
		String name = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String password = request.getParameter("password");
		
		String birthDateStr = request.getParameter("birthDate");		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");	
		LocalDate birthDate = LocalDate.parse(birthDateStr, formatter);
		
		//magia
		String birthDateSTR = Functions.convertDateToString(birthDate);
		
		//provider
		String web = request.getParameter("web");
		String description = request.getParameter("description");
		
		//tourist
		String country = request.getParameter("touristCountry");
		
		
		try {
		    	if( request.getParameter("userType").equalsIgnoreCase("provider") ){
		
		    		Part filePart = request.getPart("image"); // "image" debe coincidir con el atributo name del campo en tu formulario
		    		InputStream fileContent = filePart.getInputStream();
		    		BufferedImage requestImage = ImageIO.read(fileContent);
		    		
		    		byte[] image = Functions.convertImageToArray(requestImage);
		    		
		    		DtProviderWS userData = new DtProviderWS(); 
		    		userData.setName(name);
		    		userData.setNickname(nickname);
		    		userData.setEmail(email);
		    		userData.setLastName(lastName);
		    		userData.setBirthDate(birthDateSTR);
		    		userData.setImage(image);
		    		userData.setUrl(web);
		    		userData.setDescription(description);
		    		userData.setPassword(password);
		    		
		    		controller.registerUser(userData);
		    		
		    		String successType = "User";
					
					request.setAttribute("successType", successType);
		    		
		    		request.getRequestDispatcher("/successPage").forward(request, response);
		    	}else {
		    		
		    		Part filePart = request.getPart("image"); // "image" debe coincidir con el atributo name del campo en tu formulario
		    		InputStream fileContent = filePart.getInputStream();
		    		BufferedImage requestImage = ImageIO.read(fileContent);
		    		
		    		byte[] image = Functions.convertImageToArray(requestImage);
		    	
		    		DtTouristWS userData =  new DtTouristWS();
		    		userData.setName(name);
		    		userData.setNickname(nickname);
		    		userData.setEmail(email);
		    		userData.setLastName(lastName);
		    		userData.setBirthDate(birthDateSTR);
		    		userData.setImage(image);
		    		userData.setNationality(country);
		    		userData.setPassword(password);
		    		
		    		controller.registerUser(userData);
		    		
		    		String successType = "User";
					
					request.setAttribute("successType", successType);
		    		
		    		request.getRequestDispatcher("/successPage").forward(request, response);
	    	}
    	
		}catch(Exception e) {
			
			String errorType = "User";
			
			request.setAttribute("errorType", errorType);
			
			request.setAttribute("error", e.getLocalizedMessage());
			
			request.getRequestDispatcher("/errorPage").forward(request, response);
		}

	}

}