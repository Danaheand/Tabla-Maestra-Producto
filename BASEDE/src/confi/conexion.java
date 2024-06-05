
package confi;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {
    Connection con;
    String ur = "jdbc:mysql://localhost/comercial?useSSL=false&serverTimezone=UTC";
    String uss="root";
    String pas="Jugandotodoeltiempo25";
    public Connection Conexion(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(ur,uss,pas);
            System.out.println("Conexión exitosa");
           // con.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al conectarse a la BD "+e);
        }
        return con;
    }
    public static void main(String[] args) {
        conexion db = new conexion();
        db.Conexion();
    } 
}
