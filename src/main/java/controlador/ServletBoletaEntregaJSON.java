package controlador;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;





import dao.MySqlBoletaEntregaDAO;
import entidad.BoletaEntregaUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/ServletBoletaEntregaJSON")
public class ServletBoletaEntregaJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletBoletaEntregaJSON() {
        super();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipo = request.getParameter("accion");
		
		if (tipo.equals("bol"))
			boletaUser(request, response);
	}
	
	private void boletaUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String idUsuario = request.getParameter("idUsuarioPag");
		
		int idUser = Integer.parseInt(idUsuario);
		
		System.out.print("ESTE ES EL ID PRA JSON boleta"+idUsuario);
		
		List<BoletaEntregaUser> boletaUser = new MySqlBoletaEntregaDAO().findAllBoletaEntrega(idUser);
		
	    // Imprimir en consola los detalles de cada boleta
	    for (BoletaEntregaUser boleta : boletaUser) {
	        System.out.println("ID Boleta: " + boleta.getIdBoletaE());
	        System.out.println("Fecha: " + boleta.getFechaBoletaE());
	        System.out.println("Monto: " + boleta.getMontoBoletaE());
	        System.out.println("Nombre Usuario: " + boleta.getNameuserBoletaE());
	        System.out.println("Apellido Usuario: " + boleta.getApellidouserBoletaE());
	        System.out.println("Email Usuario: " + boleta.getEmailBoletaE());
	        System.out.println("Tipo de Cuenta: " + boleta.getTipoCuentaBoletaE());
	        System.out.println("Costo: " + boleta.getCostoBoletaE());
	        System.out.println("----------------------------------");
	    }
		
       //crear objeto de la clase Gson
		Gson gson = new Gson();
		//convertir a JSON(STRING) el arreglo favorito
		String json = gson.toJson(boletaUser);
		//preparar salida en formato JSON
		response.setContentType("application/json;charset=UTF-8");
		//
		PrintWriter pw=response.getWriter();
		pw.print(json); 
	}
	

}
