package es.uca.iw.myjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Direccion {

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String nombre;

    /**
     */
    @NotNull
    private String num;

    /**
     */
    @NotNull
    private String cp;

    /**
     */
    @NotNull
    private String pais;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "direccion")
    private Set<Empresa> id_direccion = new HashSet<Empresa>();
}
