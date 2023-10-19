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
import javax.servlet.http.Part;

import uy.turismo.servidorcentral.logic.controller.Controller;
import uy.turismo.servidorcentral.logic.controller.ControllerFactory;
import uy.turismo.servidorcentral.logic.controller.IController;
import uy.turismo.servidorcentral.logic.datatypes.DtCategory;
import uy.turismo.servidorcentral.logic.datatypes.DtDepartment;
import uy.turismo.servidorcentral.logic.datatypes.DtProvider;
import uy.turismo.servidorcentral.logic.datatypes.DtTouristicActivity;
import uy.turismos.servidorcentral.logic.enums.ActivityState;

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
		List<DtProvider> providers = controller.getListProvider();
		List<DtCategory> categories = controller.getListCategory();
		
		request.setAttribute("providers",providers);
		request.setAttribute("categories", categories);
		request.getRequestDispatcher("pages/activities/registerActivity.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Long id = null;
		String name = request.getParameter("activityName");
		String description = request.getParameter("description");
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
		
		DtProvider provider = new DtProvider(Long.parseLong((String) request.getParameter("provider")), "", "", null);
		DtDepartment department = new DtDepartment(Long.parseLong(request.getParameter("department")));
		
		String[] arrayCategories = request.getParameterValues("categories");
		List<DtCategory> categoriesList = new ArrayList<DtCategory>();
		
		for(int c = 0; c < arrayCategories.length; c++) {
			DtCategory category = new DtCategory(Long.parseLong(arrayCategories[c]));
			categoriesList.add(category);
			System.out.println(category.getId());
		}
		
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
		
	}

}
