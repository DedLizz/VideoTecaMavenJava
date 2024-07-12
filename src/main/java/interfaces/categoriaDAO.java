package interfaces;

import java.util.List;

import entidad.Categoria;
import entidad.CategoriaInfo;

public interface categoriaDAO {
	
	int save(Categoria bean);
        int update(Categoria bean);
        int deleteById(int id);
        Categoria findById(int id);
	List<Categoria> findAllCategoria();
	boolean categoriaExistente(String nombreCategoria);
        List<CategoriaInfo> findAllCategoriaInfo();
}
