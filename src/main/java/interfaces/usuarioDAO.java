package interfaces;

import java.util.List;
import entidad.Usuario;

public interface usuarioDAO {
	
    int save(Usuario bean);
    int update(Usuario bean);
    int deleteById(int id);
    Usuario findUsuarioById(int idUsuario);
    List<Usuario> findAllUsuario();
    boolean usuarioExistente(String email);
    int updateTipoCuenta(int idUsuario, int nuevoIdTipoCuenta);

}
