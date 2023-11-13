package uy.turismo.webapp.servlets;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import uy.turismo.webapp.ws.controller.ActivityState;
import uy.turismo.webapp.ws.controller.DtCategoryWS;
import uy.turismo.webapp.ws.controller.DtDepartmentWS;
import uy.turismo.webapp.ws.controller.DtProviderWS;
import uy.turismo.webapp.ws.controller.DtTouristicActivityWS;

/**
 * Servlet implementation class ServletRegisterActivity
 */
@MultipartConfig(location="/tmp", fileSizeThreshold=0, maxFileSize=5242880, maxRequestSize=20971520)
public class ServletRegisterActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegisterActivity() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IController controller = ControllerFactory.getIController();
		List<DtCategory> categories = controller.getListCategory();
		
		request.setAttribute("categories", categories);
		request.getRequestDispatcher("pages/activities/registerActivity.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		Long id = null;
		HttpSession session = request.getSession();
		String name = request.getParameter("activityName");
		String description = request.getParameter("description");
		
		//agrego codigo : LT
		String urlVideo = request.getParameter("videoURL");
		
		Double duration = Double.parseDouble(request.getParameter("duration"));
		Double cost = Double.parseDouble(request.getParameter("cost"));
		String city = request.getParameter("city");
		
		Part filePart = request.getPart("image"); // "image" debe coincidir con el atributo name del campo en tu formulario
		InputStream fileContent = filePart.getInputStream();
		BufferedImage image = ImageIO.read(fileContent);
		
		ActivityState state = ActivityState.ADDED;
		
		String dateString = request.getParameter("uploadDate");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate uploadDate = LocalDate.parse(dateString, formatter);
		
		DtProvider provider = new DtProvider( (Long) session.getAttribute("userId"), "", "", null);
		DtDepartment department = new DtDepartment(Long.parseLong(request.getParameter("department")));
		
		String[] arrayCategories = request.getParameterValues("categories");
		List<DtCategory> categoriesList = new ArrayList<DtCategory>();
		
		for(int c = 0; c < arrayCategories.length; c++) {
			DtCategory category = new DtCategory(Long.parseLong(arrayCategories[c]));
			categoriesList.add(category);
		}
		
		
		try {
			IController controller = ControllerFactory.getIController();
			
			DtTouristicActivity DTA = new DtTouristicActivity(id,
															name,
															description,
															duration,
															cost,
															city,
															image,
															state,
															uploadDate,
															provider,
															department,
															null,
															null,
															categoriesList);
					
			controller.registeTouristicActivity(DTA);
			
			String successType = "Activity";
			
			request.setAttribute("successType", successType);	
			
			request.getRequestDispatcher("/successPage")
			.forward(request, response);	
			
			
		} catch (Exception e) {
			
			String errorType = "Activity";
			
			request.setAttribute("errorType", errorType);
			
			request.setAttribute("error", e.getLocalizedMessage());
			
			request.getRequestDispatcher("/errorPage")
			.forward(request, response);
		}
		
		
		
		
	}

}
