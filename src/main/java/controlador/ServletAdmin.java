package controlador;

import com.google.gson.Gson;
import dao.MySqlAdminDAO;
import dao.MySqlFacturaEntregaDAO;
import dao.MySqlUsuarioDAO;
import entidad.FacturaEntregaUser;
import entidad.Usuario;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

//import paquetes
import entidad.Admin;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ServletAdmin")
public class ServletAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public ServletAdmin() {
        super();
    }


    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String tipo = request.getParameter("accion");

        if (tipo.equals("registro"))
            registroAdmin(request, response);
        if (tipo.equals("solicitud")) {
            try {
                solicitudS(request, response);
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        }

    }
	
    private void registroAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name, apellido, contrasena, telefono, dni;
        name = request.getParameter("nombreAdmPag");
        apellido =request.getParameter("apellidoAdmPag");
        contrasena = request.getParameter("contrasenaAdmPag");
        telefono = request.getParameter("telefonoAdmPag");
        dni = request.getParameter("dniAdmPag");

        Admin adm = new Admin();
        adm.setNombre(name);
        adm.setApellido(apellido);
        adm.setCorreo(name + "@admin.com");
        adm.setContrasena(contrasena);
        adm.setTelefono(telefono);
        adm.setDni(dni);

        int salida = new MySqlAdminDAO().registrarAdmin(adm);

        if (salida > 0) {
            response.sendRedirect("loginRegister.jsp");
        } else {
            response.sendRedirect("admin.jsp");
        }
    }

    private void enviarCorreo(String destinatario, String habilidad, String tipoPersona ) throws MessagingException {
        // Datos de autenticación
        final String username = "dedlizi611@gmail.com";
        final String password = "xcqv udtj hqsu bbrg";

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

            String mensaje = "Hola " + destinatario + ",\n\n" +
                    "Te damos la bienvenida. Tu solicitud para formar parte de nuestro equipo de VideoTeca ha sido aprobada. " +
                    "Tendrás un mes de prueba para registrarte y obtener una cuenta especial. Para registrarte, por favor completa " +
                    "este registro haciendo clic en el siguiente enlace:\n\n" +
                    "http://localhost:8089/VideoTeca3Net/formSolicitud.jsp\n\n";

            switch (tipoPersona.toLowerCase()) {
                case "estudiante":
                    mensaje += tipoPersona+", Te felicitamos por interesarte en nuestra plataforma. ";
                    break;
                case "profesor":
                    mensaje += tipoPersona+"Gracias por integrarte. Ahora nuestro equipo contará con tu valioso apoyo. ";
                    break;
                case "investigador":
                    mensaje += tipoPersona+"Estamos encantados de conocerte. Tu contribución será de gran ayuda. ";
                    break;
                case "otro":
                    mensaje += tipoPersona+"Nos agrada contar con tu apoyo. ";
                    break;
                default:
                    mensaje += "....... ";
                    break;
            }

            mensaje += "\nGracias por escribirnos y mencionar tus habilidades en (" + habilidad + ").\n\nSaludos,\nEquipo de VideoTeca";

            message.setText(mensaje);

            // Enviar correo electrónico
            Transport.send(message);
        } catch (MessagingException e) {
            throw new MessagingException("Error al enviar el correo electrónico: " + e.getMessage());
        }
    }


    // Método recuperarCuenta
    private void solicitudS(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, MessagingException {
        String habilidades, tipoPersona, correoSol;
        habilidades = request.getParameter("habilidadesSoli");
        tipoPersona = request.getParameter("tipoPersonaSoli");
        correoSol = request.getParameter("correoSoli");


            // Parte para enviar email
            try {
                enviarCorreo(correoSol, habilidades, tipoPersona );
                System.out.println("Email enviado correctamente.");
                request.getRequestDispatcher("loginRegister.jsp").forward(request, response);
            } catch (MessagingException e) {
                request.getRequestDispatcher("formSolicitud.jsp").forward(request, response);
                System.out.println("Error al enviar el correo electrónico: ");
            }
        }
}
	
	


