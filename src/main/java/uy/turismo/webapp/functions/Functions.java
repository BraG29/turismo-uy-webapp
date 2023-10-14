package uy.turismo.webapp.functions;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.util.Properties;

import javax.imageio.ImageIO;

public class Functions {

	/**
	 * Guarda la imagen del usuario si aun no existe y devuelve la ruta de la misma
	 * @param image Imagen a guardar
	 * @param imageName Nombre de la imagen sin extension
	 * @param inputStram Stream del archivo .properties
	 * @return Ruta de la imagen
	 */
	public static String saveImage(BufferedImage image, String imageName, InputStream inputStream) {
		String imageFullName = imageName + ".png";
		Properties properties = new Properties();
		String imagePath = null;
		
		try {
			properties.load(inputStream);
			imagePath = properties.getProperty("imagesDirPath").concat("user/");
			File saveFile = new File(imagePath + imageFullName);
			if(!saveFile.exists()) {
				ImageIO.write(image, "png", saveFile);
			}
			
		} catch (Exception e) {
			System.err.println("Error al guardar la imagen: " + e.getMessage());
		}
		
		return "assets/images/user/" + imageFullName;
	}
	
}
