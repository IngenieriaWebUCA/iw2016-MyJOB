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
    private String tipologiacontrato;

    /**
     */
    @NotNull
    @Min(0L)
    private Float sueldobruto;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fechaaproxinic;

    /**
     */
    @NotNull
    private String numvacantes;

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
    private String experienciaprevia;

    /**
     */
    @Enumerated
    private EstadoEmpleo estadoempleo;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "oferta")
    private Set<Empresa> idofertaempresa = new HashSet<Empresa>();

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "ofertademandante")
    private Set<Demandante> idofertademandante = new HashSet<Demandante>();
}
