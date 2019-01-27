package HomeBudgetApp;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import com.microsoft.sqlserver.jdbc.SQLServerException;

import java.math.BigDecimal;
import java.sql.*;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;


public class HomeBudget {

// final variables -----------------------------------------------------------------------------------------------------

    //used to connection with DB server
    private static final String DB_HOST = "morfeusz.wszib.edu.pl";
    private static final int DB_PORT = 1433;
    private static final String DB_USER = "arzieba";
    private static final String DB_PASS = "BitDef3500";
    private static final String DB_NAME = "arzieba";
    // used queries and prepared statements
    private static final String INSERT_ENTRY_SQL = "insert into Budget.BudgetEntries(EntryName, Amount) values (?,?)";
    private static final String GET_BALANCE_SQL = "select sum(Amount) as Balance from Budget.BudgetEntries";

    //  main() method-------------------------------------------------------------------------------------------------------
    public static void main(String[] args) {

        HomeBudget hb = new HomeBudget();
        BudgetEntry be = new BudgetEntry();

        //TODO - validation of provided data required (ex. data types)

        if (!(args[0] == null || args[1] == null)) {
            //connection with database and executing queries
            try (Connection con = hb.connect(DB_USER, DB_PASS, DB_NAME); Statement stmt = con.createStatement()) {

                //replacing ? symbol in PreparedStatement
                be.setEntryName(args[0]);
                be.setAmount(new BigDecimal (args[1]));
                PreparedStatement ps = con.prepareStatement(INSERT_ENTRY_SQL);

                ps.setString(1, be.getEntryName());
                ps.setBigDecimal(2, be.getAmount());
                ps.execute(); //!!!!!!!!!!

                //getting balance value as a sum in Amount column
                BigDecimal balance;
                ResultSet rs = stmt.executeQuery(GET_BALANCE_SQL);
                if (rs.next()) {
                    balance = rs.getBigDecimal("Balance");
                } else balance = new BigDecimal(0);


                //App messages when OK
                System.out.print("Zapisano!: nazwa: " + be.getEntryName());
                System.out.print(", kwota: " + hb.currencyFormat(be.getAmount()));
                System.out.print(", saldo: " + hb.currencyFormat(balance));


            } catch (SQLException sqlEx) {
                System.out.println("Wystąpił błąd bazy danych1: " + sqlEx.getMessage());
            }

        } else {
            List<String> lastRows = new ArrayList<>();
            try (Connection con = hb.connect(DB_USER, DB_PASS, DB_NAME); Statement stmt = con.createStatement()) {

                ResultSet resultSet = stmt.executeQuery("select top 10 * from Budget.BudgetEntries order by ID desc");
                while (resultSet.next()) {
                    lastRows.add(resultSet.getString("ID") + " " + resultSet.getString("EntryDate")
                            + " " + resultSet.getString("EntryName") + " " + resultSet.getString("Amount"));
                }

                for (int i = 0; i < lastRows.size(); i++) {
                    System.out.println(lastRows.get(i));
                }

            } catch (SQLException sqlEx) {
                System.out.println("Wystąpił błąd bazy danych2: " + sqlEx.getMessage());
            }
    }
    }


//  connect() method returns Connection object required to connect with database server --------------------------------
    public Connection connect(String userName, String password, String dbName) throws SQLServerException {

        SQLServerDataSource ds = new SQLServerDataSource();
        ds.setPassword(password);
        ds.setServerName(DB_HOST);
        ds.setPortNumber(DB_PORT);
        ds.setUser(userName);
        ds.setDatabaseName(dbName);
        return ds.getConnection();
    }

//  currencyFormat() formats displayed currency value with NumberFormat class-------------------------------------------
    public String currencyFormat(BigDecimal bd){
        return NumberFormat.getCurrencyInstance().format(bd);
    }


}
