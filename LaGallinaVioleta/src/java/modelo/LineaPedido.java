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
public class LineaPedido {
    private int producto, cantidad;
    private double precio;

    public LineaPedido(int producto, double precio, int cantidad) {
        this.producto = producto;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public int getProducto() {
        return producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setProducto(int producto) {
        this.producto = producto;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    
    
    
    
}
