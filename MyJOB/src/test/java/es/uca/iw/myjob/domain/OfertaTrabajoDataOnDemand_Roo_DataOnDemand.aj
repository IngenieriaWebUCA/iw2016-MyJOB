// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.myjob.domain;

import es.uca.iw.myjob.domain.OfertaTrabajo;
import es.uca.iw.myjob.domain.OfertaTrabajoDataOnDemand;
import es.uca.iw.myjob.reference.EstadoEmpleo;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect OfertaTrabajoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OfertaTrabajoDataOnDemand: @Component;
    
    private Random OfertaTrabajoDataOnDemand.rnd = new SecureRandom();
    
    private List<OfertaTrabajo> OfertaTrabajoDataOnDemand.data;
    
    public OfertaTrabajo OfertaTrabajoDataOnDemand.getNewTransientOfertaTrabajo(int index) {
        OfertaTrabajo obj = new OfertaTrabajo();
        setEstado_empleo(obj, index);
        setExperiencia_previa(obj, index);
        setFecha_aprox_inic(obj, index);
        setFormacion(obj, index);
        setNum_vacantes(obj, index);
        setPerfil(obj, index);
        setSueldo_bruto(obj, index);
        setTipologia_contrato(obj, index);
        return obj;
    }
    
    public void OfertaTrabajoDataOnDemand.setEstado_empleo(OfertaTrabajo obj, int index) {
        EstadoEmpleo estado_empleo = EstadoEmpleo.class.getEnumConstants()[0];
        obj.setEstado_empleo(estado_empleo);
    }
    
    public void OfertaTrabajoDataOnDemand.setExperiencia_previa(OfertaTrabajo obj, int index) {
        String experiencia_previa = "experiencia_previa_" + index;
        obj.setExperiencia_previa(experiencia_previa);
    }
    
    public void OfertaTrabajoDataOnDemand.setFecha_aprox_inic(OfertaTrabajo obj, int index) {
        Date fecha_aprox_inic = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFecha_aprox_inic(fecha_aprox_inic);
    }
    
    public void OfertaTrabajoDataOnDemand.setFormacion(OfertaTrabajo obj, int index) {
        String formacion = "formacion_" + index;
        if (formacion.length() > 30) {
            formacion = formacion.substring(0, 30);
        }
        obj.setFormacion(formacion);
    }
    
    public void OfertaTrabajoDataOnDemand.setNum_vacantes(OfertaTrabajo obj, int index) {
        String num_vacantes = "num_vacantes_" + index;
        obj.setNum_vacantes(num_vacantes);
    }
    
    public void OfertaTrabajoDataOnDemand.setPerfil(OfertaTrabajo obj, int index) {
        String perfil = "perfil_" + index;
        if (perfil.length() > 255) {
            perfil = perfil.substring(0, 255);
        }
        obj.setPerfil(perfil);
    }
    
    public void OfertaTrabajoDataOnDemand.setSueldo_bruto(OfertaTrabajo obj, int index) {
        Float sueldo_bruto = new Integer(index).floatValue();
        obj.setSueldo_bruto(sueldo_bruto);
    }
    
    public void OfertaTrabajoDataOnDemand.setTipologia_contrato(OfertaTrabajo obj, int index) {
        String tipologia_contrato = "tipologia_contrato_" + index;
        if (tipologia_contrato.length() > 30) {
            tipologia_contrato = tipologia_contrato.substring(0, 30);
        }
        obj.setTipologia_contrato(tipologia_contrato);
    }
    
    public OfertaTrabajo OfertaTrabajoDataOnDemand.getSpecificOfertaTrabajo(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        OfertaTrabajo obj = data.get(index);
        Long id = obj.getId();
        return OfertaTrabajo.findOfertaTrabajo(id);
    }
    
    public OfertaTrabajo OfertaTrabajoDataOnDemand.getRandomOfertaTrabajo() {
        init();
        OfertaTrabajo obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return OfertaTrabajo.findOfertaTrabajo(id);
    }
    
    public boolean OfertaTrabajoDataOnDemand.modifyOfertaTrabajo(OfertaTrabajo obj) {
        return false;
    }
    
    public void OfertaTrabajoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = OfertaTrabajo.findOfertaTrabajoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'OfertaTrabajo' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<OfertaTrabajo>();
        for (int i = 0; i < 10; i++) {
            OfertaTrabajo obj = getNewTransientOfertaTrabajo(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
