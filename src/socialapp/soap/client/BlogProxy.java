package socialapp.soap.client;

public class BlogProxy implements socialapp.soap.client.Blog {
  private String _endpoint = null;
  private socialapp.soap.client.Blog blog = null;
  
  public BlogProxy() {
    _initBlogProxy();
  }
  
  public BlogProxy(String endpoint) {
    _endpoint = endpoint;
    _initBlogProxy();
  }
  
  private void _initBlogProxy() {
    try {
      blog = (new socialapp.soap.client.BlogServiceLocator()).getBlogPort();
      if (blog != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)blog)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)blog)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (blog != null)
      ((javax.xml.rpc.Stub)blog)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public socialapp.soap.client.Blog getBlog() {
    if (blog == null)
      _initBlogProxy();
    return blog;
  }
  
  public socialapp.soap.client.User login(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException, socialapp.soap.client.JAXBException, socialapp.soap.client.IOException{
    if (blog == null)
      _initBlogProxy();
    return blog.login(arg0, arg1);
  }
  
  public java.lang.String getPassword(java.lang.String arg0) throws java.rmi.RemoteException, socialapp.soap.client.JAXBException, socialapp.soap.client.IOException{
    if (blog == null)
      _initBlogProxy();
    return blog.getPassword(arg0);
  }
  
  public java.lang.String hello() throws java.rmi.RemoteException{
    if (blog == null)
      _initBlogProxy();
    return blog.hello();
  }
  
  public socialapp.soap.client.User getUser(java.lang.String arg0) throws java.rmi.RemoteException, socialapp.soap.client.JAXBException, socialapp.soap.client.IOException{
    if (blog == null)
      _initBlogProxy();
    return blog.getUser(arg0);
  }
  
  public socialapp.soap.client.Article[] getBlogs(socialapp.soap.client.User arg0) throws java.rmi.RemoteException{
    if (blog == null)
      _initBlogProxy();
    return blog.getBlogs(arg0);
  }
  
  public void deleteArticle(socialapp.soap.client.User arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (blog == null)
      _initBlogProxy();
    blog.deleteArticle(arg0, arg1);
  }
  
  
}