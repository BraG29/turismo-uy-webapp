
package uy.turismo.webapp.ws.controller;

import java.util.ArrayList;
import java.util.List;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para dtTouristWS complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="dtTouristWS"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{controller}dtUserWS"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="bundles" type="{controller}dtTouristicBundleWS" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="departures" type="{controller}dtTouristicDepartureWS" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="favActivities" type="{controller}dtTouristicActivityWS" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="inscriptions" type="{controller}dtInscriptionWS" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="nationality" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="purchases" type="{controller}dtPurchaseWS" maxOccurs="unbounded" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "dtTouristWS", propOrder = {
    "bundles",
    "departures",
    "favActivities",
    "inscriptions",
    "nationality",
    "purchases"
})
public class DtTouristWS
    extends DtUserWS
{

    protected List<DtTouristicBundleWS> bundles;
    protected List<DtTouristicDepartureWS> departures;
    protected List<DtTouristicActivityWS> favActivities;
    protected List<DtInscriptionWS> inscriptions;
    protected String nationality;
    protected List<DtPurchaseWS> purchases;

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
     * Gets the value of the favActivities property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the favActivities property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getFavActivities().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DtTouristicActivityWS }
     * 
     * 
     */
    public List<DtTouristicActivityWS> getFavActivities() {
        if (favActivities == null) {
            favActivities = new ArrayList<DtTouristicActivityWS>();
        }
        return this.favActivities;
    }

    /**
     * Gets the value of the inscriptions property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the inscriptions property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getInscriptions().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DtInscriptionWS }
     * 
     * 
     */
    public List<DtInscriptionWS> getInscriptions() {
        if (inscriptions == null) {
            inscriptions = new ArrayList<DtInscriptionWS>();
        }
        return this.inscriptions;
    }

    /**
     * Obtiene el valor de la propiedad nationality.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNationality() {
        return nationality;
    }

    /**
     * Define el valor de la propiedad nationality.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNationality(String value) {
        this.nationality = value;
    }

    /**
     * Gets the value of the purchases property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the purchases property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getPurchases().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DtPurchaseWS }
     * 
     * 
     */
    public List<DtPurchaseWS> getPurchases() {
        if (purchases == null) {
            purchases = new ArrayList<DtPurchaseWS>();
        }
        return this.purchases;
    }

}
