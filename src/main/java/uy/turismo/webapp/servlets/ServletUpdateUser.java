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

import com.mysql.cj.Session;

import uy.turismo.webapp.ws.DtProvider;
import uy.turismo.webapp.ws.DtTourist;
import uy.turismo.webapp.ws.DtUser;
import uy.turismo.webapp.ws.Controller;
import uy.turismo.webapp.ws.ControllerService;

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
			
			ControllerService service = new ControllerService();
			Controller controller = service.getControllerPort();
			
			Long userId = Long.parseLong(request.getParameter("id"));
			DtUser userData = controller.getUserData(userId);
			
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
		
		HttpSession session = request.getSession();
		DtUser userData = (DtUser) session.getAttribute("userData");
		session.removeAttribute("userData");
		
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		
		String lastName = request.getParameter("lastName");

		String birthDateStr = request.getParameter("birthDate");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate birthDate = LocalDate.parse(birthDateStr, formatter);
		
		Part filePart = request.getPart("image");
		InputStream fileContent = filePart.getInputStream();
		BufferedImage image = ImageIO.read(fileContent);
		
		if( image == null) {
			
			image = userData.getImage();
		}
	
		ControllerService service = new ControllerService();
		Controller controller = service.getControllerPort();
		
		if(userData instanceof DtTourist) {
		
			String nationality = request.getParameter("nationality");
			
			DtTourist modifiedTourist = new DtTourist();
			modifiedTourist.setId(userData.getId());
			modifiedTourist.setName(name);
			modifiedTourist.setNickname(userData.getNickname());
			modifiedTourist.setEmail(userData.getEmail());
			modifiedTourist.setLastName(lastName);
			modifiedTourist.setBirthDate(birthDate);
			modifiedTourist.setImage(image);
			modifiedTourist.setNationality(nationality);
			modifiedTourist.setPassword(userData.getPassword());

			controller.updateUser(modifiedTourist);
			
			
		}else {
			String webSite = request.getParameter("webSite");
			String description = request.getParameter("description");
			
			DtProvider modifiedProvider = new DtProvider();
			modifiedProvider.setId(userData.getId());
			modifiedProvider.setName(name);
			modifiedProvider.setNickname(userData.getNickname());
			modifiedProvider.setEmail(userData.getEmail());
			modifiedProvider.setLastName(lastName);
			modifiedProvider.setBirthDate(birthDate);
			modifiedProvider.setImage(image);
			modifiedProvider.setUrl(webSite);
			modifiedProvider.setDescription(description);
			modifiedProvider.setPassword(userData.getPassword());
			
			controller.updateUser(modifiedProvider);
		}

		
		
		response.sendRedirect(request.getContextPath() 
				+ request.getServletPath() 
				+ "?id=" + userData.getId());
	}
}
