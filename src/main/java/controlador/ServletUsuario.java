package controlador;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import dao.MySqlBoletaDAO;
import dao.MySqlBoletaEntregaDAO;
import dao.MySqlFacturaDAO;
import dao.MySqlFacturaEntregaDAO;
import dao.MySqlUsuarioDAO;
import entidad.Boleta;
import entidad.BoletaEntregaUser;
import entidad.Factura;
import entidad.FacturaEntregaUser;
import entidad.Usuario;
import jakarta.servlet.http.HttpSession;



//librerias relacionado con pdf
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapCollectionDataSource;



@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Usuario usuarioRegistrado;
	

	
    public ServletUsuario() {
        super();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String tipo = request.getParameter("accion");
		
		if(tipo.equals("lista"))
			listarUsuarios(request, response);
		else if (tipo.equals("grabar"))
			registroGrabar(request,response);
		else if (tipo.equals("eliminar"))
			eliminarUsuario(request, response);
		else if (tipo.equals("login"))
			iniciarLogin(request, response);
		else if (tipo.equals("cerrar"))
			cerrarLogin(request, response);
		else if (tipo.equals("register"))
			paqueteUsuario(request, response);
		else if (tipo.equals("boleta"))
			boletaUsuairoRegister(request, response);
		else if (tipo.equals("factura"))
			facturaUsuairoRegister(request, response);
		else if (tipo.equals("tipUpdateBol"))
			updateTipBoleta(request, response);
		else if (tipo.equals("tipUdateFac"))
			updateTipFactura(request, response);
                else if (tipo.equals("facturapdf"))
                    facturaBotonPDF(request, response);
                else if (tipo.equals("boletapdf"))
                    boletaBotonPDF(request, response);
		
	}

	
	
	protected void listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Usuario> lista = null;
        try {
            lista = new MySqlUsuarioDAO().findAllUsuario();
            System.out.println("Datos de usuarios obtenidos correctamente de la base de datos:");
            if (lista != null) {
                for (Usuario usuario : lista) {
                    System.out.println("ID Usuario: " + usuario.getIdUsuario());
                    System.out.println("Nombre: " + usuario.getNombreUsuario());
                    System.out.println("Apellido: " + usuario.getApellidoUsuario());
                    System.out.println("Email: " + usuario.getEmailUsuaio());
                    System.out.println("Tipo de Cuenta: " + usuario.getTipoCuentaUsuario());
                    System.out.println("---------------------------");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error al obtener los datos de usuarios de la base de datos: " + e.getMessage());
        }
        
        request.setAttribute("listaUsuarios", lista);
        request.getRequestDispatcher("/usuario2.jsp").forward(request, response);
	}
	

	
	protected void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idUsuario;
		idUsuario = request.getParameter("idUsuarioPag");
		
		int estado = new MySqlUsuarioDAO().deleteById(Integer.parseInt(idUsuario));
		
		if (estado == 1)
			System.out.println("SI");
		else 
			System.out.println("NO");
		
		request.getSession().setAttribute("MENSAJE", "Persona eliminada");
	}
	
	
	
	private void iniciarLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String EmailLog, ContraLog;
		EmailLog = request.getParameter("EmailPagLog");
		ContraLog = request.getParameter("ContraPagLog");
		
		//valida si el usuario y la clave coninciden
		Usuario usu = new MySqlUsuarioDAO().iniciarSesion(EmailLog, ContraLog);
		
		if (usu == null) {
			//atributo de tipo sesion
			request.getSession().setAttribute("MENSAJE", "Usuario y/o clave incorrectos");
			response.sendRedirect("loginRegister.jsp");
		} else {
			// Se obtienen los datos del usuario que inició sesión
			int idUsuario = usu.getIdUsuario();
            String nombre = usu.getNombreUsuario();
            String apellido = usu.getApellidoUsuario();
            String email = usu.getEmailUsuaio();
            int idTipoCuenta = usu.getTipoCuentaUsuario();

            // Se almacenan los datos del usuario en la sesión HTTP
            HttpSession session = request.getSession();
            session.setAttribute("id", idUsuario);
            session.setAttribute("nombre", nombre);
            session.setAttribute("apellido", apellido);
            session.setAttribute("email", email);
            session.setAttribute("idTipoCuenta", idTipoCuenta);
            


            // Redireccionar a la página de inicio o a alguna otra página de tu aplicación
            response.sendRedirect("MenuHome.jsp");
		}
	}
		
		
		
	private void cerrarLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//obtener la sesión actual
		HttpSession session=request.getSession();
		//invalidar todos los atributos de tipo sesión
		session.invalidate();
		request.getSession().setAttribute("MENSAJE", "Sesión terminada");
		response.sendRedirect("index.jsp");
		
	}
	
	private void registroGrabar(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    // valores recuperados de resgistro
		String nombreR, apellidoR, emailR, contraR, tipoCuentaR;
		nombreR = request.getParameter("nombreRPag");
		apellidoR = request.getParameter("apellidoRPag");
		emailR = request.getParameter("emailRPag");
		contraR = request.getParameter("contraRPag");
		tipoCuentaR = request.getParameter("tipoCuentaRPag");
		
		//crear objeto usuario
		Usuario user = new Usuario();
		
		//setar los atributos del objeto usuario
		user.setNombreUsuario(nombreR);
		user.setApellidoUsuario(apellidoR);
		user.setEmailUsuaio(emailR);
		user.setContraUsuario(contraR);
		user.setTipoCuentaUsuario(Integer.parseInt(tipoCuentaR));
		
		//invocar metodo save y enviar el objeto
		int estado = new MySqlUsuarioDAO().save(user);
		
		if (estado == 1) {
		    if (tipoCuentaR.equals("1")) { // Corregido aquí
		        response.sendRedirect("MenuHome.jsp");
		    } else {
		        response.sendRedirect("paquetes.jsp");
		    }
		    // La siguiente línea es problemática y debe ser eliminada
		    // response.sendRedirect("Personas.jsp");
		    System.out.print("usuario registrado");
		} else {
		    System.out.print("error al registrar");
		}
	
	}
	
	//recibir los datos de usuario del registro sin tipo cuenta
	private void paqueteUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    // Obtener datos del formulario
	    String nombre = request.getParameter("nombreRPag");
	    String apellido = request.getParameter("apellidoRPag");
	    String email = request.getParameter("emailRPag");
	    String contra = request.getParameter("contraRPag");

	    // Crear un nuevo usuario con los datos del formulario
	    Usuario usuario = new Usuario();
	    usuario.setNombreUsuario(nombre);
	    usuario.setApellidoUsuario(apellido);
	    usuario.setEmailUsuaio(email);
	    usuario.setContraUsuario(contra);

	    // Asignar el usuario registrado
	    usuarioRegistrado = usuario;

	    // Imprimir los datos del usuario registrado
	    System.out.println(usuarioRegistrado.getIdUsuario());
	    System.out.println(usuarioRegistrado.getNombreUsuario());
	    System.out.println(usuarioRegistrado.getApellidoUsuario());
	    System.out.println(usuarioRegistrado.getEmailUsuaio());
	    System.out.println(usuarioRegistrado.getContraUsuario());
	    System.out.println(usuarioRegistrado.getTipoCuentaUsuario());

	    // Redirigir a la página paquete.jsp
	    response.sendRedirect("paquetes.jsp");
	}
	
	
	// Crear una boleta y del usuario
	private void boletaUsuairoRegister(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int tipCuenta = Integer.parseInt(request.getParameter("tipCuentaPag"));

	    // Verificar que usuarioRegistrado no sea nulo antes de asignarle el tipo de cuenta
	    if(usuarioRegistrado != null) {
	        usuarioRegistrado.setTipoCuentaUsuario(tipCuenta);
	        
	        // Imprimir los datos del usuario registrado
	        System.out.println(usuarioRegistrado.getIdUsuario());
	        System.out.println(usuarioRegistrado.getNombreUsuario());
	        System.out.println(usuarioRegistrado.getApellidoUsuario());
	        System.out.println(usuarioRegistrado.getEmailUsuaio());
	        System.out.println(usuarioRegistrado.getContraUsuario());
	        System.out.println(usuarioRegistrado.getTipoCuentaUsuario());
	        
	        // Guardar el nuevo usuario en la base de datos
	        int estado = new MySqlUsuarioDAO().save(usuarioRegistrado);
	        
	        if (estado == 1) {
	            // Si el usuario se guardó correctamente
	            String emailUsuario = usuarioRegistrado.getEmailUsuaio();
	            String contraUsuario = usuarioRegistrado.getContraUsuario();
	            
	            // Intentar iniciar sesión con los datos del usuario guardado
	            Usuario usuarioIniciado = new MySqlUsuarioDAO().iniciarSesion(emailUsuario, contraUsuario);
	            
	            if (usuarioIniciado == null) {
	                // Manejar el caso en que el usuario no se pueda iniciar sesión
	                System.out.println("No se pudo iniciar sesión con el usuario guardado.");
	            } else {
	                // Almacenar los datos del usuario en la sesión HTTP
	                HttpSession session = request.getSession();
	                session.setAttribute("id", String.valueOf(usuarioIniciado.getIdUsuario()));
	                session.setAttribute("nombre", usuarioIniciado.getNombreUsuario());
	                session.setAttribute("apellido", usuarioIniciado.getApellidoUsuario());
	                session.setAttribute("email", usuarioIniciado.getEmailUsuaio());
	                session.setAttribute("idTipoCuenta", usuarioIniciado.getTipoCuentaUsuario());
	                

	                // Crear y almacenar la boleta
	                String fecha = request.getParameter("fechaPag");
	                int monto = Integer.parseInt(request.getParameter("montoPag"));
	                int codigoUsu = usuarioIniciado.getIdUsuario();
	                int tipoCuenta = usuarioIniciado.getTipoCuentaUsuario();
	                
	                Boleta boleta = new Boleta();
	                boleta.setFechaBoleta(fecha);
	                boleta.setMontoBoleta(monto);
	                boleta.setIdUserBoleta(codigoUsu);
	                boleta.setIdTipoCuentaBoleta(tipoCuenta);
	                
	                System.out.println("Boleta guardada correctamente:");
	                System.out.println("Fecha: " + boleta.getFechaBoleta());
	                System.out.println("Monto: " + boleta.getMontoBoleta());
	                System.out.println("ID Usuario: " + boleta.getIdUserBoleta());
	                System.out.println("ID Tipo Cuenta: " + boleta.getIdTipoCuentaBoleta());
	                
	                int estadoBoleta = new MySqlBoletaDAO().save(boleta);
	                
	                // Manejar el estado de la boleta guardada
	                if (estadoBoleta == 1) {
	                    System.out.println("Boleta guardada correctamente.");
	                    response.sendRedirect("MenuHome.jsp");
	                    
	                } else {
	                    System.out.println("Error al guardar la boleta.");
	                }
	            }
	        } else {
	            System.out.println("Error al guardar el usuario.");
	        }
	    } else {
	        System.out.println("No hay usuario registrado para crear la boleta.");
	    }
	}
	
	//crear una factura y del usuario
	private void facturaUsuairoRegister(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int tipCuenta = Integer.parseInt(request.getParameter("tipCuentaPag"));

	    // Verificar que usuarioRegistrado no sea nulo antes de asignarle el tipo de cuenta
	    if(usuarioRegistrado != null) {
	        usuarioRegistrado.setTipoCuentaUsuario(tipCuenta);
	        
	        // Imprimir los datos del usuario registrado
	        System.out.println(usuarioRegistrado.getIdUsuario());
	        System.out.println(usuarioRegistrado.getNombreUsuario());
	        System.out.println(usuarioRegistrado.getApellidoUsuario());
	        System.out.println(usuarioRegistrado.getEmailUsuaio());
	        System.out.println(usuarioRegistrado.getContraUsuario());
	        System.out.println(usuarioRegistrado.getTipoCuentaUsuario());
	        
	        // Guardar el nuevo usuario en la base de datos
	        int estado = new MySqlUsuarioDAO().save(usuarioRegistrado);
	        
	        if (estado == 1) {
	            // Si el usuario se guardó correctamente
	            String emailUsuario = usuarioRegistrado.getEmailUsuaio();
	            String contraUsuario = usuarioRegistrado.getContraUsuario();
	            
	            // Intentar iniciar sesión con los datos del usuario guardado
	            Usuario usuarioIniciado = new MySqlUsuarioDAO().iniciarSesion(emailUsuario, contraUsuario);
	            
	            if (usuarioIniciado == null) {
	                // Manejar el caso en que el usuario no se pueda iniciar sesión
	                System.out.println("No se pudo iniciar sesión con el usuario guardado.");
	            } else {
	                // Almacenar los datos del usuario en la sesión HTTP
	                HttpSession session = request.getSession();
	                session.setAttribute("id", String.valueOf(usuarioIniciado.getIdUsuario()));
	                session.setAttribute("nombre", usuarioIniciado.getNombreUsuario());
	                session.setAttribute("apellido", usuarioIniciado.getApellidoUsuario());
	                session.setAttribute("email", usuarioIniciado.getEmailUsuaio());
	                session.setAttribute("idTipoCuenta", usuarioIniciado.getTipoCuentaUsuario());
	                
	
	                // Crear y almacenar la factura
	                String fecha = request.getParameter("fechaPag");
	                int monto = Integer.parseInt(request.getParameter("montoPag"));
	                int codigoUsu = usuarioIniciado.getIdUsuario();
	                int tipoCuenta = usuarioIniciado.getTipoCuentaUsuario();
	                String razonEmpresa = request.getParameter("razonEmpresaPag");
	                String razonCliente = request.getParameter("razonClientePag");
	                String direccion = request.getParameter("direccionPag");
	                int igv = Integer.parseInt(request.getParameter("igvPag"));
	                
	                Factura factura = new Factura();
	                factura.setFechaFactura(fecha);
	                factura.setMontoFactura(monto);
	                factura.setIdUsuarioFactura(codigoUsu);
	                factura.setIdTipoCuentaFactura(tipoCuenta);
	                factura.setRazonEFactura(razonEmpresa);
	                factura.setRazonCFactura(razonCliente);
	                factura.setDireccionFactura(direccion);
	                factura.setIgv(igv);
	                
	                System.out.println("Factura guardada correctamente:");
	                System.out.println("Fecha: " + factura.getFechaFactura());
	                System.out.println("Monto: " + factura.getMontoFactura());
	                System.out.println("ID Usuario: " + factura.getIdUsuarioFactura());
	                System.out.println("ID Tipo Cuenta: " + factura.getIdTipoCuentaFactura());
	                
	                System.out.println("razon Empresa: " + factura.getRazonEFactura());
	                System.out.println("razon Cliente: " + factura.getRazonCFactura());
	                System.out.println("Dirección: " + factura.getDireccionFactura());
	                System.out.println("igv: " + factura.getIgv());
	                
	                int estadoFactura = new MySqlFacturaDAO().save(factura);
	                
	                // Manejar el estado de la factura guardada
	                if (estadoFactura == 1) {
	                    System.out.println("factura guardada correctamente.");
	                    response.sendRedirect("MenuHome.jsp");
	                    
	                } else {
	                    System.out.println("Error al guardar la factura.");
	                }
	            }
	        } else {
	            System.out.println("Error al guardar el usuario.");
	        }
	    } else {
	        System.out.println("No hay usuario registrado para crear la factura.");
	    }
	
	}
	
	private void updateTipBoleta(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int idUsuario = Integer.parseInt(request.getParameter("idUserPag"));
		int tipCuenta = Integer.parseInt(request.getParameter("tipCuentaPag"));
		
		int estado = new MySqlUsuarioDAO().updateTipoCuenta(idUsuario, tipCuenta);
		
		
		if (estado == 1) {
            // Crear y almacenar la boleta
            String fecha = request.getParameter("fechaPag");
            int monto = Integer.parseInt(request.getParameter("montoPag"));
            int codigoUsu = idUsuario;
            int tipoCuenta = tipCuenta;
            
            Boleta boleta = new Boleta();
            boleta.setFechaBoleta(fecha);
            boleta.setMontoBoleta(monto);
            boleta.setIdUserBoleta(codigoUsu);
            boleta.setIdTipoCuentaBoleta(tipoCuenta);
            
            System.out.println("Boleta guardada Editado:");
            System.out.println("Fecha: " + boleta.getFechaBoleta());
            System.out.println("Monto: " + boleta.getMontoBoleta());
            System.out.println("ID Usuario: " + boleta.getIdUserBoleta());
            System.out.println("ID Tipo Cuenta: " + boleta.getIdTipoCuentaBoleta());
            
            int estadoBoleta = new MySqlBoletaDAO().save(boleta);
            
            // Manejar el estado de la boleta guardada
            if (estadoBoleta == 1) {
                System.out.println("Boleta guardada correctamente.");
                
                Usuario usuarioIniciado = new MySqlUsuarioDAO().findUsuarioById(idUsuario);
                
                if (usuarioIniciado == null) {
	                System.out.println("No se pudo iniciar sesión con el usuario guardado.");
	            } else {
	            	//finalizar la sesion anterior
	        		HttpSession session=request.getSession();
	        		//invalidar todos los atributos de tipo sesión
	        		session.invalidate();
	        		
	            	// Almacenar los datos del usuario en la sesión HTTP
	                HttpSession session2 = request.getSession();
	                session2.setAttribute("id", String.valueOf(usuarioIniciado.getIdUsuario()));
	                session2.setAttribute("nombre", usuarioIniciado.getNombreUsuario());
	                session2.setAttribute("apellido", usuarioIniciado.getApellidoUsuario());
	                session2.setAttribute("email", usuarioIniciado.getEmailUsuaio());
	                session2.setAttribute("idTipoCuenta", usuarioIniciado.getTipoCuentaUsuario());
	            }
                
                
                
                response.sendRedirect("MenuHome.jsp");
                
            } else {
                System.out.println("Error al guardar la boleta.");
            }
		}
		
		
	}
	
	private void updateTipFactura(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int idUsuario = Integer.parseInt(request.getParameter("idUserPag"));
		int tipCuenta = Integer.parseInt(request.getParameter("tipCuentaPag"));
		
		int estado = new MySqlUsuarioDAO().updateTipoCuenta(idUsuario, tipCuenta);
		
		
		if (estado == 1) {
            // Crear y almacenar la factura
            String fecha = request.getParameter("fechaPag");
            int monto = Integer.parseInt(request.getParameter("montoPag"));
            int codigoUsu = idUsuario;
            int tipoCuenta = tipCuenta;
            String razonEmpresa = request.getParameter("razonEmpresaPag");
            String razonCliente = request.getParameter("razonClientePag");
            String direccion = request.getParameter("direccionPag");
            int igv = Integer.parseInt(request.getParameter("igvPag"));
            
            Factura factura = new Factura();
            factura.setFechaFactura(fecha);
            factura.setMontoFactura(monto);
            factura.setIdUsuarioFactura(codigoUsu);
            factura.setIdTipoCuentaFactura(tipoCuenta);
            factura.setRazonEFactura(razonEmpresa);
            factura.setRazonCFactura(razonCliente);
            factura.setDireccionFactura(direccion);
            factura.setIgv(igv);
            
            System.out.println("Factura guardada correctamente:");
            System.out.println("Fecha: " + factura.getFechaFactura());
            System.out.println("Monto: " + factura.getMontoFactura());
            System.out.println("ID Usuario: " + factura.getIdUsuarioFactura());
            System.out.println("ID Tipo Cuenta: " + factura.getIdTipoCuentaFactura());
            
            System.out.println("razon Empresa: " + factura.getRazonEFactura());
            System.out.println("razon Cliente: " + factura.getRazonCFactura());
            System.out.println("Dirección: " + factura.getDireccionFactura());
            System.out.println("igv: " + factura.getIgv());
            
            int estadoFactura = new MySqlFacturaDAO().save(factura);
            
            // Manejar el estado de la factura guardada
            if (estadoFactura == 1) {
                System.out.println("factura guardada correctamente.");
                
                Usuario usuarioIniciado = new MySqlUsuarioDAO().findUsuarioById(idUsuario);
                
                if (usuarioIniciado == null) {
	                System.out.println("No se pudo iniciar sesión con el usuario guardado.");
	            } else {
	            	//finalizar la sesion anterior
	        		HttpSession session=request.getSession();
	        		//invalidar todos los atributos de tipo sesión
	        		session.invalidate();
	        		
	            	// Almacenar los datos del usuario en la sesión HTTP
	                HttpSession session2 = request.getSession();
	                session2.setAttribute("id", String.valueOf(usuarioIniciado.getIdUsuario()));
	                session2.setAttribute("nombre", usuarioIniciado.getNombreUsuario());
	                session2.setAttribute("apellido", usuarioIniciado.getApellidoUsuario());
	                session2.setAttribute("email", usuarioIniciado.getEmailUsuaio());
	                session2.setAttribute("idTipoCuenta", usuarioIniciado.getTipoCuentaUsuario());
	            }
                
                
                response.sendRedirect("MenuHome.jsp");
                
            } else {
                System.out.println("Error al guardar la factura.");
            }
		}
		
		
	}
        private void facturaBotonPDF(HttpServletRequest request, HttpServletResponse response) throws IOException {
            String idUsuarioPag = request.getParameter("idUsuarioPag");
            int idUsuario = Integer.parseInt(idUsuarioPag);

            System.out.print("ID para la factura en formato JSON: " + idUsuario);

            List<FacturaEntregaUser> facturaUsuario = new MySqlFacturaEntregaDAO().botonfactura(idUsuario);

            System.out.println(facturaUsuario);

            if (!facturaUsuario.isEmpty()) {
                for (FacturaEntregaUser factura : facturaUsuario) {
                    System.out.println("=========================== PDF ======== Fin ===");
                    System.out.println("Fecha: " + factura.getFechaFacturaE());
                    System.out.println("Razón social de la empresa: " + factura.getEmpresaFacturaE());
                    System.out.println("Razón social del cliente: " + factura.getClienteFacturaE());
                    System.out.println("Dirección: " + factura.getDireccionFacturaE());
                    System.out.println("Monto: " + factura.getMontoFacturaE());
                    System.out.println("IGV: " + factura.getIgvFacturaE());
                    System.out.println("Nombre: " + factura.getUserFactruaE());
                    System.out.println("Apellido: " + factura.getApellidoFacturaE());
                    System.out.println("Correo Electrónico: " + factura.getEmailFacturaE());
                    System.out.println("Paquete: " + factura.getTipoCuentaFacturaE());
                    System.out.println("Total: " + factura.getMontoFacturaE());
                    System.out.println("=========================== PDF ======== Fin ===");
                }

                FacturaEntregaUser factura = facturaUsuario.get(0);

                try (InputStream jasperStream = this.getServletConfig().getServletContext().getResourceAsStream("/jasper/factura2.jrxml")) {
                    JasperReport jasperReport = JasperCompileManager.compileReport(jasperStream);

                    Map<String, Object> facturaData = new HashMap<>();
                    facturaData.put("razonSocialClienteIngresar", factura.getClienteFacturaE());
                    facturaData.put("direccionIngresar", factura.getDireccionFacturaE());
                    facturaData.put("nombreClienteIngresar", factura.getUserFactruaE());
                    facturaData.put("apellidoClienteIngresar", factura.getApellidoFacturaE());
                    facturaData.put("emailIngresar", factura.getEmailFacturaE());
                    facturaData.put("paqueteIngresar", factura.getTipoCuentaFacturaE());
                    facturaData.put("FechaIngresar", factura.getFechaFacturaE());
                    facturaData.put("montoIngresar", factura.getMontoFacturaE());
                    facturaData.put("igvIngresar", factura.getIgvFacturaE());
                    facturaData.put("totalIngresar", factura.getMontoFacturaE());

                     // Crear una lista de un solo mapa (solo una factura en este ejemplo)
                    List<Map<String, ?>> data = new ArrayList<>();
                    data.add(facturaData);

                    // Llenar el informe con datos
                    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, new HashMap<>(), new JRMapCollectionDataSource(data));

                    response.setContentType("application/pdf");
                    response.setHeader("Content-Disposition", "inline; filename=factura.pdf");

                    JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

                    System.out.println("Informe generado correctamente.");
                } catch (JRException e) {
                    System.err.println("Error al generar el informe: " + e.getMessage());
                    response.getWriter().println("Error al generar el informe: " + e.getMessage());
                    e.printStackTrace();
                }
            } else {
                System.out.println("No hay facturas disponibles para el usuario con ID: " + idUsuarioPag);
                response.getWriter().println("No hay facturas disponibles para el usuario con ID: " + idUsuarioPag);
            }
        }


        private void boletaBotonPDF(HttpServletRequest request, HttpServletResponse response) throws IOException {
            String idUsuarioPag = request.getParameter("idUsuarioPag");
            int idUsuario = Integer.parseInt(idUsuarioPag);

            System.out.print("ID para la factura en formato JSON: " + idUsuario);


            List<BoletaEntregaUser> boletaUser = new MySqlBoletaEntregaDAO().boletapdf(idUsuario);
            
            System.out.println(boletaUser);

            if (!boletaUser.isEmpty()) {
                for (BoletaEntregaUser factura : boletaUser) {
                    System.out.println("=========================== PDF ======== Fin ===");
                    System.out.println("Fecha: " + factura.getFechaBoletaE());
                    System.out.println("Monto: " + factura.getCostoBoletaE());
                    System.out.println("Nombre: " + factura.getNameuserBoletaE());
                    System.out.println("Apellido: " + factura.getApellidouserBoletaE());
                    System.out.println("Correo Electrónico: " + factura.getEmailBoletaE());
                    System.out.println("Paquete: " + factura.getTipoCuentaBoletaE());
                    System.out.println("Total: " + factura.getCostoBoletaE());
                    System.out.println("=========================== PDF ======== Fin ===");
                }

                BoletaEntregaUser factura = boletaUser.get(0);

                try (InputStream jasperStream = this.getServletConfig().getServletContext().getResourceAsStream("/jasper/boleta.jrxml")) {
                    JasperReport jasperReport = JasperCompileManager.compileReport(jasperStream);

                    Map<String, Object> BoletaData = new HashMap<>();
                    BoletaData.put("FechaIngresar", factura.getFechaBoletaE());
                    BoletaData.put("nombreClienteIngresar", factura.getNameuserBoletaE());
                    BoletaData.put("apellidoClienteIngresar", factura.getApellidouserBoletaE());
                    BoletaData.put("emailIngresar", factura.getEmailBoletaE());
                    BoletaData.put("paqueteIngresar", factura.getTipoCuentaBoletaE());
                    BoletaData.put("totalIngresar", factura.getMontoBoletaE());

                     // Crear una lista de un solo mapa (solo una factura en este ejemplo)
                    List<Map<String, ?>> data = new ArrayList<>();
                    data.add(BoletaData);

                    // Llenar el informe con datos
                    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, new HashMap<>(), new JRMapCollectionDataSource(data));

                    response.setContentType("application/pdf");
                    response.setHeader("Content-Disposition", "inline; filename=boleta.pdf");

                    JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

                    System.out.println("Informe generado correctamente.");
                } catch (JRException e) {
                    System.err.println("Error al generar el informe: " + e.getMessage());
                    response.getWriter().println("Error al generar el informe: " + e.getMessage());
                    e.printStackTrace();
                }
            } else {
                System.out.println("No hay facturas disponibles para el usuario con ID: " + idUsuarioPag);
                response.getWriter().println("No hay facturas disponibles para el usuario con ID: " + idUsuarioPag);
            }
        }
	
	
	
	
	

}
