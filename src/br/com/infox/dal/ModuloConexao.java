package br.com.infox.dal;
import java.sql.*;
public class ModuloConexao {
    //Método responsável por estabelecer a conexão com o banco de dados
    public static Connection conector(){
        java.sql.Connection conexao = null;
        //A linha abaixo chama o Driver que esta na biblioteca
        String driver = "com.mysql.jdbc.Driver";
        //Armazenando informações referentes ao banco de dados
        String url = "jdbc:mysql://localhost:3306/dbinfox";
        String user = "root";
        String password = "";
        //Estabelecendo a conexão com o banco de dados
        try {
            //Se caso o xampp MySQL tiver ligado ele vai retornar com.mysql.jdbc.Driver C:\report\clientes.jasper C:\Program Files (x86)\Jaspersoft\iReport-5.6.0\ireport\modules\ext
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            return conexao;
            
        } catch (Exception e) {
            //Se caso o xampp MySQL tiver desligado ele vai retornar null
            //A linha abaixo representa uma mensagem de erro para o usuário final
        
            System.out.println(e);
            return null;
        }
    }
}
