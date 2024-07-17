package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySqlConectar {
   public Connection getConnection() {
       Connection cn = null;
       try {
           String url, user, pass;
           // Driver
           Class.forName("com.mysql.cj.jdbc.Driver");
           url = "jdbc:mysql://localhost:3306/videoteca?serverTimezone=UTC";
           user = "root";
           pass = "199411";
           cn = DriverManager.getConnection(url, user, pass);
       } catch (Exception e) {
           e.printStackTrace();
       }
       return cn;
   }
}

