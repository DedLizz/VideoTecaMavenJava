/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import com.google.gson.Gson;



import dao.MySqlComentarioVideoDAO;
import dao.MySqlRespuestaComentarioDAO;
import entidad.ComentarioVideo;
import entidad.RespuestaComentarios;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Brandon
 */
@WebServlet("/ServletComentarioVideo")
public class ServletComentarioVideo extends HttpServlet {
 
    public ServletComentarioVideo() {
        super();
    }

	
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String tipo = request.getParameter("accion");

        if(tipo.equals("lista"))
            listarComentarios(request, response);
        if(tipo.equals("comentar"))
            comentarVideo(request, response);
        if(tipo.equals("respuesta"))
            respuestaComentario(request, response);
        
    }

    protected void listarComentarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idVideo = Integer.valueOf(request.getParameter("idVideoPag"));
        
        System.out.println("este es el id " +idVideo);
        
        List<ComentarioVideo> listaComentarioVideo = new MySqlComentarioVideoDAO().findComentariosByVideoId(idVideo);
        
        if (listaComentarioVideo != null) {
            for (ComentarioVideo comentarioVideo : listaComentarioVideo) {
                int idComentarioPadre = comentarioVideo.getIdComentario();
                List<RespuestaComentarios> listaRespuestaComentarios = new MySqlRespuestaComentarioDAO().findRespuestasByComentarioId(idComentarioPadre);
                comentarioVideo.setRespuestas(listaRespuestaComentarios);  // Asegúrate de que ComentarioVideo tenga un método setRespuestas
            }
        }
        
        // Crear objeto de la clase Gson
        Gson gson = new Gson();
        // Convertir a JSON(STRING) el arreglo listaComentarioVideo que ahora incluye las respuestas
        String json = gson.toJson(listaComentarioVideo);
        // Preparar salida en formato JSON
        response.setContentType("application/json;charset=UTF-8");
        // Enviar respuesta
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
        
       
    }
    
    protected void comentarVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idVideo = Integer.parseInt(request.getParameter("idVideoPag"));
        int idUsuario = Integer.parseInt(request.getParameter("idUsuarioPag"));
        String fecha = request.getParameter("fechaPag");
        String comentario = request.getParameter("comentarioPag");

        ComentarioVideo bean = new ComentarioVideo();
        bean.setIdVideo(idVideo);
        bean.setIdUsuario(idUsuario);
        bean.setFechaComentario(fecha);
        bean.setTextoComentario(comentario);

        int estado = new MySqlComentarioVideoDAO().save(bean);

        response.setContentType("application/json;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        Gson gson = new Gson();

        Map<String, Object> result = new HashMap<>();
        if (estado == 1){
            result.put("status", "success");
            result.put("comentario", bean); // Devuelve el comentario guardado
            System.out.println("Video comentado exitosamente");
        } else {
            result.put("status", "failure");
            System.out.println("Video no comentado");
        }
        pw.print(gson.toJson(result));
        pw.flush();
    }

    
    protected void respuestaComentario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idComentPadre = Integer.parseInt(request.getParameter("idComentarioPadre"));
        int idUsuario = Integer.parseInt(request.getParameter("idUsuarioPag"));
        String fecha = request.getParameter("fechaPag");
        String textRespuesta = request.getParameter("respuestaPag");

        RespuestaComentarios resComentario = new RespuestaComentarios();
        resComentario.setIdComentario(idComentPadre);
        resComentario.setIdUsuario(idUsuario);
        resComentario.setFechaRespuesta(fecha);
        resComentario.setTextoRespuesta(textRespuesta);

        int estado = new MySqlRespuestaComentarioDAO().save(resComentario);

        response.setContentType("application/json;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        Gson gson = new Gson();

        Map<String, Object> result = new HashMap<>();
        if (estado == 1) {
            result.put("status", "success");
            result.put("respuesta", resComentario); // Devuelve la respuesta guardada
            System.out.println("LA RESPUESTA SE GUARDO EXITOSAMENTE");
        } else {
            result.put("status", "failure");
            System.out.println("LA RESPUESTA NO SE GUARDO");
        }
        pw.print(gson.toJson(result));
        pw.flush();
    }

    

    
    

    
}
