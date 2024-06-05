package interfaces;

import java.util.List;

import entidad.Factura;


public interface facturaDAO {
	int save(Factura bean);
	List<Factura> findAllFactura();
	
	

}
