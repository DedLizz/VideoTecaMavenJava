
package entidad;

import java.util.List;


public class ComentarioVideo {
    private int idComentario;
    private String textoComentario;
    private String fechaComentario;
    private int idUsuario;
    private int idVideo;
    //atributo agregado para los comentarios hijos
    private List<RespuestaComentarios> respuestas;

    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {
        this.idComentario = idComentario;
    }

    public String getTextoComentario() {
        return textoComentario;
    }

    public void setTextoComentario(String textoComentario) {
        this.textoComentario = textoComentario;
    }

    public String getFechaComentario() {
        return fechaComentario;
    }

    public void setFechaComentario(String fechaComentario) {
        this.fechaComentario = fechaComentario;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdVideo() {
        return idVideo;
    }

    public void setIdVideo(int idVideo) {
        this.idVideo = idVideo;
    }
    
    //get an set para concatenar los comentarios hijos 
    public List<RespuestaComentarios> getRespuestas() {
        return respuestas;
    }

    public void setRespuestas(List<RespuestaComentarios> respuestas) {
        this.respuestas = respuestas;
    }
    
    
}
