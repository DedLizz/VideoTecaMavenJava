package interfaces;

import entidad.Admin;

public interface adminDAO {
    public int registrarAdmin(Admin admin);
    public Admin iniciarSesion(String correo, String contrasena);
}
