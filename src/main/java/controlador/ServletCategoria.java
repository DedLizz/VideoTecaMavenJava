package controlador;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import dao.MySqlCategoriaDAO;
import entidad.Categoria;


@WebServlet("/ServletCategoria")
public class ServletCategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ServletCategoria() {
        super();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tipo = request.getParameter("accion");
		
		if(tipo.equals("lista"))
			listarCategoria(request, response);
		
	}

	protected void listarCategoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		List<Categoria> lista = null;
        try {
            lista = new MySqlCategoriaDAO().findAllCategoria();
            System.out.println("Datos de usuarios obtenidos correctamente de la base de datos:");
            if (lista != null) {
                for (Categoria categoria : lista) {
                    System.out.println("ID categoria: " +categoria.getIdCategoria());
                    System.out.println("categoria" +categoria.getNombreCategoria());
                    System.out.println("---------------------------");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error al obtener los datos de usuarios de la base de datos: " + e.getMessage());
        }
        request.setAttribute("listatipoCategoria", lista);
        request.getRequestDispatcher("/categoria.jsp").forward(request, response);
	}
}
