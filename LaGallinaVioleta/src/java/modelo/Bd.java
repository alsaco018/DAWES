/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

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
            String sentenciaSQL = "SELECT nombre FROM categorias";
            
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
}
