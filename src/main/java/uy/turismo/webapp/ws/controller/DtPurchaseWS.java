
package uy.turismo.webapp.ws.controller;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para dtPurchaseWS complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="dtPurchaseWS"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{controller}dtBaseEntityWS"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="bundle" type="{controller}dtTouristicBundleWS" minOccurs="0"/&gt;
 *         &lt;element name="expireDate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="purchaseDate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="totalCost" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/&gt;
 *         &lt;element name="tourist" type="{controller}dtTouristWS" minOccurs="0"/&gt;
 *         &lt;element name="touristAmount" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "dtPurchaseWS", propOrder = {
    "bundle",
    "expireDate",
    "purchaseDate",
    "totalCost",
    "tourist",
    "touristAmount"
})
public class DtPurchaseWS
    extends DtBaseEntityWS
{

    protected DtTouristicBundleWS bundle;
    protected String expireDate;
    protected String purchaseDate;
    protected Double totalCost;
    protected DtTouristWS tourist;
    protected Integer touristAmount;

    /**
     * Obtiene el valor de la propiedad bundle.
     * 
     * @return
     *     possible object is
     *     {@link DtTouristicBundleWS }
     *     
     */
    public DtTouristicBundleWS getBundle() {
        return bundle;
    }

    /**
     * Define el valor de la propiedad bundle.
     * 
     * @param value
     *     allowed object is
     *     {@link DtTouristicBundleWS }
     *     
     */
    public void setBundle(DtTouristicBundleWS value) {
        this.bundle = value;
    }

    /**
     * Obtiene el valor de la propiedad expireDate.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getExpireDate() {
        return expireDate;
    }

    /**
     * Define el valor de la propiedad expireDate.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setExpireDate(String value) {
        this.expireDate = value;
    }

    /**
     * Obtiene el valor de la propiedad purchaseDate.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPurchaseDate() {
        return purchaseDate;
    }

    /**
     * Define el valor de la propiedad purchaseDate.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPurchaseDate(String value) {
        this.purchaseDate = value;
    }

    /**
     * Obtiene el valor de la propiedad totalCost.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getTotalCost() {
        return totalCost;
    }

    /**
     * Define el valor de la propiedad totalCost.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setTotalCost(Double value) {
        this.totalCost = value;
    }

    /**
     * Obtiene el valor de la propiedad tourist.
     * 
     * @return
     *     possible object is
     *     {@link DtTouristWS }
     *     
     */
    public DtTouristWS getTourist() {
        return tourist;
    }

    /**
     * Define el valor de la propiedad tourist.
     * 
     * @param value
     *     allowed object is
     *     {@link DtTouristWS }
     *     
     */
    public void setTourist(DtTouristWS value) {
        this.tourist = value;
    }

    /**
     * Obtiene el valor de la propiedad touristAmount.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getTouristAmount() {
        return touristAmount;
    }

    /**
     * Define el valor de la propiedad touristAmount.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setTouristAmount(Integer value) {
        this.touristAmount = value;
    }

}
