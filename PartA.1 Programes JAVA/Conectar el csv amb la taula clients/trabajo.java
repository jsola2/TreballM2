import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.Arrays;
import java.util.Calendar;

public class trabajo {

    public static final String SEPARADOR = "\t";

    public static void main(String[] args) {
        BufferedReader bufferLectura = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://192.168.56.101:3306/db_hotels_trabajo?serverTimezone=UTC","perepi","pastanaga");

            // Abrir el .csv en buffer de lectura
            bufferLectura = new BufferedReader(new FileReader("csv/dades_clients-tab.csv"));

            Calendar calendar = Calendar.getInstance();
            /*Date startDate = new Date(calendar.getTime().getTime());*/
            java.sql.Date startDate = new java.sql.Date(calendar.getTime().getTime());

            // Leer una linea del archivo
            String linea = bufferLectura.readLine();
            linea = bufferLectura.readLine();


            while (linea != null) {
                // Sepapar la linea leída con el separador definido previamente
                String[] campos = linea.split(SEPARADOR);

                System.out.println(Arrays.toString(campos));
                String query = " INSERT INTO clients(client_id,nom,cognom1,sexe,data_naixement,pais_origen_id)"
                        + " values (?,?,?,?,?,?)";


                String[] data = campos[4].split("/");
                String cadena ="";
                for (int i = data.length-1; i >=0; i--) {
                    if (i==0){
                        cadena+=data[i];
                    }else{
                        cadena+=data[i]+"-";
                    }
                }


                // create the mysql insert preparedstatement
                PreparedStatement preparedStmt = con.prepareStatement(query);
                preparedStmt.setInt    (1, Integer.parseInt(campos[0]));
                preparedStmt.setString (2, campos[1]);
                preparedStmt.setString (3, campos[2]);
                preparedStmt.setString (4, campos[3]); // M F
                preparedStmt.setDate   (5, Date.valueOf(cadena));
                preparedStmt.setInt    (6, Integer.parseInt(campos[5]));

                preparedStmt.execute();
                // Volver a leer otra línea del fichero
                linea = bufferLectura.readLine();
            }
            con.close();
        } catch (
                IOException | ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Cierro el buffer de lectura
            if (bufferLectura != null) {
                try {
                    bufferLectura.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
