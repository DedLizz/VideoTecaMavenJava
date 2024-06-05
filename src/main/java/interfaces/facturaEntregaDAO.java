package interfaces;

import java.util.List;

import entidad.FacturaEntregaUser;


public interface facturaEntregaDAO {
	List<FacturaEntregaUser> findAllFacturaEntrega(int user);
}
