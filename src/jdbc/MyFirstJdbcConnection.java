package jdbc;

import java.sql.*;

public class MyFirstJdbcConnection {
    public static void main(String[] args) throws SQLException {
        String connectionUrl =
                "jdbc:sqlserver://morfeusz.wszib.edu.pl:1433;databaseName=AdventureWorks;user=arzieba;password=BitDef3500";

        Connection con = DriverManager.getConnection(connectionUrl);
        Statement stm = con.createStatement();

        ResultSet rs = stm.executeQuery("SELECT * FROM Person.Contact");

        while(rs.next()){
            System.out.println(rs.getString("FirstName")+" "+ rs.getString("LastName"));
        }

        rs.close();
        stm.close();
        con.close();

    }
}
