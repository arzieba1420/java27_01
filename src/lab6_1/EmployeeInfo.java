package lab6_1;
import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import com.microsoft.sqlserver.jdbc.SQLServerException;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeInfo {
    public static void main(String[] args) {

        SQLServerDataSource ds = new SQLServerDataSource();
        ds.setUser(null);
        ds.setDatabaseName("AdventureWorks");
        ds.setServerName("morfeusz.wszib.edu.pl");
        ds.setPassword(null);
        ds.setPortNumber(1433);


        List<String> topTen = new ArrayList<>();
        List<String> titles = new ArrayList<>();
        List<String> numberOfSales = new ArrayList<>();

        ResultSet rs;

        try(Connection con = ds.getConnection(); Statement stm = con.createStatement()){

                rs = stm.executeQuery("select top 10 * from Person.Contact where LastName='Anderson'");
                while (rs.next()){
                    topTen.add(rs.getString("ContactID") + " "+rs.getString("FirstName")+ " "+rs.getString("LastName"));
                }

                rs = stm.executeQuery(" select distinct Title from HumanResources.Employee");
                while (rs.next()){
                    titles.add(rs.getString("Title"));
                }

                rs = stm.executeQuery("select CustomerID, count(*) as Cnt from sales.SalesOrderHeader group by CustomerID order by Cnt desc");
                while (rs.next()){
                    numberOfSales.add(rs.getString("CustomerID") + " "+ rs.getString("Cnt"));
                }



        } catch(SQLException sqlEx){
            System.out.println("Wystąpił błąd: " + sqlEx.getMessage());
        }


        for (int i = 0; i <topTen.size() ; i++) {
            System.out.println(topTen.get(i));
        }
        System.out.println("-----------------------");
        for (int i = 0; i <titles.size() ; i++) {
            System.out.println(titles.get(i));
        }
        System.out.println("-----------------------------");
        for (int i = 0; i <numberOfSales.size() ; i++) {
            System.out.println(numberOfSales.get(i));
        }

    }
}