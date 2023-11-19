
package uy.turismo.webapp.ws.controller;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para dtInscriptionWS complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="dtInscriptionWS"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{controller}dtBaseEntityWS"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="inscriptionDate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="totalCost" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/&gt;
 *         &lt;element name="touristAmount" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/&gt;
 *         &lt;element name="tourist" type="{controller}dtTouristWS" minOccurs="0"/&gt;
 *         &lt;element name="departure" type="{controller}dtTouristicDepartureWS" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "dtInscriptionWS", propOrder = {
    "inscriptionDate",
    "totalCost",
    "touristAmount",
    "tourist",
    "departure"
})
public class DtInscriptionWS
    extends DtBaseEntityWS
{

    protected String inscriptionDate;
    protected Double totalCost;
    protected Integer touristAmount;
    protected DtTouristWS tourist;
    protected DtTouristicDepartureWS departure;

    /**
     * Obtiene el valor de la propiedad inscriptionDate.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getInscriptionDate() {
        return inscriptionDate;
    }

    /**
     * Define el valor de la propiedad inscriptionDate.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setInscriptionDate(String value) {
        this.inscriptionDate = value;
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
     * Obtiene el valor de la propiedad departure.
     * 
     * @return
     *     possible object is
     *     {@link DtTouristicDepartureWS }
     *     
     */
    public DtTouristicDepartureWS getDeparture() {
        return departure;
    }

    /**
     * Define el valor de la propiedad departure.
     * 
     * @param value
     *     allowed object is
     *     {@link DtTouristicDepartureWS }
     *     
     */
    public void setDeparture(DtTouristicDepartureWS value) {
        this.departure = value;
    }

}
