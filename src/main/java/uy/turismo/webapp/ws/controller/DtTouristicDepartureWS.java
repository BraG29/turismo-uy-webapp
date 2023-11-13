
package uy.turismo.webapp.ws.controller;

import java.util.ArrayList;
import java.util.List;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para dtTouristicDepartureWS complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="dtTouristicDepartureWS"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{controller}dtBaseEntityWS"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="departureDateTime" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="image" type="{http://www.w3.org/2001/XMLSchema}base64Binary" minOccurs="0"/&gt;
 *         &lt;element name="maxTourist" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/&gt;
 *         &lt;element name="place" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="touristicActivity" type="{controller}dtTouristicActivityWS" minOccurs="0"/&gt;
 *         &lt;element name="tourists" type="{controller}dtTouristWS" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="uploadDate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="visitsAmount" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "dtTouristicDepartureWS", propOrder = {
    "departureDateTime",
    "image",
    "maxTourist",
    "place",
    "touristicActivity",
    "tourists",
    "uploadDate",
    "visitsAmount"
})
public class DtTouristicDepartureWS
    extends DtBaseEntityWS
{

    protected String departureDateTime;
    protected byte[] image;
    protected Integer maxTourist;
    protected String place;
    protected DtTouristicActivityWS touristicActivity;
    protected List<DtTouristWS> tourists;
    protected String uploadDate;
    protected Integer visitsAmount;

    /**
     * Obtiene el valor de la propiedad departureDateTime.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDepartureDateTime() {
        return departureDateTime;
    }

    /**
     * Define el valor de la propiedad departureDateTime.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDepartureDateTime(String value) {
        this.departureDateTime = value;
    }

    /**
     * Obtiene el valor de la propiedad image.
     * 
     * @return
     *     possible object is
     *     byte[]
     */
    public byte[] getImage() {
        return image;
    }

    /**
     * Define el valor de la propiedad image.
     * 
     * @param value
     *     allowed object is
     *     byte[]
     */
    public void setImage(byte[] value) {
        this.image = value;
    }

    /**
     * Obtiene el valor de la propiedad maxTourist.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getMaxTourist() {
        return maxTourist;
    }

    /**
     * Define el valor de la propiedad maxTourist.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setMaxTourist(Integer value) {
        this.maxTourist = value;
    }

    /**
     * Obtiene el valor de la propiedad place.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPlace() {
        return place;
    }

    /**
     * Define el valor de la propiedad place.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPlace(String value) {
        this.place = value;
    }

    /**
     * Obtiene el valor de la propiedad touristicActivity.
     * 
     * @return
     *     possible object is
     *     {@link DtTouristicActivityWS }
     *     
     */
    public DtTouristicActivityWS getTouristicActivity() {
        return touristicActivity;
    }

    /**
     * Define el valor de la propiedad touristicActivity.
     * 
     * @param value
     *     allowed object is
     *     {@link DtTouristicActivityWS }
     *     
     */
    public void setTouristicActivity(DtTouristicActivityWS value) {
        this.touristicActivity = value;
    }

    /**
     * Gets the value of the tourists property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the tourists property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getTourists().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DtTouristWS }
     * 
     * 
     */
    public List<DtTouristWS> getTourists() {
        if (tourists == null) {
            tourists = new ArrayList<DtTouristWS>();
        }
        return this.tourists;
    }

    /**
     * Obtiene el valor de la propiedad uploadDate.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUploadDate() {
        return uploadDate;
    }

    /**
     * Define el valor de la propiedad uploadDate.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUploadDate(String value) {
        this.uploadDate = value;
    }

    /**
     * Obtiene el valor de la propiedad visitsAmount.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getVisitsAmount() {
        return visitsAmount;
    }

    /**
     * Define el valor de la propiedad visitsAmount.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setVisitsAmount(Integer value) {
        this.visitsAmount = value;
    }

}
