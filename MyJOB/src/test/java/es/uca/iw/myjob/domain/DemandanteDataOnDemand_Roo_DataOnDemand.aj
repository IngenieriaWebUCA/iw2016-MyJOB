// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.myjob.domain;

import es.uca.iw.myjob.domain.Demandante;
import es.uca.iw.myjob.domain.DemandanteDataOnDemand;
import es.uca.iw.myjob.domain.PerfilDataOnDemand;
import es.uca.iw.myjob.domain.UsuarioDataOnDemand;
import es.uca.iw.myjob.reference.EstadoOferta;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect DemandanteDataOnDemand_Roo_DataOnDemand {
    
    declare @type: DemandanteDataOnDemand: @Component;
    
    private Random DemandanteDataOnDemand.rnd = new SecureRandom();
    
    private List<Demandante> DemandanteDataOnDemand.data;
    
    @Autowired
    PerfilDataOnDemand DemandanteDataOnDemand.perfilDataOnDemand;
    
    @Autowired
    UsuarioDataOnDemand DemandanteDataOnDemand.usuarioDataOnDemand;
    
    public Demandante DemandanteDataOnDemand.getNewTransientDemandante(int index) {
        Demandante obj = new Demandante();
        setDir_actual(obj, index);
        setDni(obj, index);
        setEmail(obj, index);
        setEstado(obj, index);
        setFecha_nacimiento(obj, index);
        setNombre(obj, index);
        setSexo(obj, index);
        setTelefono(obj, index);
        return obj;
    }
    
    public void DemandanteDataOnDemand.setDir_actual(Demandante obj, int index) {
        String dir_actual = "dir_actual_" + index;
        obj.setDir_actual(dir_actual);
    }
    
    public void DemandanteDataOnDemand.setDni(Demandante obj, int index) {
        String dni = "dni_" + index;
        if (dni.length() > 30) {
            dni = dni.substring(0, 30);
        }
        obj.setDni(dni);
    }
    
    public void DemandanteDataOnDemand.setEmail(Demandante obj, int index) {
        String email = "foo" + index + "@bar.com";
        if (email.length() > 30) {
            email = email.substring(0, 30);
        }
        obj.setEmail(email);
    }
    
    public void DemandanteDataOnDemand.setEstado(Demandante obj, int index) {
        EstadoOferta estado = EstadoOferta.class.getEnumConstants()[0];
        obj.setEstado(estado);
    }
    
    public void DemandanteDataOnDemand.setFecha_nacimiento(Demandante obj, int index) {
        Date fecha_nacimiento = new Date(new Date().getTime() - 10000000L);
        obj.setFecha_nacimiento(fecha_nacimiento);
    }
    
    public void DemandanteDataOnDemand.setNombre(Demandante obj, int index) {
        String nombre = "nombre_" + index;
        if (nombre.length() > 30) {
            nombre = nombre.substring(0, 30);
        }
        obj.setNombre(nombre);
    }
    
    public void DemandanteDataOnDemand.setSexo(Demandante obj, int index) {
        String sexo = "sexo_" + index;
        obj.setSexo(sexo);
    }
    
    public void DemandanteDataOnDemand.setTelefono(Demandante obj, int index) {
        String telefono = "telefono_" + index;
        obj.setTelefono(telefono);
    }
    
    public Demandante DemandanteDataOnDemand.getSpecificDemandante(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Demandante obj = data.get(index);
        Long id = obj.getId();
        return Demandante.findDemandante(id);
    }
    
    public Demandante DemandanteDataOnDemand.getRandomDemandante() {
        init();
        Demandante obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Demandante.findDemandante(id);
    }
    
    public boolean DemandanteDataOnDemand.modifyDemandante(Demandante obj) {
        return false;
    }
    
    public void DemandanteDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Demandante.findDemandanteEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Demandante' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Demandante>();
        for (int i = 0; i < 10; i++) {
            Demandante obj = getNewTransientDemandante(i);
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
