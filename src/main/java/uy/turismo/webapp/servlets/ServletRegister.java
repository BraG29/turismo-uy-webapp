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

import uy.turismo.webapp.ws.DtProvider;
import uy.turismo.webapp.ws.DtTourist;
import uy.turismo.webapp.ws.Controller;
import uy.turismo.webapp.ws.ControllerService;

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
		request.setCharacterEncoding("UTF-8");
		//users
		request.setCharacterEncoding("UTF-8");
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
		
		ControllerService service = new ControllerService();
		Controller controller = service.getControllerPort();
		
		try {
		    	if( request.getParameter("userType").equalsIgnoreCase("provider") ){
		
		    		Part filePart = request.getPart("image"); // "image" debe coincidir con el atributo name del campo en tu formulario
		    		InputStream fileContent = filePart.getInputStream();
		    		BufferedImage image = ImageIO.read(fileContent);
		    		
		    		DtProvider userData = new DtProvider(); 
		    		userData.setName(name);
		    		userData.setNickname(nickname);
		    		userData.setEmail(email);
		    		userData.setLastName(lastName);
		    		userData.setBirthDate(birthDate);
		    		userData.setImage(image);
		    		userData.setUrl(web);
		    		userData.setDescription(description);
		    		userData.setPassword(password);
					
		    	}else {
		    		
		    		Part filePart = request.getPart("image"); // "image" debe coincidir con el atributo name del campo en tu formulario
		    		InputStream fileContent = filePart.getInputStream();
		    		BufferedImage image = ImageIO.read(fileContent);
		    		
		    		DtTourist userData =  new DtTourist();
		    		userData.setName(name);
		    		userData.setNickname(nickname);
		    		userData.setEmail(email);
		    		userData.setLastName(lastName);
		    		userData.setBirthDate(birthDate);
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