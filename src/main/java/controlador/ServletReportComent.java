package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import dao.MySqlReportComentDAO;
import entidad.ReportComentario;

@WebServlet("/ServletReportComent")
public class ServletReportComent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletReportComent() {
        super();
    }
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String tipo = request.getParameter("accion");
		
		if(tipo.equals("guardar"))
			saveReportComent(request, response);
	}
	
	protected void saveReportComent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String coment = request.getParameter("comentPag");
		int idUser = Integer.parseInt(request.getParameter("idUserPag"));
		
		System.out.println("este es de servlet"+coment);
		System.out.println("este es de servlet"+idUser);
		
		ReportComentario comentR = new ReportComentario();
		comentR.setComentaReport(coment);
		comentR.setIdUserReport(idUser);
		
		int estado = new MySqlReportComentDAO().save(comentR);
		
		if (estado == 1) {
			System.out.println("Comentario Guardado");
			response.sendRedirect("MenuHome.jsp");
		} else {
			System.out.println("Comentario no Guardado");
		}
		
	}

}
