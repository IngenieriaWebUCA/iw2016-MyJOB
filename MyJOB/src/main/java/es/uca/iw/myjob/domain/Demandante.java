package es.uca.iw.myjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Past;
import org.springframework.format.annotation.DateTimeFormat;
import es.uca.iw.myjob.reference.EstadoOferta;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Demandante {

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String dni;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String nombre;

    /**
     */
    @NotNull
    @Past
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fecha_nacimiento;

    /**
     */
    @NotNull
    private String sexo;

    /**
     */
    @NotNull
    private String dir_actual;

    /**
     */
    @NotNull
    @Size(min = 6, max = 30)
    private String email;

    /**
     */
    @NotNull
    private String telefono;

    /**
     */
    @Enumerated
    private EstadoOferta estado;

    /**
     */
    @ManyToOne
    private Perfil perfil;

    /**
     */
    @OneToOne
    private Usuario usuariod;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "inscripcion")
    private Set<Inscripcion> id_inscripcion = new HashSet<Inscripcion>();
}
