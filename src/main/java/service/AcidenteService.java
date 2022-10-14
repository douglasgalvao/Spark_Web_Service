package service;

import db_connection.DbConnection;
import modal.Acidente;
import spark.Request;
import spark.Response;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;

public class AcidenteService {
    DbConnection connection = new DbConnection();

    Acidente acidente;
    Acidente[] acidentes;

    public String getALLAcidentes(Request request, Response response) throws Exception {
        connection.getConnection();
        Statement st = connection.getconnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = st.executeQuery("select * from acidente;");
        rs.last();
        this.acidentes = new Acidente[rs.getRow()];
        rs.beforeFirst();
        for (int i = 0; rs.next(); i++) {
            acidentes[i] = new Acidente(rs.getInt("codigo"), rs.getString("nome"), rs.getString("descricao"));
//            System.out.println(acidentes[i].toString());
        }
        st.close();
        response.status(200);
        response.body(Arrays.toString(acidentes));
        return response.body();
    }
}
