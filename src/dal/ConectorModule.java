package dal;
//importa a classe de manipulação de sql
import java.sql.*;
/**
 *
 * @author PIERRE E ADRIELLE
 */
public class ConectorModule {
    
    //conexão com o mysql
    public static Connection conect(){
        
   
    //variáel de conexão
    java.sql.Connection conn = null;
    
    //driver de conexão
    String driver = "com.mysql.jdbc.Driver";
    
    //Nome do banco de dados
    String url = "jdbc:mysql://localhost:3306/mygames";
    
    //usuário e senha
    String user = "root";
    String passwd = "";
    
    //conexão com o mysql
    try {
    Class.forName(driver);
    conn = DriverManager.getConnection(url, user, passwd);
    return conn;
} catch (Exception e){
    return null;
}
    
}
}