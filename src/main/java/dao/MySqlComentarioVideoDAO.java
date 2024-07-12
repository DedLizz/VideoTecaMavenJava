/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entidad.ComentarioVideo;
import interfaces.comentarioVideoDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.MySqlConectar;

/**
 *
 * @author Brandon
 */
public class MySqlComentarioVideoDAO implements comentarioVideoDAO {
    
        //esto es para listar comentario de un video especifico
        @Override
        public List<ComentarioVideo> findComentariosByVideoId(int idVideo) {
            List<ComentarioVideo> lista = new ArrayList<ComentarioVideo>();
            Connection cn = null;
            PreparedStatement pstm = null;
            ResultSet rs = null;
            try {
                cn = new MySqlConectar().getConnection();
                String sql = "SELECT * FROM comentario_video WHERE idVideo = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setInt(1, idVideo);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    ComentarioVideo comentario = new ComentarioVideo();
                    comentario.setIdComentario(rs.getInt("idComentario"));
                    comentario.setTextoComentario(rs.getString("textoComentario"));
                    comentario.setFechaComentario(rs.getString("fechaComentario"));
                    comentario.setIdUsuario(rs.getInt("idUsuario"));
                    comentario.setIdVideo(rs.getInt("idVideo"));
                    lista.add(comentario);
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstm != null) pstm.close();
                    if (cn != null) cn.close();
                } catch (SQLException e2) {
                    e2.printStackTrace();
                }
            }
            return lista;
        }
        
        
        //este es para eliminar por id el comentarioVideo
        @Override
        public int deleteComentarioById(int idComentario) {
            int salida = -1;
            Connection cn = null;
            PreparedStatement pstm = null;
            try {
                // 1. Obtener conexión
                cn = new MySqlConectar().getConnection();
                // 2. Sentencia SQL
                String sql = "DELETE FROM comentario_video WHERE idComentario = ?";
                // 3. Crear objeto "pstm" y enviar la variable "sql"
                pstm = cn.prepareStatement(sql);
                // 4. Parámetros
                pstm.setInt(1, idComentario);
                // 5. Ejecutar "pstm"
                salida = pstm.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pstm != null) pstm.close();
                    if (cn != null) cn.close();
                } catch (SQLException e2) {
                    e2.printStackTrace();
                }
            }
            return salida;
        }
        
        //este codigo es para guardar el comentario en la base de datos
        @Override
        public int save(ComentarioVideo bean) {
            int salida = -1;
            Connection cn = null;
            PreparedStatement pstm = null;
            try {
                // 1. Obtener conexión
                cn = new MySqlConectar().getConnection();
                // 2. Sentencia SQL
                String sql = "INSERT INTO comentario_video (textoComentario, fechaComentario, idUsuario, idVideo) VALUES (?, ?, ?, ?)";
                // 3. Crear objeto "pstm" y enviar la variable "sql"
                pstm = cn.prepareStatement(sql);
                // 4. Parámetros
                pstm.setString(1, bean.getTextoComentario());
                pstm.setString(2, bean.getFechaComentario());
                pstm.setInt(3, bean.getIdUsuario());
                pstm.setInt(4, bean.getIdVideo());
                // 5. Ejecutar "pstm"
                salida = pstm.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pstm != null) pstm.close();
                    if (cn != null) cn.close();
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
            return salida;
        }
        
        //esto es para editar solo la fecha y el comentario 
        @Override
        public int update(ComentarioVideo bean) {
            int salida = -1;
            Connection cn = null;
            PreparedStatement pstm = null;
            try {
                // 1. Obtener conexión
                cn = new MySqlConectar().getConnection();
                // 2. Sentencia SQL
                String sql = "UPDATE comentario_video SET textoComentario = ?, fechaComentario = ? WHERE idComentario = ?";
                // 3. Crear objeto "pstm" y enviar la variable "sql"
                pstm = cn.prepareStatement(sql);
                // 4. Parámetros
                pstm.setString(1, bean.getTextoComentario());
                pstm.setString(2, bean.getFechaComentario());
                pstm.setInt(3, bean.getIdComentario());
                // 5. Ejecutar "pstm"
                // si la sentencia UPDATE se ejecuta correctamente, el método executeUpdate retorna un valor mayor a 0
                salida = pstm.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pstm != null) pstm.close();
                    if (cn != null) cn.close();
                } catch (SQLException e2) {
                    e2.printStackTrace();
                }
            }
            return salida;
        }

        

        
       

    
}
