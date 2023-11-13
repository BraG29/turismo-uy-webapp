package uy.turismo.webapp.servlets;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uy.turismo.webapp.functions.Functions;
import uy.turismo.webapp.ws.controller.DtTouristWS;
import uy.turismo.webapp.ws.controller.DtTouristicActivityWS;
import uy.turismo.webapp.ws.controller.DtUserWS;
import uy.turismo.webapp.ws.controller.Publisher;
import uy.turismo.webapp.ws.controller.PublisherService;


public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("pages/home/login.jsp")
			.forward(request, response);
	}

//	Tomcat 3 - 1 ElPiche
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("loginUserEmailInput");
		String password = request.getParameter("loginUserPasswordInput");
		
		PublisherService service = new PublisherService();
		Publisher controller = service.getPublisherPort();
		
		DtUserWS user = null;
		
		user = controller.checkCredentials(email, password);
			
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getId());
            session.setAttribute(
            		"userName", 
            		String.format("%s %s", user.getName(), user.getLastName()));
              
        	java.util.List<DtUserWS> followed = user.getFollowed();
        	session.setAttribute("followed", followed);
        	
            //Genero el input Stream aqui porque no podia hacerlo en la operacion 'seveImage' ya que es 'static'
            InputStream inputStream = getClass().getClassLoader().getResourceAsStream("configWebapp.properties");
            
            BufferedImage userImage = Functions.convertArrayToBI(user.getImage());
            
            String image = Functions.saveImage(
            		userImage, 
            		user.getNickname(), 
            		inputStream, 
            		"user/");
            session.setAttribute("userImage", image);
            
            if(user instanceof DtTouristWS) {
            	
            	 DtTouristWS touristUser = (DtTouristWS) user;
            	
            	java.util.List<DtTouristicActivityWS> activities = touristUser.getFavActivties();
            	session.setAttribute("favActivities", activities);
            	
            	//cargar actividad.
            	session.setAttribute("userType", "tourist");
                
            }else {
                session.setAttribute("userType", "provider");
                
            }
            
        	request.getRequestDispatcher("pages/home/index.jsp")
        	.forward(request, response); // Página de bienvenida
        } else {
          response.sendRedirect(request.getContextPath() + "/login"); // Redireccionar a la página de inicio de sesión si las credenciales son incorrectas
        }
    }

}