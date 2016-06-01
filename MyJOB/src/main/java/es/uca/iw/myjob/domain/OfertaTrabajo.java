package es.uca.iw.myjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Min;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import es.uca.iw.myjob.reference.EstadoEmpleo;
import javax.persistence.Enumerated;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.ManyToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findOfertaTrabajoesByFormacionLike", "findOfertaTrabajoesByNombreLike" })
public class OfertaTrabajo {

    /**
     */
    @Size(min = 3, max = 30)
    private String nombre;

    /**
     */
    @Size(max = 255)
    private String descripcion;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String tipologia_contrato;

    /**
     */
    @NotNull
    @Min(0L)
    private Float sueldo_bruto;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fecha_aprox_inic;

    /**
     */
    @NotNull
    private String num_vacantes;

    /**
     */
    @NotNull
    @Size(max = 255)
    private String perfil;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String formacion;

    /**
     */
    @NotNull
    private String experiencia_previa;

    /**
     */
    @Enumerated
    private EstadoEmpleo estado_empleo;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "oferta")
    private Set<Empresa> id_oferta_empresa = new HashSet<Empresa>();

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "ofertademandante")
    private Set<Demandante> id_oferta_demandante = new HashSet<Demandante>();
}
