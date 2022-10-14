package main;

import service.AcidenteService;

import java.util.Arrays;

import static spark.Spark.*;


public class DAO {
    public static void main(String[] args) throws Exception {
        AcidenteService acidenteService = new AcidenteService();

        get("/acidentes", acidenteService::getALLAcidentes);
        get("/acidentes/:codigo", acidenteService::getAcidenteByCodigo);

    }
}