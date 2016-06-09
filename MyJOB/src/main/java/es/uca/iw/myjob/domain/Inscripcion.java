package es.uca.iw.myjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import es.uca.iw.myjob.reference.EstadoOferta;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Inscripcion {

    /**
     */
    @Enumerated
    private EstadoOferta estado;

    /**
     */
    @ManyToOne
    private Demandante inscripcion;

    /**
     */
    @ManyToOne
    private OfertaTrabajo oferta;
    
    public static List<Inscripcion> findAllInscripcionsByDni(Long id) {
        return entityManager().createQuery("SELECT i FROM Inscripcion AS i, OfertaTrabajo AS o WHERE(i.oferta.id=o.id) and o.inscripcion.id LIKE ('" + id + "')", Inscripcion.class).getResultList();
    }

}
