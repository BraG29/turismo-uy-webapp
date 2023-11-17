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

import uy.turismo.webapp.functions.Functions;
import uy.turismo.webapp.ws.controller.ActivityState;
import uy.turismo.webapp.ws.controller.DtCategoryWS;
import uy.turismo.webapp.ws.controller.DtDepartmentWS;
import uy.turismo.webapp.ws.controller.DtProviderWS;
import uy.turismo.webapp.ws.controller.DtTouristicActivityWS;
import uy.turismo.webapp.ws.controller.Publisher;
import uy.turismo.webapp.ws.controller.PublisherService;

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
		
		PublisherService service = new PublisherService();
		Publisher controller = service.getPublisherPort();
		
		List<DtCategoryWS> categories = controller.getListCategory().getItem();
		
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
		BufferedImage imageRequest = ImageIO.read(fileContent);
		
		ActivityState state = ActivityState.ADDED;
		
		//Descomentar si se necesita que la actividad se seleccione a mano
		//String dateString = request.getParameter("uploadDate");
		
		//DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		//LocalDate uploadDate = LocalDate.parse(LocalDate.now().toString(), formatter);
		
		DtProviderWS provider = new DtProviderWS();
		//dentro de DtProviderWS:  (Long) session.getAttribute("userId"), "", "", null

		Long providerId = (Long) session.getAttribute("userId");
		
		provider.setId(providerId);
		
		
		DtDepartmentWS department = new DtDepartmentWS();
		//Dentro de DtDepartmentWs: Long.parseLong(request.getParameter("department"))
		
		Long departmentId = Long.parseLong(request.getParameter("department"));
		department.setId(departmentId);
		
		String[] arrayCategories = request.getParameterValues("categories");
		
		List<DtCategoryWS> categoriesList = new ArrayList<DtCategoryWS>();
		
		for(int c = 0; c < arrayCategories.length; c++) {
			DtCategoryWS category = new DtCategoryWS();
			//este set solia estár en el constructor de arriba.
			category.setId(Long.parseLong(arrayCategories[c]));
			categoriesList.add(category);
		}
		
		byte[] image = Functions.convertImageToArray(imageRequest);
		try {
			PublisherService service = new PublisherService();
			Publisher controller = service.getPublisherPort();
			
			DtTouristicActivityWS DTA = new DtTouristicActivityWS();
			/*id,
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
			categoriesList
			 * */
			DTA.setId(id);
			DTA.setName(name);
			DTA.setDescription(description);
			DTA.setDuration(duration);
			DTA.setCostPerTourist(cost);
			DTA.setCity(city);
			DTA.setImage(image);
			DTA.setUrlVideo(urlVideo);
			DTA.setState(state);
			DTA.setUploadDate(LocalDate.now().toString());
			DTA.setProvider(provider);
			DTA.setCategories(categoriesList);
			DTA.setDepartment(department);
			DTA.setVisitsAmount(0);
			//DTA.set
				
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
