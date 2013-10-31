/**
 * BlogService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package socialapp.soap.client;

public interface BlogService extends javax.xml.rpc.Service {
    public java.lang.String getBlogPortAddress();

    public socialapp.soap.client.Blog getBlogPort() throws javax.xml.rpc.ServiceException;

    public socialapp.soap.client.Blog getBlogPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
