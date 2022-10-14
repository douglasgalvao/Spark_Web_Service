package service;

import db_connection.DbConnection;
import modal.Acidente;
import org.eclipse.jetty.util.ajax.JSON;
import org.eclipse.jetty.util.ajax.JSONObjectConvertor;
import spark.Request;
import spark.Response;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;

public class AcidenteService {
    DbConnection connection = new DbConnection();

    Acidente acidente;
    Acidente[] acidentes;

    public String get(Request request, Response response) throws Exception {
        connection.getConnection();
        Statement st = connection.getconnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = st.executeQuery("select * from acidente;");
        rs.last();
        this.acidentes = new Acidente[rs.getRow()];
        JSONObject meuJson = new JSONObject();
        rs.beforeFirst();
        for (int i = 0; rs.next(); i++) {
            acidentes[i] = new Acidente(rs.getInt("codigo"), rs.getString("nome"), rs.getString("descricao"));
            meuJson.put("Acidente" + i, acidentes[i].toString());
        }
        st.close();
        response.status(200);
        response.body(meuJson.toString());
        return response.body();
    }


    public String getById(Request request, Response response) throws Exception {
        connection.getConnection();
        Statement st = connection.getconnection().createStatement();
        ResultSet rs = st.executeQuery("select * from acidente as A where A.codigo=" + request.params("codigo") + ";");
        rs.next();
        JSONObject meuJson = new JSONObject();
        meuJson.put("Acidente", new Acidente(rs.getInt("codigo"), rs.getString("nome"), rs.getString("descricao")).toString());
        response.status(200);
        response.body(meuJson.toString());
        return response.body();
    }


    public String save(Request request, Response response) throws Exception {
        connection.getConnection();
        Statement st = connection.getconnection().createStatement();
        int rs = st.executeUpdate("insert into acidente (codigo,nome,descricao) values ('" + request.params("codigo") + "','" + request.params("nome") + "','" + request.params("descricao") + "')");
        if (rs != 0) {
            response.status(200);
            response.body("Item has been inserted");
        }
        return response.body();
    }


}
