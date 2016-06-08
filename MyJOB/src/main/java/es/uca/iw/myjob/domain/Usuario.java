package es.uca.iw.myjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.mysql.jdbc.PreparedStatement;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import java.sql.ResultSet;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;
import javax.validation.constraints.Past;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.EntityManager;
import javax.persistence.OneToMany;
import javax.persistence.Query;
import javax.persistence.ManyToOne;
import javax.persistence.Enumerated;
import es.uca.iw.myjob.reference.Rol;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Usuario {

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String username;

    /**
     */
    @NotNull
    @Size(min = 5, max = 30)
    private String password;

    /**
     */
    @NotNull
    @Past
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fecha_registro;

    /**
     */
    @Size(min = 6, max = 30)
    private String email;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usuario")
    private Set<Empresa> id_usuario = new HashSet<Empresa>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usuariod")
    private Set<Demandante> id_demandante = new HashSet<Demandante>();

    /**
     */
    @Size(max = 3)
    private String enabled;

    /**
     */
    @NotNull
    @Enumerated
    private Rol rol;
    
    public static Usuario buscarUsuarioNombre(String username) {
        if (username == null || username.length() == 0) throw new IllegalArgumentException("The username argument is required");
        EntityManager em = Usuario.entityManager();
        TypedQuery<Usuario> q = em.createQuery("SELECT o FROM Usuario AS o WHERE o.username = :username", Usuario.class);
        q.setParameter("username", username);
        Usuario usuario = q.getSingleResult();
        return usuario;
    }
}
