package interfaces;

import java.util.List;

import entidad.Video;
import entidad.VideoInfo;

public interface videoDAO {
	
    int save(Video bean);
    int update(Video bean);
    int deleteById(int id);
    Video findById(int cod);
    List<Video> findVideosByCategoria(int idCategoria);
    List<Video> findAllVideo();
    boolean videoExistente(int idVideo);
    List<VideoInfo> findAllVideosWithCategory();


}
