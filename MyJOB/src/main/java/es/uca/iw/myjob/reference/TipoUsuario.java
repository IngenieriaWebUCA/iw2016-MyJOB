package es.uca.iw.myjob.reference;
import javax.persistence.Enumerated;
import javax.validation.constraints.NotNull;

public enum TipoUsuario {

    Empresa, Demandante;

    /**
     */
    @NotNull
    @Enumerated
    private TipoUsuario tipoUsuario;
}
