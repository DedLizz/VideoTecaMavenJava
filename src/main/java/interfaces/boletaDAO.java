package interfaces;

import java.util.List;

import entidad.Boleta;

public interface boletaDAO {

	int save(Boleta bean);
	List<Boleta> findAllBoleta();
}
