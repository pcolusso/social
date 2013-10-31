/**
 * BlogServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package socialapp.soap.client;

public class BlogServiceLocator extends org.apache.axis.client.Service implements socialapp.soap.client.BlogService {

    public BlogServiceLocator() {
    }


    public BlogServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public BlogServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for BlogPort
    private java.lang.String BlogPort_address = "http://localhost:8080/social/soap/blog";

    public java.lang.String getBlogPortAddress() {
        return BlogPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String BlogPortWSDDServiceName = "BlogPort";

    public java.lang.String getBlogPortWSDDServiceName() {
        return BlogPortWSDDServiceName;
    }

    public void setBlogPortWSDDServiceName(java.lang.String name) {
        BlogPortWSDDServiceName = name;
    }

    public socialapp.soap.client.Blog getBlogPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(BlogPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getBlogPort(endpoint);
    }

    public socialapp.soap.client.Blog getBlogPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            socialapp.soap.client.BlogPortBindingStub _stub = new socialapp.soap.client.BlogPortBindingStub(portAddress, this);
            _stub.setPortName(getBlogPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setBlogPortEndpointAddress(java.lang.String address) {
        BlogPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (socialapp.soap.client.Blog.class.isAssignableFrom(serviceEndpointInterface)) {
                socialapp.soap.client.BlogPortBindingStub _stub = new socialapp.soap.client.BlogPortBindingStub(new java.net.URL(BlogPort_address), this);
                _stub.setPortName(getBlogPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("BlogPort".equals(inputPortName)) {
            return getBlogPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://soap.socialapp/", "BlogService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://soap.socialapp/", "BlogPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("BlogPort".equals(portName)) {
            setBlogPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
