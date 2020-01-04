/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;

/**
 *
 * @author alber
 */
public class Pedido {

private int idPedido, idCliente;
String direccion;
Date fecha;
    public Pedido(int idPedido, int idCliente, String direccion, Date fecha) {
        this.idPedido = idPedido;
        this.idCliente = idCliente;
        this.direccion = direccion;
        this.fecha = fecha;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public String getDireccion() {
        return direccion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }


}
