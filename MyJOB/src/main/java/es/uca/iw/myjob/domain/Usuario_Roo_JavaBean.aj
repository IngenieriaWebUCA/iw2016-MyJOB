// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.myjob.domain;

import es.uca.iw.myjob.domain.Demandante;
import es.uca.iw.myjob.domain.Empresa;
import es.uca.iw.myjob.domain.Usuario;
import es.uca.iw.myjob.reference.Rol;
import java.util.Date;
import java.util.Set;

privileged aspect Usuario_Roo_JavaBean {
    
    public String Usuario.getUsername() {
        return this.username;
    }
    
    public void Usuario.setUsername(String username) {
        this.username = username;
    }
    
    public String Usuario.getPassword() {
        return this.password;
    }
    
    public void Usuario.setPassword(String password) {
        this.password = password;
    }
    
    public Date Usuario.getFecha_registro() {
        return this.fecha_registro;
    }
    
    public void Usuario.setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
    
    public String Usuario.getEmail() {
        return this.email;
    }
    
    public void Usuario.setEmail(String email) {
        this.email = email;
    }
    
    public Set<Empresa> Usuario.getId_usuario() {
        return this.id_usuario;
    }
    
    public void Usuario.setId_usuario(Set<Empresa> id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    public Set<Demandante> Usuario.getId_demandante() {
        return this.id_demandante;
    }
    
    public void Usuario.setId_demandante(Set<Demandante> id_demandante) {
        this.id_demandante = id_demandante;
    }
    
    public String Usuario.getEnabled() {
        return this.enabled;
    }
    
    public void Usuario.setEnabled(String enabled) {
        this.enabled = enabled;
    }
    
    public Rol Usuario.getRol() {
        return this.rol;
    }
    
    public void Usuario.setRol(Rol rol) {
        this.rol = rol;
    }
    
}
