
package uy.turismo.webapp.ws.controller;

import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlElementDecl;
import jakarta.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the controller package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _DtBaseEntityWS_QNAME = new QName("controller", "dtBaseEntityWS");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: controller
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link DtProviderWS }
     * 
     */
    public DtProviderWS createDtProviderWS() {
        return new DtProviderWS();
    }

    /**
     * Create an instance of {@link DtTouristicActivityWS }
     * 
     */
    public DtTouristicActivityWS createDtTouristicActivityWS() {
        return new DtTouristicActivityWS();
    }

    /**
     * Create an instance of {@link DtTouristicBundleWS }
     * 
     */
    public DtTouristicBundleWS createDtTouristicBundleWS() {
        return new DtTouristicBundleWS();
    }

    /**
     * Create an instance of {@link DtCategoryWS }
     * 
     */
    public DtCategoryWS createDtCategoryWS() {
        return new DtCategoryWS();
    }

    /**
     * Create an instance of {@link DtDepartmentWS }
     * 
     */
    public DtDepartmentWS createDtDepartmentWS() {
        return new DtDepartmentWS();
    }

    /**
     * Create an instance of {@link DtTouristicDepartureWS }
     * 
     */
    public DtTouristicDepartureWS createDtTouristicDepartureWS() {
        return new DtTouristicDepartureWS();
    }

    /**
     * Create an instance of {@link DtTouristWS }
     * 
     */
    public DtTouristWS createDtTouristWS() {
        return new DtTouristWS();
    }

    /**
     * Create an instance of {@link DtInscriptionWS }
     * 
     */
    public DtInscriptionWS createDtInscriptionWS() {
        return new DtInscriptionWS();
    }

    /**
     * Create an instance of {@link DtPurchaseWS }
     * 
     */
    public DtPurchaseWS createDtPurchaseWS() {
        return new DtPurchaseWS();
    }

    /**
     * Create an instance of {@link DtCategoryWSArray }
     * 
     */
    public DtCategoryWSArray createDtCategoryWSArray() {
        return new DtCategoryWSArray();
    }

    /**
     * Create an instance of {@link DtTouristWSArray }
     * 
     */
    public DtTouristWSArray createDtTouristWSArray() {
        return new DtTouristWSArray();
    }

    /**
     * Create an instance of {@link DtTouristicDepartureWSArray }
     * 
     */
    public DtTouristicDepartureWSArray createDtTouristicDepartureWSArray() {
        return new DtTouristicDepartureWSArray();
    }

    /**
     * Create an instance of {@link DtPurchaseWSArray }
     * 
     */
    public DtPurchaseWSArray createDtPurchaseWSArray() {
        return new DtPurchaseWSArray();
    }

    /**
     * Create an instance of {@link DtUserWSArray }
     * 
     */
    public DtUserWSArray createDtUserWSArray() {
        return new DtUserWSArray();
    }

    /**
     * Create an instance of {@link DtDepartmentWSArray }
     * 
     */
    public DtDepartmentWSArray createDtDepartmentWSArray() {
        return new DtDepartmentWSArray();
    }

    /**
     * Create an instance of {@link DtBaseEntityWSArray }
     * 
     */
    public DtBaseEntityWSArray createDtBaseEntityWSArray() {
        return new DtBaseEntityWSArray();
    }

    /**
     * Create an instance of {@link DtProviderWSArray }
     * 
     */
    public DtProviderWSArray createDtProviderWSArray() {
        return new DtProviderWSArray();
    }

    /**
     * Create an instance of {@link DtTouristicActivityWSArray }
     * 
     */
    public DtTouristicActivityWSArray createDtTouristicActivityWSArray() {
        return new DtTouristicActivityWSArray();
    }

    /**
     * Create an instance of {@link DtTouristicBundleWSArray }
     * 
     */
    public DtTouristicBundleWSArray createDtTouristicBundleWSArray() {
        return new DtTouristicBundleWSArray();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DtBaseEntityWS }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link DtBaseEntityWS }{@code >}
     */
    @XmlElementDecl(namespace = "controller", name = "dtBaseEntityWS")
    public JAXBElement<DtBaseEntityWS> createDtBaseEntityWS(DtBaseEntityWS value) {
        return new JAXBElement<DtBaseEntityWS>(_DtBaseEntityWS_QNAME, DtBaseEntityWS.class, null, value);
    }

}
