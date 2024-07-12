package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import com.google.gson.Gson;

import dao.MySqlFacturaEntregaDAO;
import entidad.FacturaEntregaUser;

@WebServlet("/ServletFacturaEntregaJSON")
public class ServletFacturaEntregaJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ServletFacturaEntregaJSON() {
        super();
    }


    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String tipo = request.getParameter("accion");

        if (tipo.equals("fac"))
                facturaUser(request, response);
    }
	
    private void facturaUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        String idUsuario = request.getParameter("idUsuarioPag");

        int idUser = Integer.parseInt(idUsuario);

        System.out.print("ESTE ES EL ID PRA JSON FACTURA"+idUsuario);

        List<FacturaEntregaUser> facturaUser = new MySqlFacturaEntregaDAO().findAllFacturaEntrega(idUser);

        // Imprimir los datos de cada factura recibida
        for (FacturaEntregaUser factura : facturaUser) {
            System.out.println("Fecha: " + factura.getFechaFacturaE());
            System.out.println("Razon social Empresa: " + factura.getEmpresaFacturaE());
            System.out.println("Razon social Cliente: " + factura.getClienteFacturaE());
            System.out.println("Direccion: " + factura.getDireccionFacturaE());
            System.out.println("Monto: " + factura.getMontoFacturaE());
            System.out.println("IGV: " + factura.getIgvFacturaE());
            System.out.println("Nombre: " + factura.getUserFactruaE());
            System.out.println("Apellido: " + factura.getApellidoFacturaE());
            System.out.println("Correo Electronico: " + factura.getEmailFacturaE());
            System.out.println("Paquete: " + factura.getTipoCuentaFacturaE());
            System.out.println("Total: " + factura.getCostoFacturaE());
        }


        //crear objeto de la clase Gson
       Gson gson = new Gson();
       //convertir a JSON(STRING) el arreglo favorito
       String json = gson.toJson(facturaUser);
       //preparar salida en formato JSON
       response.setContentType("application/json;charset=UTF-8");
       //
       PrintWriter pw=response.getWriter();
       pw.print(json); 
    }
	
	

}
