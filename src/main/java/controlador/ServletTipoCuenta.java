package controlador;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import dao.MySqlTipoCuentaDAO;
import entidad.TipoCuenta;

@WebServlet("/ServletTipoCuenta")
public class ServletTipoCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletTipoCuenta() {
        super();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipo = request.getParameter("accion");
		
		if(tipo.equals("lista"))
			listarTipoCuenta(request, response);
	}
	
	protected void listarTipoCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TipoCuenta> lista = null;
        try {
            lista = new MySqlTipoCuentaDAO().findAllTipoCuenta();
            System.out.println("Datos de usuarios obtenidos correctamente de la base de datos:");
            if (lista != null) {
                for (TipoCuenta tip : lista) {
                    System.out.println("ID TipoCuentaUser: " + tip.getIdTipoCuenta());
                    System.out.println("Costo" + tip.getCosto());
                    System.out.println("Nombre de paquete " + tip.getTipoCuenta());
                    System.out.println("---------------------------");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error al obtener los datos de usuarios de la base de datos: " + e.getMessage());
        }
        request.setAttribute("listatipoCuenta", lista);
        request.getRequestDispatcher("/tipoCuentaUsuario.jsp").forward(request, response);
	}


}
