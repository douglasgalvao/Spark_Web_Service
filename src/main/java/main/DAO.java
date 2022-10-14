package main;

import service.AcidenteService;

import java.util.Arrays;

import static spark.Spark.*;


public class DAO {
    public static void main(String[] args) throws Exception {
        AcidenteService acidenteService = new AcidenteService();

        get("/acidentes",(request,response)->{
            System.out.println(Arrays.toString(acidenteService.getALLAcidentes()));
            response.body(Arrays.toString(acidenteService.getALLAcidentes()));
            return null;
        });

    }
}