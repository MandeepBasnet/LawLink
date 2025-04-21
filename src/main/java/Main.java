import org.apache.catalina.Context;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.startup.Tomcat;
import org.apache.catalina.webresources.DirResourceSet;
import org.apache.catalina.webresources.StandardRoot;

import java.io.File;

public class Main {
    public static void main(String[] args) throws LifecycleException {
        // Create Tomcat instance
        Tomcat tomcat = new Tomcat();
        
        // Set port
        tomcat.setPort(8080);
        
        // Set base directory
        String baseDir = new File("target/tomcat").getAbsolutePath();
        tomcat.setBaseDir(baseDir);
        
        // Add webapp
        String webappDir = new File("src/main/webapp").getAbsolutePath();
        Context context = tomcat.addWebapp("", webappDir);
        
        // Add classes directory to classpath
        File classesDir = new File("target/classes");
        StandardRoot resources = new StandardRoot(context);
        resources.addPreResources(new DirResourceSet(resources, "/WEB-INF/classes", 
            classesDir.getAbsolutePath(), "/"));
        context.setResources(resources);
        
        // Start server
        tomcat.start();
        System.out.println("Tomcat server started on port 8080");
        tomcat.getServer().await();
    }
} 