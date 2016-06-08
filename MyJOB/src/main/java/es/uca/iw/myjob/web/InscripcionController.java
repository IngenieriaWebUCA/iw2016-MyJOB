package es.uca.iw.myjob.web;
import es.uca.iw.myjob.domain.Demandante;
import es.uca.iw.myjob.domain.Inscripcion;
import es.uca.iw.myjob.domain.OfertaTrabajo;
import es.uca.iw.myjob.domain.Usuario;
import es.uca.iw.myjob.reference.EstadoOferta;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/inscripcions")
@Controller
@RooWebScaffold(path = "inscripcions", formBackingObject = Inscripcion.class)
public class InscripcionController {
	
	 @RequestMapping(value = "/inscribirse")
	    public String inscribirse(@RequestParam("oferta_id") Long id, @RequestParam("usuario_nombre") String username,Model uiModel) throws ParseException {
			Usuario usuario = Usuario.buscarUsuarioNombre(username);
			Inscripcion inscripcion = new Inscripcion();
			if(Demandante.findDemandante(usuario.getId()) != null){
				inscripcion.setInscripcion(Demandante.findDemandante(usuario.getId()));
		        inscripcion.setEstado(EstadoOferta.recibida);
		        inscripcion.setOferta(OfertaTrabajo.findOfertaTrabajo(id));
		
		        List<Inscripcion> lista = Inscripcion.findAllInscripcions();
				if(!(lista.contains(inscripcion))){
					inscripcion.persist();
				}
			}
	    	return "inscripcions/create";
	    }
}
