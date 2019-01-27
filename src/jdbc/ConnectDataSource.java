package jdbc;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectDataSource {
    public static void main(String[] args) {
        SQLServerDataSource ds = new SQLServerDataSource();
        ds.setUser("arzieba");
        ds.setServerName("morfeusz.wszib.edu.pl");
        ds.setPortNumber(1433);
        ds.setDatabaseName("arzieba");
        ds.setPassword("BitDef3500");

        String sql = "SELECT * FROM Forum.Topics";

        try(Connection con = ds.getConnection(); Statement stm = con.createStatement()){

            ResultSet rs = stm.executeQuery(sql);


            String topicBody;
            int id;
            while(rs.next()){
                if ((topicBody = rs.getString("TopicBody")) != null){
                    id = rs.getInt("ID");
                    System.out.println(id + "-"+topicBody);
                }
            }

        } catch (SQLException sqlexc) {
            System.out.println("Problemy z bazą danych: "+ sqlexc.getMessage());
        }

    }
}
