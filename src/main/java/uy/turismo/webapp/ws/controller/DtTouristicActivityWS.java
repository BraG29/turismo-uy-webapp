
package uy.turismo.webapp.ws.controller;

import java.util.ArrayList;
import java.util.List;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlSchemaType;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para dtTouristicActivityWS complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="dtTouristicActivityWS"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{controller}dtBaseEntityWS"&gt;
 *       &lt;sequence&gt;src/main/resources/
 *         &lt;element name="bundles" type="{controller}dtTouristicBundleWS" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="categories" type="{controller}dtCategoryWS" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="city" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="costPerTourist" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/&gt;
 *         &lt;element name="department" type="{controller}dtDepartmentWS" minOccurs="0"/&gt;
 *         &lt;element name="departures" type="{controller}dtTouristicDepartureWS" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="description" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="duration" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/&gt;
 *         &lt;element name="image" type="{http://www.w3.org/2001/XMLSchema}base64Binary" minOccurs="0"/&gt;
 *         &lt;element name="provider" type="{controller}dtProviderWS" minOccurs="0"/&gt;
 *         &lt;element name="state" type="{controller}activityState" minOccurs="0"/&gt;
 *         &lt;element name="uploadDate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="urlVideo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
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
@XmlType(name = "dtTouristicActivityWS", propOrder = {
    "bundles",
    "categories",
    "city",
    "costPerTourist",
    "department",
    "departures",
    "description",
    "duration",
    "image",
    "provider",
    "state",
    "uploadDate",
    "urlVideo",
    "visitsAmount"
})
public class DtTouristicActivityWS
    extends DtBaseEntityWS
{

    protected List<DtTouristicBundleWS> bundles;
    protected List<DtCategoryWS> categories;
    protected String city;
    protected Double costPerTourist;
    protected DtDepartmentWS department;
    protected List<DtTouristicDepartureWS> departures;
    protected String description;
    protected Double duration;
    protected byte[] image;
    protected DtProviderWS provider;
    @XmlSchemaType(name = "string")
    protected ActivityState state;
    protected String uploadDate;
    protected String urlVideo;
    protected Integer visitsAmount;

    /**
     * Gets the value of the bundles property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the bundles property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getBundles().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DtTouristicBundleWS }
     * 
     * 
     */
    public List<DtTouristicBundleWS> getBundles() {
        if (bundles == null) {
            bundles = new ArrayList<DtTouristicBundleWS>();
        }
        return this.bundles;
    }

    /**
     * Gets the value of the categories property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the categories property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getCategories().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DtCategoryWS }
     * 
     * 
     */
    public List<DtCategoryWS> getCategories() {
        if (categories == null) {
            categories = new ArrayList<DtCategoryWS>();
        }
        return this.categories;
    }

    /**
     * Obtiene el valor de la propiedad city.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCity() {
        return city;
    }

    /**
     * Define el valor de la propiedad city.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCity(String value) {
        this.city = value;
    }

    /**
     * Obtiene el valor de la propiedad costPerTourist.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getCostPerTourist() {
        return costPerTourist;
    }

    /**
     * Define el valor de la propiedad costPerTourist.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setCostPerTourist(Double value) {
        this.costPerTourist = value;
    }

    /**
     * Obtiene el valor de la propiedad department.
     * 
     * @return
     *     possible object is
     *     {@link DtDepartmentWS }
     *     
     */
    public DtDepartmentWS getDepartment() {
        return department;
    }

    /**
     * Define el valor de la propiedad department.
     * 
     * @param value
     *     allowed object is
     *     {@link DtDepartmentWS }
     *     
     */
    public void setDepartment(DtDepartmentWS value) {
        this.department = value;
    }

    /**
     * Gets the value of the departures property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the departures property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getDepartures().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DtTouristicDepartureWS }
     * 
     * 
     */
    public List<DtTouristicDepartureWS> getDepartures() {
        if (departures == null) {
            departures = new ArrayList<DtTouristicDepartureWS>();
        }
        return this.departures;
    }

    /**
     * Obtiene el valor de la propiedad description.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescription() {
        return description;
    }

    /**
     * Define el valor de la propiedad description.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescription(String value) {
        this.description = value;
    }

    /**
     * Obtiene el valor de la propiedad duration.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getDuration() {
        return duration;
    }

    /**
     * Define el valor de la propiedad duration.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setDuration(Double value) {
        this.duration = value;
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
     * Obtiene el valor de la propiedad provider.
     * 
     * @return
     *     possible object is
     *     {@link DtProviderWS }
     *     
     */
    public DtProviderWS getProvider() {
        return provider;
    }

    /**
     * Define el valor de la propiedad provider.
     * 
     * @param value
     *     allowed object is
     *     {@link DtProviderWS }
     *     
     */
    public void setProvider(DtProviderWS value) {
        this.provider = value;
    }

    /**
     * Obtiene el valor de la propiedad state.
     * 
     * @return
     *     possible object is
     *     {@link ActivityState }
     *     
     */
    public ActivityState getState() {
        return state;
    }

    /**
     * Define el valor de la propiedad state.
     * 
     * @param value
     *     allowed object is
     *     {@link ActivityState }
     *     
     */
    public void setState(ActivityState value) {
        this.state = value;
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
     * Obtiene el valor de la propiedad urlVideo.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUrlVideo() {
        return urlVideo;
    }

    /**
     * Define el valor de la propiedad urlVideo.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUrlVideo(String value) {
        this.urlVideo = value;
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
