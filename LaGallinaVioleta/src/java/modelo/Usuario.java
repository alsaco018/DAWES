/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author alber
 */
public class Usuario {
    private int id;
    private String nombre, apellidos, direccion, perfil, nick, clave;

    public Usuario(int id, String nombre, String apellidos, String direccion, String perfil, String nick, String clave) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.perfil = perfil;
        this.nick = nick;
        this.clave = clave;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getPerfil() {
        return perfil;
    }

    public String getNick() {
        return nick;
    }

    public String getClave() {
        return clave;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
    
    

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }
    
    
    
}
