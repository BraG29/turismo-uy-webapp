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

import uy.turismo.webapp.ws.controller.DtCategoryWS;
import uy.turismo.webapp.ws.controller.DtDepartmentWS;
import uy.turismo.webapp.ws.controller.DtProviderWS;
import uy.turismo.webapp.ws.controller.DtTouristicActivityWS;
import uy.turismo.webapp.ws.controller.ActivityState;

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

		ControllerService service = new ControllerService();
		Controller controller = service.getControllerPort();
		
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
		
		Long providerId = (Long) session.getAttribute("userId");
		DtProvider provider = new DtProvider();
		provider.setId(providerId);
		
		Long departmentId = Long.parseLong(request.getParameter("department"));
		DtDepartment department = new DtDepartment();
		department.setId(departmentId);
		
		String[] arrayCategories = request.getParameterValues("categories");
		ArrayList<DtCategory> categoriesList = new ArrayList<DtCategory>();
		
		for(int c = 0; c < arrayCategories.length; c++) {
			Long categoryId = Long.parseLong(arrayCategories[c]);
			DtCategory category = new DtCategory();
			category.setId(categoryId);
			categoriesList.add(category);
		}
		
		
		try {
			
			ControllerService service = new ControllerService();
			Controller controller = service.getControllerPort();
			
			DtTouristicActivity activityData = new DtTouristicActivity();
			activityData.setName(name);
			activityData.setDescription(description);
			activityData.setDuration(duration);
			activityData.setCostPerTourist(cost);
			activityData.setCity(city);
			activityData.setImage(image);
			activityData.setState(state);
			activityData.setUploadDate(uploadDate);
			activityData.setProvider(provider);
			activityData.setDepartment(department);
			activityData.setCategories(categoriesList);
					
			controller.registeTouristicActivity(activityData);
			
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
