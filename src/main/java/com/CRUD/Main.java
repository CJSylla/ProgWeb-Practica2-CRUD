package com.CRUD;

import freemarker.template.Configuration;
import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static spark.Spark.*;

public class Main {

    static final List<Estudiante> listaEstudiante = new ArrayList<>();
    //static final Map<String, Object> atributos = new HashMap<>();

    public static void main(String[] args) {
        listaEstudiante.add(new Estudiante(20132011,"Claude Junior","Sylla","8294564094"));
        listaEstudiante.add(new Estudiante(20131910,"Rood Gerard","Wally","8093763035"));

        //Seteando el puerto en Heroku
        port(getHerokuAssignedPort());

        //indicando los recursos publicos.
        staticFiles.location("/Publico");


        //Indicando la carpeta por defecto que estaremos usando.
        Configuration configuration = new Configuration(Configuration.VERSION_2_3_23);
        configuration.setClassForTemplateLoading(Main.class, "/Templates");
        FreeMarkerEngine freeMarkerEngine = new FreeMarkerEngine(configuration);

        get("/", (request, response) ->
        { return new ModelAndView(null, "index.ftl");
        }, freeMarkerEngine);

        get("/formulario", (request, response) -> {
            return new ModelAndView(null, "formulario.ftl");
        }, freeMarkerEngine);

        post("/formulario", (request, response) -> {
            listaEstudiante.add(new Estudiante(Integer.parseInt(request.queryParams("matricula")),request.queryParams("nombre"),request.queryParams("apellido"),request.queryParams("telefono")));
            response.redirect("/listarEstudiantes");
            return "";
        });

        get("/listarEstudiantes", (request, response) -> {

            Map<String, Object> attributes = new HashMap<>();

            attributes.put("titulo", "Lista de estudiantes");
            attributes.put("estudiantes",listaEstudiante);
            return new ModelAndView(attributes, "listarEstudiantes.ftl");
        }, freeMarkerEngine);

        get("/borrar/:matricula" , (request, response) -> {
            Estudiante estudiante = null;

            for(Estudiante es: listaEstudiante){

                if(es.getMatricula()==Integer.parseInt(request.params("matricula"))){
                    System.out.println("Son iguales");
                    estudiante = es;

                    System.out.println(listaEstudiante.size());
                }
            }

            listaEstudiante.remove(estudiante);
            response.redirect("/listarEstudiantes",301);
            return "";
        });

        get("/editar/:matricula", (request, response) -> {
            Map<String, Object> atributos = new HashMap<>();
            for(Estudiante es: listaEstudiante){

                if(es.getMatricula()==Integer.parseInt(request.params("matricula"))){

                    System.out.println(Integer.parseInt(request.params("matricula")));
                    atributos.put("metodo", "editar");
                    atributos.put("titulo", "Editar estudiante.");
                    atributos.put("header", "Editar estudiante registrado.");
                    atributos.put("submit", "Actualizar");
                    atributos.put("matricula", es.getMatricula());
                    atributos.put("nombre", es.getNombre());
                    atributos.put("apellido", es.getApellido());
                    atributos.put("telefono", es.getTelefono());
                    System.out.println(es.getMatricula());
                }
            }

            return new ModelAndView(atributos, "actualizar.ftl");
        }, freeMarkerEngine);

        post("/completarActualizacion", (request, response) -> {
            System.out.println("There");
            for(Estudiante es: listaEstudiante){

                if(es.getMatricula()==Integer.parseInt(request.queryParams("matricula"))){
                    System.out.println("there");
                    es.setMatricula(Integer.parseInt(request.queryParams("matricula")));
                    es.setNombre(request.queryParams("nombre"));
                    es.setApellido(request.queryParams("apellido"));
                    es.setTelefono(request.queryParams("telefono"));
                    System.out.println("there2");
                }
            }


            response.redirect("/listarEstudiantes");

            return "";
            //return new ModelAndView(atributos, "formulario.ftl");
        });

    }

    /**
     * Metodo para setear el puerto en Heroku
     * @return
     */
    private static int getHerokuAssignedPort() {
        ProcessBuilder processBuilder = new ProcessBuilder();
        if (processBuilder.environment().get("PORT") != null) {
            return Integer.parseInt(processBuilder.environment().get("PORT"));
        }
        return 4567; //return default port if heroku-port isn't set (i.e. on localhost)
    }
}




