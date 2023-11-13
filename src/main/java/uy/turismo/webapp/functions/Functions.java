package uy.turismo.webapp.functions;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Properties;

import javax.imageio.ImageIO;

public class Functions {

	/**
	 * Guarda la imagen del usuario si aun no existe y devuelve la ruta de la misma
	 * @param image Imagen a guardar
	 * @param imageName Nombre de la imagen sin extension
	 * @param inputStram Stream del archivo .properties
	 * @para dir Directorio especifico de la entidad que es guarda la imagen ej: "user/" o "activity/"
	 * @return Ruta de la imagen
	 */
	public static String saveImage(BufferedImage image, String imageName, InputStream inputStream, String dir) {
		String imageFullName = imageName + ".png";
		Properties properties = new Properties();
		String imagePath = null;
		
		try {
			if(image == null) {
				throw new Exception("Imagen del Servidor Central viene null");
			}
			properties.load(inputStream);
				
			
			imagePath = properties.getProperty("imagesDirPath").concat(dir);
			File saveFile = new File(imagePath + imageFullName);
			if(saveFile.exists()) {
				saveFile.delete();
			}
			ImageIO.write(image, "png", saveFile);
			
		} catch (Exception e) {
			properties.clear();
			System.err.println("Error al guardar la imagen en webapp/functions" + ":" + e.getMessage());
		}
		
		properties.clear();
		return "assets/images/" + dir + imageFullName;
	}
	
	public static BufferedImage convertArrayToBI(byte[] imgArray) {
		BufferedImage image = null;
		try{
			if( imgArray == null) {
				throw new NullPointerException("No hay imagen");
			}
           	InputStream inptuStream = new ByteArrayInputStream(imgArray);
           	image = ImageIO.read(inptuStream);

		}catch(Exception e){
			e.printStackTrace();	
		}

		return image;
	}
	public static String convertDateToString(LocalDate d) {
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		return d.format(format);
	}

	public static String convertDateTimeToString(LocalDateTime dt) {
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

		return dt.format(format);

	}
	
}
	

