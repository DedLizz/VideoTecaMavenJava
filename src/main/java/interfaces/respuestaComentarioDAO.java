package interfaces;

import entidad.RespuestaComentarios;
import java.util.List;



public interface respuestaComentarioDAO {
    
    List<RespuestaComentarios> findRespuestasByComentarioId(int idComentario);
    int deleteRespuestaById(int idRespuesta);
    int save(RespuestaComentarios bean);
    int update(RespuestaComentarios bean);


}
