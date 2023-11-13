package uy.turismo.webapp.servlets;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import uy.turismo.webapp.functions.Functions;
import uy.turismo.webapp.ws.controller.DtProviderWS;
import uy.turismo.webapp.ws.controller.DtTouristWS;
import uy.turismo.webapp.ws.controller.DtUserWS;
import uy.turismo.webapp.ws.controller.Publisher;
import uy.turismo.webapp.ws.controller.PublisherService;


/**
 * Servlet implementation class ServletUpdateUser
 */
@MultipartConfig(location="/tmp", fileSizeThreshold=0, maxFileSize=5242880, maxRequestSize=20971520)
public class ServletUpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			PublisherService service = new PublisherService();
			Publisher controller = service.getPublisherPort();
			
			Long userId = Long.parseLong(request.getParameter("id"));
			DtUserWS userData = controller.getUserData(userId);
			
			String imagePath = (String) request.getSession().getAttribute("imagePath");
			
			
			request.setAttribute("userData", userData);
			request.setAttribute("imagePath", imagePath);
			
		} catch (Exception e) {
			System.err.println("Error en Update: " + e.getMessage());
		}
		
		request.getRequestDispatcher("pages/users/modifyUser.jsp")
			.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PublisherService service = new PublisherService();
		Publisher controller = service.getPublisherPort();
		
		HttpSession session = request.getSession();
		DtUserWS userData = (DtUserWS) session.getAttribute("userData");
		session.removeAttribute("userData");
		
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		
		String lastName = request.getParameter("lastName");

		String birthDateStr = request.getParameter("birthDate");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate birthDate = LocalDate.parse(birthDateStr, formatter);
		
		String birthDateSTR = Functions.convertDateToString(birthDate);
		
		
		Part filePart = request.getPart("image");
		InputStream fileContent = filePart.getInputStream();
		BufferedImage requestImage = ImageIO.read(fileContent);
		
		byte[] image = userData.getImage();
		
		if( image != null) {
			
			image = Functions.convertImageToArray(requestImage);
		}
		
		
		
		if(userData instanceof DtTouristWS) {
			
			
			
			String nationality = request.getParameter("nationality");
			
			DtTouristWS modifiedUser = new DtTouristWS();
			
			modifiedUser.setId(userData.getId());
			modifiedUser.setName(name);
			modifiedUser.setNickname(userData.getNickname());
			modifiedUser.setEmail(userData.getEmail());
			modifiedUser.setLastName(lastName);
			modifiedUser.setBirthDate(birthDateSTR);
			modifiedUser.setImage(image);
			modifiedUser.setNationality(nationality);
			modifiedUser.setPassword(userData.getPassword());
			
			
			
		}else {
			String webSite = request.getParameter("webSite");
			String description = request.getParameter("description");
			
			DtProviderWS modifiedUser = new DtProviderWS();
			
			modifiedUser.setId(userData.getId());
			modifiedUser.setName(name);
			modifiedUser.setNickname(userData.getNickname());
			modifiedUser.setEmail(userData.getEmail());
			modifiedUser.setLastName(lastName);
			modifiedUser.setBirthDate(birthDateSTR);
			modifiedUser.setImage(image);
			modifiedUser.setUrl(webSite);
			modifiedUser.setDescription(description);
			modifiedUser.setPassword(userData.getPassword());
			
			controller.updateUser(modifiedUser);
		}
		
	
		
		response.sendRedirect(request.getContextPath() 
				+ request.getServletPath() 
				+ "?id=" + userData.getId());
	}
}
