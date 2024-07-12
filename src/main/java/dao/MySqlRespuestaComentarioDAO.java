/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entidad.RespuestaComentarios;
import interfaces.respuestaComentarioDAO;
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
public class MySqlRespuestaComentarioDAO implements respuestaComentarioDAO {
    
        @Override
        public List<RespuestaComentarios> findRespuestasByComentarioId(int idRespuesta) {
            List<RespuestaComentarios> lista = new ArrayList<RespuestaComentarios>();
            Connection cn = null;
            PreparedStatement pstm = null;
            ResultSet rs = null;
            try {
                cn = new MySqlConectar().getConnection();
                String sql = "SELECT * FROM respuesta_comentario WHERE idComentario = ?";
                pstm = cn.prepareStatement(sql);
                pstm.setInt(1, idRespuesta);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    RespuestaComentarios respuesta = new RespuestaComentarios();
                    respuesta.setIdRespuesta(rs.getInt("idRespuesta"));
                    respuesta.setTextoRespuesta(rs.getString("textoRespuesta"));
                    respuesta.setFechaRespuesta(rs.getString("fechaRespuesta"));
                    respuesta.setIdUsuario(rs.getInt("idUsuario"));
                    respuesta.setIdComentario(rs.getInt("idComentario"));
                    lista.add(respuesta);
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
        
        //para eliminar el comentario 
        @Override
        public int deleteRespuestaById(int idRespuesta) {
            int salida = -1;
            Connection cn = null;
            PreparedStatement pstm = null;
            try {
                // 1. Obtener conexión
                cn = new MySqlConectar().getConnection();
                // 2. Sentencia SQL
                String sql = "DELETE FROM respuesta_comentario WHERE idRespuesta = ?";
                // 3. Crear objeto "pstm" y enviar la variable "sql"
                pstm = cn.prepareStatement(sql);
                // 4. Parámetros
                pstm.setInt(1, idRespuesta);
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
        
        //para guardar el la respuesta de comentario
        @Override
        public int save(RespuestaComentarios bean) {
            int salida = -1;
            Connection cn = null;
            PreparedStatement pstm = null;
            try {
                // 1. Obtener conexión
                cn = new MySqlConectar().getConnection();
                // 2. Sentencia SQL
                String sql = "INSERT INTO respuesta_comentario (textoRespuesta, fechaRespuesta, idUsuario, idComentario) VALUES (?, ?, ?, ?)";
                // 3. Crear objeto "pstm" y enviar la variable "sql"
                pstm = cn.prepareStatement(sql);
                // 4. Parámetros
                pstm.setString(1, bean.getTextoRespuesta());
                pstm.setString(2, bean.getFechaRespuesta());
                pstm.setInt(3, bean.getIdUsuario());
                pstm.setInt(4, bean.getIdComentario());
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
        
        
        //para editar la respuesta comentario 
        @Override
        public int update(RespuestaComentarios bean) {
            int salida = -1;
            Connection cn = null;
            PreparedStatement pstm = null;
            try {
                // 1. Obtener conexión
                cn = new MySqlConectar().getConnection();
                // 2. Sentencia SQL
                String sql = "UPDATE respuesta_comentario SET textoRespuesta = ?, fechaRespuesta = ? WHERE idRespuesta = ?";
                // 3. Crear objeto "pstm" y enviar la variable "sql"
                pstm = cn.prepareStatement(sql);
                // 4. Parámetros
                pstm.setString(1, bean.getTextoRespuesta());
                pstm.setString(2, bean.getFechaRespuesta());
                pstm.setInt(3, bean.getIdRespuesta());
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
