package controlador;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import dao.MySqlCategoriaDAO;
import entidad.Categoria;
import entidad.CategoriaInfo;
import jakarta.servlet.http.HttpSession;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


@WebServlet("/ServletCategoria")
public class ServletCategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ServletCategoria() {
        super();
    }

	
        @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
            String tipo = request.getParameter("accion");

            if(tipo.equals("lista"))
                listarCategoria(request, response);
            if(tipo.equals("grafico"))
                graficoInfo(request, response);
            if(tipo.equals("exel"))
                exelGraficoCategoriaVideo(request, response);
            if(tipo.equals("pdf"))
                try {
                    pdfGraficoCategoriaVideo(request, response);
            } catch (JRException ex) {
                Logger.getLogger(ServletCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }

	}

        //esto lista todas las categorias que tengan
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
        
        
    //este es un metodo que optiene informacion de categoria para mostrar en grafico
    protected void graficoInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CategoriaInfo> lista = new MySqlCategoriaDAO().findAllCategoriaInfo();

        List<String> nombresCategorias = new ArrayList<>();
        List<Integer> cantidadVideos = new ArrayList<>();

        for (CategoriaInfo categoriaInfo : lista) {
            nombresCategorias.add(categoriaInfo.getNombreCategoria());
            cantidadVideos.add(categoriaInfo.getCantidadVideo());
        }

        // Crear un objeto JSON para los datos
        JsonObject data = new JsonObject();
        data.add("nombreCategorias", new Gson().toJsonTree(nombresCategorias));
        data.add("cantidadVideos", new Gson().toJsonTree(cantidadVideos));

        // Configurar la respuesta
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(data.toString());
    }
    
    protected void pdfGraficoCategoriaVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, JRException {
        List<CategoriaInfo> lista = new MySqlCategoriaDAO().findAllCategoriaInfo();

        if (!lista.isEmpty()) {
            try (InputStream jasperStream = this.getServletConfig().getServletContext().getResourceAsStream("/jasper/grafico2.jrxml")) {
                // Cargar y compilar el archivo .jrxml
                JasperReport jasperReport = JasperCompileManager.compileReport(jasperStream);

                // Parámetros del reporte (si los hubiera)
                Map<String, Object> parameters = new HashMap<>();
                parameters.put("tituloGrafico", "Cantidad de Videos por Categoría");

                // Llenar el reporte con los datos
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JRBeanCollectionDataSource(lista));

                // Configurar la respuesta para PDF
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline; filename=CategoriaReport.pdf");

                // Exportar el reporte a PDF y escribirlo a la respuesta
                JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

                System.out.println("Informe generado correctamente.");
            } catch (JRException e) {
                System.err.println("Error al generar el informe: " + e.getMessage());
                response.getWriter().println("Error al generar el informe: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            System.out.println("No hay categorías disponibles.");
            response.getWriter().println("No hay categorías disponibles.");
        }
    }
    
     protected void exelGraficoCategoriaVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
        List<CategoriaInfo> lista = new MySqlCategoriaDAO().findAllCategoriaInfo();
        
        
        
        // Crear un nuevo libro de trabajo
        XSSFWorkbook workbook = new XSSFWorkbook();
        
        // Crear una hoja en el libro de trabajo
        XSSFSheet sheet = workbook.createSheet("Videos");
        
        // Crear la fila de encabezado
        XSSFRow headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("ID");
        headerRow.createCell(1).setCellValue("Categoria");
        headerRow.createCell(2).setCellValue("Numero Videos");
        
        // Llenar el resto de filas con los datos de las categorias
        int rowNum = 1;
        for (CategoriaInfo categoria : lista) {
            XSSFRow row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(categoria.getIdCategoria());
            row.createCell(1).setCellValue(categoria.getNombreCategoria());
            row.createCell(2).setCellValue(categoria.getCantidadVideo());
        }
        
        // Escribir el libro de trabajo en un flujo de salida
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=Lista-Categorias.xlsx");
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
