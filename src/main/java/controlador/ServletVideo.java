package controlador;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import dao.MySqlVideoDAO;
import entidad.Video;
import entidad.VideoInfo;
import jakarta.servlet.http.HttpSession;
import java.io.OutputStream;
import java.io.PrintWriter;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


@WebServlet("/ServletVideo")
public class ServletVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
        public ServletVideo() {
            super();
            // TODO Auto-generated constructor stub
        }

	
        @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String tipo = request.getParameter("accion");

            if(tipo.equals("lista"))
                listarVideo(request, response);
            else if (tipo.equals("buscar"))
                buscarVideo(request,response);
            else if (tipo.equals("buscarVi"))
                buscarVideoTitulo(request,response);
            else if (tipo.equals("guardar"))
                guardarVideo(request, response);
            else if (tipo.equals("editar"))
                editarVideo(request, response);
            else if (tipo.equals("eliminar"))
                eliminarVideo(request, response);
            else if (tipo.equals("exel"))
                exelVideo(request, response);
		
	}
	
	 protected void buscarVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int idVideo;
	    
	    try {
	        idVideo = Integer.parseInt(request.getParameter("idVideoPag"));
	    } catch(NumberFormatException e) {
	        request.getSession().setAttribute("MENSAJE", "ID de video no válido");
	        response.sendRedirect("MenuHome.jsp");
	        return;
	    }
	    
	    Video video = new MySqlVideoDAO().findById(idVideo);
	    
	    if(video == null) {
	        request.getSession().setAttribute("MENSAJE", "Video no encontrado");
	        response.sendRedirect("MenuHome.jsp");
	    } else {
	        // Almacenar cada dato del video en la sesión HTTP
	        HttpSession session = request.getSession();
	        session.setAttribute("idVideo", video.getIdVideo());
	        session.setAttribute("tituloVideo", video.getTituloVideo());
	        session.setAttribute("descripcionVideo", video.getDescripcion());
	        session.setAttribute("urlVideo", video.getUrlVideo());
	        session.setAttribute("categoriaVideo", video.getCategoriaVideo());
	        
	        // Redireccionar a la página que mostrará los datos del video por separado
	        response.sendRedirect("MenuVideo.jsp");
	    }
	}

         //LISTA VIDEOS PARA EL ADMINISTRADOR
	protected void listarVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
            List<Video> lista = new MySqlVideoDAO().findAllVideo();
            
            //crear objeto de la clase Gson
            Gson gson = new Gson();
            //convertir a JSON(STRING) el arreglo lista
            String json = gson.toJson(lista);
            //preparar salida en formato JSON
            response.setContentType("application/json;charset=UTF-8");
            //
            PrintWriter pw=response.getWriter();
            pw.print(json); 

	}
	

	protected void buscarVideoTitulo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String tituloVi = request.getParameter("palabraPag");
	    
	    // Eliminar espacios en blanco y convertir a minúsculas
	    tituloVi = tituloVi.trim().toLowerCase();

	    List<Video> videos = new MySqlVideoDAO().findAllVideo();
	    
	    List<Video> videosEncontrados = new ArrayList<>();

	    // Iterar sobre la lista de videos
	    for (Video video : videos) {
	        // Obtener el título del video y aplicar las mismas transformaciones
	        String tituloVideo = video.getTituloVideo().trim().toLowerCase();

	        // Comparar si el título coincide con el título buscado
	        if (tituloVideo.equals(tituloVi)) {
	            // Si coincide, añadir este video a la lista de videos encontrados
	            videosEncontrados.add(video);
	        }
	    }

	    // Si se encontró algún video con el título buscado
	    if (!videosEncontrados.isEmpty()) {
	        // Tomamos el primer video de la lista (si hay más de uno con el mismo título)
	        Video videoEncontrado = videosEncontrados.get(0);

	        // Almacenar cada dato del video en la sesión HTTP
	        HttpSession session = request.getSession();
	        session.setAttribute("idVideo", videoEncontrado.getIdVideo());
	        session.setAttribute("tituloVideo", videoEncontrado.getTituloVideo());
	        session.setAttribute("descripcionVideo", videoEncontrado.getDescripcion());
	        session.setAttribute("urlVideo", videoEncontrado.getUrlVideo());
	        session.setAttribute("categoriaVideo", videoEncontrado.getCategoriaVideo());
	        
	        // Redireccionar a la página que mostrará los datos del video por separado
	        response.sendRedirect("MenuVideo.jsp");
	    } else {
	    	response.sendRedirect("MenuHome.jsp");
	        // Manejar el caso en que no se encontró ningún video con el título buscado
	        // Por ejemplo, mostrar un mensaje de error o redirigir a una página de búsqueda nuevamente
	        // response.sendRedirect("PaginaDeError.jsp");
	    }
		
		
	}
	
	protected void guardarVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String tituloVideo = request.getParameter("tituloPag");
            String descricionVideo = request.getParameter("descripPag");
            String url = request.getParameter("urlPag");
            int idCategoria = Integer.parseInt(request.getParameter("idCategoriaPag"));
            
            Video bean = new Video();
            bean.setTituloVideo(tituloVideo);
            bean.setDescripcion(descricionVideo);
            bean.setUrlVideo(url);
            bean.setCategoriaVideo(idCategoria);
            
            int estado = new MySqlVideoDAO().save(bean);
            
            
            if( estado == 1 ){
                System.out.println("VIDEO GUARDADO EXITOSAMENTE");
                response.sendRedirect("registroVideo.jsp");
            } else {
                System.out.println("NO SE GUARDO EL VIDEO");
                response.sendRedirect("registroVideo.jsp");
            }	
	}
        
        protected void editarVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int idVideo = Integer.parseInt(request.getParameter("idVideoPag"));
            String tituloVideo = request.getParameter("tituloPag");
            String descricionVideo = request.getParameter("descripPag");
            String url = request.getParameter("urlPag");
            int idCategoria = Integer.parseInt(request.getParameter("idCategoriaPag"));
            
            Video bean = new Video();
            bean.setIdVideo(idVideo);
            bean.setTituloVideo(tituloVideo);
            bean.setDescripcion(descricionVideo);
            bean.setUrlVideo(url);
            bean.setCategoriaVideo(idCategoria);
            
            int estado = new MySqlVideoDAO().update(bean);
            
            if( estado == 1 ){
                System.out.println("VIDEO GUARDADO EXITOSAMENTE");
            } else {
                System.out.println("NO SE GUARDO EL VIDEO");
            }	
            
            response.sendRedirect("registroVideo.jsp");
            
        }
        
        protected void eliminarVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int idVideo = Integer.parseInt(request.getParameter("idVideoPag"));
            
            
            int estado = new MySqlVideoDAO().deleteById(idVideo);
            
            if (estado == 1){
                System.out.println("VIDEO ELIMINADO CONRRECTAMENTE");
            } else {
                System.out.println("EL VIDEO NO SE ELIMINO");
            }
            
            response.sendRedirect("registroVideo.jsp");
            
        }
        
        protected void exelVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
        // Obtener la lista de videos
        List<VideoInfo> lista = new MySqlVideoDAO().findAllVideosWithCategory();
        
        
        // Crear un nuevo libro de trabajo
        XSSFWorkbook workbook = new XSSFWorkbook();
        
        // Crear una hoja en el libro de trabajo
        XSSFSheet sheet = workbook.createSheet("Videos");
        
        // Crear la fila de encabezado
        XSSFRow headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Titulo Video");
        headerRow.createCell(2).setCellValue("Descripción");
        headerRow.createCell(3).setCellValue("URL");
        headerRow.createCell(4).setCellValue("Categoria");
        
        // Llenar el resto de filas con los datos de las categorias
        int rowNum = 1;
        for (VideoInfo video : lista) {
            XSSFRow row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(video.getIdVideo());
            row.createCell(1).setCellValue(video.getTituloVideo());
            row.createCell(2).setCellValue(video.getDescripcion());
            row.createCell(3).setCellValue(video.getUrlVideo());
            row.createCell(4).setCellValue(video.getNombreCategoria());
        }
        
        // Escribir el libro de trabajo en un flujo de salida
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=Lista-Videos.xlsx");
        try (OutputStream outputStream = response.getOutputStream()) {
            workbook.write(outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // Cerrar el libro de trabajo
            try {
                workbook.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }  
    }
        

        
	
	
	
}
