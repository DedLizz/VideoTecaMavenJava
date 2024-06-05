package interfaces;

import java.util.List;

import entidad.BoletaEntregaUser;


public interface boletaEntregaDAO {
	List<BoletaEntregaUser> findAllBoletaEntrega(int user);
}
