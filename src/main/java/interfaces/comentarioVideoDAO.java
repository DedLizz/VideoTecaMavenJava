package interfaces;

import entidad.ComentarioVideo;
import java.util.List;



public interface comentarioVideoDAO {

    List<ComentarioVideo> findComentariosByVideoId(int idVideo);
    int update(ComentarioVideo bean);
    int save(ComentarioVideo bean);
    int deleteComentarioById(int idComentario);
    
    
}
