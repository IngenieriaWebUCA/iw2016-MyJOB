// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.myjob.domain;

import es.uca.iw.myjob.domain.Empresa;
import es.uca.iw.myjob.domain.Inscripcion;
import es.uca.iw.myjob.domain.OfertaTrabajo;
import es.uca.iw.myjob.reference.EstadoEmpleo;
import java.util.Date;
import java.util.Set;

privileged aspect OfertaTrabajo_Roo_JavaBean {
    
    public String OfertaTrabajo.getNombre() {
        return this.nombre;
    }
    
    public void OfertaTrabajo.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String OfertaTrabajo.getDescripcion() {
        return this.descripcion;
    }
    
    public void OfertaTrabajo.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public String OfertaTrabajo.getTipologia_contrato() {
        return this.tipologia_contrato;
    }
    
    public void OfertaTrabajo.setTipologia_contrato(String tipologia_contrato) {
        this.tipologia_contrato = tipologia_contrato;
    }
    
    public Float OfertaTrabajo.getSueldo_bruto() {
        return this.sueldo_bruto;
    }
    
    public void OfertaTrabajo.setSueldo_bruto(Float sueldo_bruto) {
        this.sueldo_bruto = sueldo_bruto;
    }
    
    public Date OfertaTrabajo.getFecha_aprox_inic() {
        return this.fecha_aprox_inic;
    }
    
    public void OfertaTrabajo.setFecha_aprox_inic(Date fecha_aprox_inic) {
        this.fecha_aprox_inic = fecha_aprox_inic;
    }
    
    public String OfertaTrabajo.getNum_vacantes() {
        return this.num_vacantes;
    }
    
    public void OfertaTrabajo.setNum_vacantes(String num_vacantes) {
        this.num_vacantes = num_vacantes;
    }
    
    public String OfertaTrabajo.getPerfil() {
        return this.perfil;
    }
    
    public void OfertaTrabajo.setPerfil(String perfil) {
        this.perfil = perfil;
    }
    
    public String OfertaTrabajo.getFormacion() {
        return this.formacion;
    }
    
    public void OfertaTrabajo.setFormacion(String formacion) {
        this.formacion = formacion;
    }
    
    public String OfertaTrabajo.getExperiencia_previa() {
        return this.experiencia_previa;
    }
    
    public void OfertaTrabajo.setExperiencia_previa(String experiencia_previa) {
        this.experiencia_previa = experiencia_previa;
    }
    
    public EstadoEmpleo OfertaTrabajo.getEstado_empleo() {
        return this.estado_empleo;
    }
    
    public void OfertaTrabajo.setEstado_empleo(EstadoEmpleo estado_empleo) {
        this.estado_empleo = estado_empleo;
    }
    
    public Set<Empresa> OfertaTrabajo.getId_oferta_empresa() {
        return this.id_oferta_empresa;
    }
    
    public void OfertaTrabajo.setId_oferta_empresa(Set<Empresa> id_oferta_empresa) {
        this.id_oferta_empresa = id_oferta_empresa;
    }
    
    public Set<Inscripcion> OfertaTrabajo.getInscripciones() {
        return this.inscripciones;
    }
    
    public void OfertaTrabajo.setInscripciones(Set<Inscripcion> inscripciones) {
        this.inscripciones = inscripciones;
    }
    
}
