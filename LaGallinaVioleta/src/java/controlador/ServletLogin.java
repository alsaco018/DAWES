/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Bd;
import static modelo.Bd.crearConexion;
import modelo.Usuario;

/**
 *
 * @author alber
 */
public class ServletLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ServletLogin</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ServletLogin at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("nick");
        String clave = request.getParameter("pass0");
        
        if(usuario.trim().equalsIgnoreCase("") || clave.trim().equalsIgnoreCase("")){
            request.getRequestDispatcher("/errorLogin.jsp").forward(request, response);// si se encuentra en la bd mandamos un mensaje de error y volvemos a introducir los datos
        }else{
            modelo.Usuario user = validaUsuario(usuario, clave);
            if(user != null){
                HttpSession sesion = request.getSession();
                sesion.setMaxInactiveInterval(500);
                sesion.setAttribute("nick", usuario);
                sesion.setAttribute("perfil", user.getPerfil());
                sesion.setAttribute("nombre", user.getNombre());
                sesion.setAttribute("apellidos", user.getApellidos());
                sesion.setAttribute("direccion", user.getDireccion());
                sesion.setAttribute("clave", clave);
                sesion.setAttribute("idCliente", user.getId());

                request.getRequestDispatcher("/index.jsp").forward(request, response); //si se encuentra en la bd pasamos al portal de entrada
            }else{
                request.getRequestDispatcher("/errorLogin.jsp").forward(request, response);// si se encuentra en la bd mandamos un mensaje de error y volvemos a introducir los datos
            }
        }
            
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
    public static Usuario validaUsuario(String nombre, String pass){
         
        Usuario usuario;
        nombre = nombre.toLowerCase();
        Connection con = null;
         
        try {
            con = Bd.crearConexion();
            //Ejecucion de la sentencia SQL y obtencion de resultados en un objeto ResultSet
            
            //Obtencion de un objeto Statement para ejecutar sentencias SQL
            String sentenciaSQL = "SELECT * FROM usuarios";
            
            Statement stmt = (Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery(sentenciaSQL);
            //Muestra de resultados mediante un bucle que recorre los registros que verifican la sentencia
            
            while(rs.next()){
                usuario = new Usuario(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                
                if(usuario.getNick().toLowerCase().equals(nombre) && usuario.getClave().equals(pass)){//comprobamos que el usuario y contraseña existen en la base de datos
                    
                    return usuario;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
        }
            
       return null; 
    }
    
}
