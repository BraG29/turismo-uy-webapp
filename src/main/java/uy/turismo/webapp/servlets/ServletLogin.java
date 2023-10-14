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

import com.mysql.cj.Session;

import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtTourist;
import uy.turismo.servidorcentral.logic.datatypes.DtUser;
import uy.turismo.webapp.functions.Functions;

//@WebServlet("/login")
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

//	Tomcat 2 - 0 ElPiche
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("loginUserEmailInput");
		String password = request.getParameter("loginUserPasswordInput");
		IController cotroller = ControllerFactory.getIController();
		
		DtUser user = cotroller.checkCredentials(email, password);
		
		
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getId());
            session.setAttribute(
            		"userName", 
            		String.format("%s %s", user.getName(), user.getLastName()));
            
            //Genero el input Stream aqui porque no podia hacerlo en la operacion 'seveImage' ya que es 'static'
            InputStream inputStream = getClass().getClassLoader().getResourceAsStream("configWebapp.properties");
            String image = Functions.saveImage(user.getImage(), user.getNickname(), inputStream);
            session.setAttribute("userImage", image);
            
            if(user instanceof DtTourist) {
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