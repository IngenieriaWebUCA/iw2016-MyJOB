// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.myjob.domain;

import es.uca.iw.myjob.domain.Demandante;
import es.uca.iw.myjob.domain.OfertaTrabajo;
import es.uca.iw.myjob.domain.Perfil;
import es.uca.iw.myjob.domain.Usuario;
import es.uca.iw.myjob.reference.EstadoOferta;
import java.util.Date;

privileged aspect Demandante_Roo_JavaBean {
    
    public String Demandante.getDni() {
        return this.dni;
    }
    
    public void Demandante.setDni(String dni) {
        this.dni = dni;
    }
    
    public String Demandante.getNombre() {
        return this.nombre;
    }
    
    public void Demandante.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public Date Demandante.getFecha_nacimiento() {
        return this.fecha_nacimiento;
    }
    
    public void Demandante.setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }
    
    public String Demandante.getSexo() {
        return this.sexo;
    }
    
    public void Demandante.setSexo(String sexo) {
        this.sexo = sexo;
    }
    
    public String Demandante.getDir_actual() {
        return this.dir_actual;
    }
    
    public void Demandante.setDir_actual(String dir_actual) {
        this.dir_actual = dir_actual;
    }
    
    public String Demandante.getEmail() {
        return this.email;
    }
    
    public void Demandante.setEmail(String email) {
        this.email = email;
    }
    
    public String Demandante.getTelefono() {
        return this.telefono;
    }
    
    public void Demandante.setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    public String Demandante.getUsuario() {
        return this.usuario;
    }
    
    public void Demandante.setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
    public String Demandante.getPassword() {
        return this.password;
    }
    
    public void Demandante.setPassword(String password) {
        this.password = password;
    }
    
    public EstadoOferta Demandante.getEstado() {
        return this.estado;
    }
    
    public void Demandante.setEstado(EstadoOferta estado) {
        this.estado = estado;
    }
    
    public OfertaTrabajo Demandante.getOfertademandante() {
        return this.ofertademandante;
    }
    
    public void Demandante.setOfertademandante(OfertaTrabajo ofertademandante) {
        this.ofertademandante = ofertademandante;
    }
    
    public Perfil Demandante.getPerfil() {
        return this.perfil;
    }
    
    public void Demandante.setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }
    
    public Usuario Demandante.getUsuariod() {
        return this.usuariod;
    }
    
    public void Demandante.setUsuariod(Usuario usuariod) {
        this.usuariod = usuariod;
    }
    
}
