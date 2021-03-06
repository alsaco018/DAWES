/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alber
 */
public class Bd {
     public static String usuario = "root";
    public static String pass = "";
    public static String servidor = "localhost:3306";
    public static String bd = "gallinavioleta";
    
    public static Connection crearConexion(){
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://"+servidor+"/"+bd;
            con = DriverManager.getConnection(url, usuario, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
    
    public static void actualiza(String sql){
        Connection con = null;
        con = crearConexion();
        Statement stmt;
        try {
            stmt = (Statement) con.createStatement();
            stmt.executeUpdate(sql);
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static String consultaCategoria(int cat){
       
        Connection con = null;
         String res = "";
        try {
            con = crearConexion();
            //Ejecucion de la sentencia SQL y obtencion de resultados en un objeto ResultSet
            
            //Obtencion de un objeto Statement para ejecutar sentencias SQL
            String sentenciaSQL = "SELECT nombre FROM categorias where id_categoria = "+cat;
            
            Statement stmt = (Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery(sentenciaSQL);
            //Muestra de resultados mediante un bucle que recorre los registros que verifican la sentencia
            
            while(rs.next()){
                res = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
        }
            
       return res; 
    }
    
    public static String consultaProducto(int prod){
       
        Connection con = null;
         String res = "";
        try {
            con = crearConexion();
            //Ejecucion de la sentencia SQL y obtencion de resultados en un objeto ResultSet
            
            //Obtencion de un objeto Statement para ejecutar sentencias SQL
            String sentenciaSQL = "SELECT nombre FROM productos where id_producto = "+prod;
            
            Statement stmt = (Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery(sentenciaSQL);
            //Muestra de resultados mediante un bucle que recorre los registros que verifican la sentencia
            
            while(rs.next()){
                res = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
        }
            
       return res; 
    }
    
     public static ArrayList<Producto> consultaProductos(){
        ArrayList<Producto> lista = new ArrayList<Producto>();
        Producto producto;
        Connection con = null;
         
        try {
            con = crearConexion();
            //Ejecucion de la sentencia SQL y obtencion de resultados en un objeto ResultSet
            
            //Obtencion de un objeto Statement para ejecutar sentencias SQL
            String sentenciaSQL = "SELECT * FROM productos";
            
            Statement stmt = (Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery(sentenciaSQL);
            //Muestra de resultados mediante un bucle que recorre los registros que verifican la sentencia
            
            while(rs.next()){
                producto = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getInt(4), rs.getString(5), rs.getDouble(6));
                lista.add(producto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
        }
            
       return lista; 
    }
    
    
    public static ArrayList<Usuario> consultaUsuarios(){
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        Usuario usuario;
        Connection con = null;
         
        try {
            con = crearConexion();
            //Ejecucion de la sentencia SQL y obtencion de resultados en un objeto ResultSet
            
            //Obtencion de un objeto Statement para ejecutar sentencias SQL
            String sentenciaSQL = "SELECT * FROM usuarios";
            
            Statement stmt = (Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery(sentenciaSQL);
            //Muestra de resultados mediante un bucle que recorre los registros que verifican la sentencia
            
            while(rs.next()){
                usuario = new Usuario(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                lista.add(usuario);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
        }
            
       return lista; 
    }
    
    
    public static ArrayList<LineaPedido> consultaLineaPedidos(int idPedido){
        ArrayList<LineaPedido> lista = new ArrayList<LineaPedido>();
        LineaPedido lineaPedido;
        Connection con = null;
        
        try {
            con = crearConexion();
            //Ejecucion de la sentencia SQL y obtencion de resultados en un objeto ResultSet
            
            //Obtencion de un objeto Statement para ejecutar sentencias SQL
            String sentenciaSQL = "SELECT * FROM lineapedidos WHERE id_pedido = "+idPedido+"";
            
            Statement stmt = (Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery(sentenciaSQL);
            //Muestra de resultados mediante un bucle que recorre los registros que verifican la sentencia
            
            while(rs.next()){
                lineaPedido = new LineaPedido(rs.getInt(2), rs.getDouble(3),rs.getInt(4));
                lista.add(lineaPedido);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
        }
            
       return lista; 
    }
    
//    public static void borraCarrito(){
//        String delete = "DELETE FROM `lineapedidos`";
//        actualiza(delete);
//    }
    
    public static int obtenerIdPedido(){
       Connection con = null; 
       int res = 0;
       try {
            con = crearConexion();
            //Ejecucion de la sentencia SQL y obtencion de resultados en un objeto ResultSet
            
            //Obtencion de un objeto Statement para ejecutar sentencias SQL
            String sentenciaSQL = "SELECT `id_pedido` FROM `pedidos` order by `id_pedido` desc limit 1 ";
            
            Statement stmt = (Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery(sentenciaSQL);
            //Muestra de resultados mediante un bucle que recorre los registros que verifican la sentencia
            
            while(rs.next()){
                res = rs.getInt(1);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
        }
       return res;
    } 
    
    public static ArrayList<Pedido> consultaPedidos(int id){
        ArrayList<Pedido> lista = new ArrayList<Pedido>();
        Pedido pedido;
        Connection con = null;
         
        try {
            con = crearConexion();
            //Ejecucion de la sentencia SQL y obtencion de resultados en un objeto ResultSet
            
            //Obtencion de un objeto Statement para ejecutar sentencias SQL
            String sentenciaSQL = "SELECT * FROM pedidos where id_cliente = "+id;
            
            Statement stmt = (Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery(sentenciaSQL);
            //Muestra de resultados mediante un bucle que recorre los registros que verifican la sentencia
            
            while(rs.next()){
                pedido = new Pedido(rs.getInt(1), rs.getInt(2), rs.getString(3),rs.getDate(4));
                lista.add(pedido);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
        }
            
       return lista; 
    }
    
    public static ArrayList<Pedido> consultaPedidos(){
        ArrayList<Pedido> lista = new ArrayList<Pedido>();
        Pedido pedido;
        Connection con = null;
         
        try {
            con = crearConexion();
            //Ejecucion de la sentencia SQL y obtencion de resultados en un objeto ResultSet
            
            //Obtencion de un objeto Statement para ejecutar sentencias SQL
            String sentenciaSQL = "SELECT * FROM pedidos ";
            
            Statement stmt = (Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery(sentenciaSQL);
            //Muestra de resultados mediante un bucle que recorre los registros que verifican la sentencia
            
            while(rs.next()){
                pedido = new Pedido(rs.getInt(1), rs.getInt(2), rs.getString(3),rs.getDate(4));
                lista.add(pedido);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
        }
            
       return lista; 
    }

    public static List<Pedido> consultaPedidos(String fechaIni, String fechaFin) {
        ArrayList<Pedido> lista = new ArrayList<Pedido>();
        Pedido pedido;
        Connection con = null;
         
        try {
            con = crearConexion();
            //Ejecucion de la sentencia SQL y obtencion de resultados en un objeto ResultSet
            
            //Obtencion de un objeto Statement para ejecutar sentencias SQL
            String sentenciaSQL = "SELECT * FROM pedidos where fecha between '"+fechaIni+"' and '"+fechaFin+"'";
            
            Statement stmt = (Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery(sentenciaSQL);
            //Muestra de resultados mediante un bucle que recorre los registros que verifican la sentencia
            
            while(rs.next()){
                pedido = new Pedido(rs.getInt(1), rs.getInt(2), rs.getString(3),rs.getDate(4));
                lista.add(pedido);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
