package interfaces;



import java.util.List;

import entidad.Favorito;
import entidad.Video;

public interface favoritoDAO {
	
	int save(Favorito bean);
	List<Favorito> getFavoritosByIdUsuario(int idUsuario);
	boolean buscarFavorito(int idVideo, int idUsuario);
    int deleteByVideoAndUser(int idVideo, int idUsuario);
    List<Video> getVideosFavoritos(int idUsuario);
    List<Video> getVideosFavoritos2(int idUsuario, int idCategoria);
}
