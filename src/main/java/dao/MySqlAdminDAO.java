package dao;

import entidad.Admin;
import interfaces.adminDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.MySqlConectar;

public class MySqlAdminDAO implements adminDAO {


    @Override
    public int registrarAdmin(Admin bean) {
        int salida = -1;
        Connection cn = null;
        PreparedStatement pstm = null;
        try {
            cn = new MySqlConectar().getConnection();
            String sql = "INSERT INTO admin (nombre, apellido, correo, contrasena, telefono, dni) VALUES (?,?,?,?,?,?)";
            pstm = cn.prepareStatement(sql);
            pstm.setString(1, bean.getNombre());
            pstm.setString(2, bean.getApellido());
            pstm.setString(3, bean.getCorreo());
            pstm.setString(4,bean.getContrasena());
            pstm.setString(5, bean.getTelefono());
            pstm.setString(6, bean.getDni());
            salida = pstm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(pstm != null) pstm.close();
                if(cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return salida;
    }

    @Override
    public Admin iniciarSesion(String email, String pass) {
        PreparedStatement pstm = null;
        Connection cn = null;
        ResultSet rs = null;
        Admin adm = null;
        try {
            cn = new MySqlConectar().getConnection();
            String sql = "SELECT * FROM admin WHERE correo = ? AND contrasena = ?";
            pstm = cn.prepareStatement(sql);
            pstm.setString(1, email);
            pstm.setString(2, pass);
            rs = pstm.executeQuery();

            if(rs.next()){
                adm = new Admin();
                adm.setIdAdmin(rs.getInt("idAdmin"));
                adm.setNombre(rs.getString("nombre"));
                adm.setApellido(rs.getString("apellido"));
                adm.setCorreo(rs.getString("correo"));
                adm.setContrasena(rs.getString("contrasena"));
                adm.setTelefono(rs.getString("telefono"));
                adm.setDni(rs.getString("dni"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstm != null) pstm.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return adm;
    }

}
