package db_connection;

import java.sql.*;
public class DbConnection {
    public Connection connection;
    Boolean flagConnectionIsConnected = false;
    public void getConnection() throws Exception {
         this.connection = DriverManager.getConnection("jdbc:postgresql://db.biicxlhzbaskovsdnlxu.supabase.co:5432/postgres","postgres","0wTJ4kNfqxafPx8t");
        if(connection == null){
            throw new Exception("Url maybe broked");
        } else{
            System.out.println("Connection has been connected with success");
            flagConnectionIsConnected = true;
        }
    }

    public Connection getconnection(){
        return this.connection;
    }

    public void closeConnection() throws  SQLException{
        try{
            connection.close();
            if(connection == null){
                flagConnectionIsConnected = false;
            }
        }catch(Exception e){throw e;}
    }


    public void setConnection(Connection connection) {
        this.connection = connection;
    }
}
