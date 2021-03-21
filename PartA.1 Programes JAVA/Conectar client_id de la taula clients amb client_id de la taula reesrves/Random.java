import java.sql.*;

import static java.sql.DriverManager.getConnection;


    public class Random {
        public static void main(String[] args) {
            String jdbcURL = "jdbc:mysql://192.168.56.101:3306/db_hotels_trabajo?serverTimezone=UTC";
            String user = "perepi";
            String password = "pastanaga";
            int batchSize = 20;
            Connection connection = null;

            try {
                connection = DriverManager.getConnection(jdbcURL, user, password);
                connection.setAutoCommit(true);
                int max_reserves=26991;
                int min_idClient=10001;
                int max_idClient=27944;
                int res_id=1;
                while(res_id!=max_reserves){
                    int client_id = (int) Math.floor(Math.random()*(max_idClient-min_idClient+1)+min_idClient);
                    String sql= "UPDATE reserves SET client_id = ? WHERE reserva_id = ?";
                    PreparedStatement statement = connection.prepareStatement(sql);
                    statement.setInt(1,client_id );
                    statement.setInt(2,res_id);
                    statement.execute();
                    res_id++;
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }