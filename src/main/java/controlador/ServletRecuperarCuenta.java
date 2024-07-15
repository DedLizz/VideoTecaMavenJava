/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import dao.MySqlUsuarioDAO;
import entidad.Usuario;
import jakarta.mail.Authenticator;
import jakarta.servlet.http.HttpSession;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Brandon
 */
@WebServlet("/ServletRecuperarCuenta")
public class ServletRecuperarCuenta extends HttpServlet {
    

    public ServletRecuperarCuenta() {
        super();
    }


    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipo = request.getParameter("accion");
		
	if(tipo.equals("recuperar"))
            try {
                recuperarCuenta(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(ServletRecuperarCuenta.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(tipo.equals("cerrar"))
            cerrarLoginRecuperar(request, response);
        if(tipo.equals("actualizar"))
            actualizar(request, response);
        
    }
	
    private void enviarCorreo(String destinatario) throws MessagingException {
        // Datos de autenticación
        final String username = "dedlizi611@gmail.com";
        final String password = "yjlr daom sklb rrxf";

        // Configuración de propiedades
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Inicio de sesión de correo electrónico
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Crear un mensaje de correo electrónico
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
            message.setSubject("Bienvenido a VideoTeca");
            message.setText("Hola, bienvenido a VideoTeca.\n\n" +
                "Hola, este correo te indicaremos cómo recuperar tu cuenta. No te preocupes, solo tienes que darle clic al siguiente enlace:\n\n" +
                "http://localhost:8089/VideoTeca3Net/cambiocontrasena.jsp\n\n" +
                "Puedes darle clic o copiarlo y pegarlo en el navegador donde has estado haciendo el trámite de recuperación de cuenta.");


            // Enviar correo electrónico
            Transport.send(message);
        } catch (MessagingException e) {
            throw new MessagingException("Error al enviar el correo electrónico: " + e.getMessage());
        }
    }

    // Método recuperarCuenta 
    private void recuperarCuenta(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, MessagingException {
        String EmailLog = request.getParameter("EmailPagLog");

        // Valida si el usuario y la clave coinciden
        Usuario usu = new MySqlUsuarioDAO().iniciarSesionRecuperar(EmailLog);

        if (usu == null) {
            // Atributo de tipo sesión
            request.getSession().setAttribute("MENSAJE", "Usuario y/o clave incorrectos");
            response.sendRedirect("recuperarone.jsp");
        } else {
            // Se obtienen los datos del usuario que inició sesión
            int idUsuario = usu.getIdUsuario();
            String nombre = usu.getNombreUsuario();
            String apellido = usu.getApellidoUsuario();
            String email = usu.getEmailUsuaio(); // Corrección de la función getEmailUsuario
            int idTipoCuenta = usu.getTipoCuentaUsuario();

            // Se almacenan los datos del usuario en la sesión HTTP
            HttpSession session = request.getSession();
            session.setAttribute("id", idUsuario);
            session.setAttribute("nombre", nombre);
            session.setAttribute("apellido", apellido);
            session.setAttribute("email", email);
            session.setAttribute("idTipoCuenta", idTipoCuenta);

            // Parte para enviar email
            try {
                enviarCorreo(email); // Llama al método para enviar correo electrónico
                request.setAttribute("successMessage", "Email enviado correctamente.");
                request.getRequestDispatcher("recuperardos.jsp").forward(request, response);
            } catch (MessagingException e) {
                request.setAttribute("errorMessage", "Error al enviar el correo electrónico: " + e.getMessage());
                request.getRequestDispatcher("recuperarone.jsp").forward(request, response);
            }
        }
    }
    
    
    private void cerrarLoginRecuperar(HttpServletRequest request, HttpServletResponse response) throws IOException {
            //obtener la sesión actual
            HttpSession session=request.getSession();
            //invalidar todos los atributos de tipo sesión
            session.invalidate();
            request.getSession().setAttribute("MENSAJE", "Sesión terminada");
            response.sendRedirect("loginRegister.jsp");
    }
    
    private void actualizar(HttpServletRequest request, HttpServletResponse response) throws IOException {
            // Obtener los parámetros del request
            int idUsuario = Integer.valueOf(request.getParameter("idPersonaPag"));
            String nuevaContrasena = request.getParameter("confirmaContrasenaPag");

            // Crear un objeto Usuario con los datos obtenidos
            Usuario usuario = new Usuario();
            usuario.setIdUsuario(idUsuario);
            usuario.setContraUsuario(nuevaContrasena);

            // Llamar al método updatePassword para actualizar la contraseña
            int resultado = new MySqlUsuarioDAO().updatePassword(usuario);

            // Manejar el resultado según sea necesario (por ejemplo, enviar una respuesta al cliente)
            if (resultado > 0) {
                //obtener la sesión actual
                HttpSession session=request.getSession();
                //invalidar todos los atributos de tipo sesión
                session.invalidate();
                response.getWriter().println("Contraseña actualizada correctamente.");
                response.sendRedirect("loginRegister.jsp");
            } else {
                response.getWriter().println("Error al actualizar la contraseña.");
                response.sendRedirect("cambiocontrasena.jsp");
            }     
    }
    
}