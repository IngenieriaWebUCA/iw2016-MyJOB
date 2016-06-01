package es.uca.iw.myjob.web;
import es.uca.iw.myjob.domain.Demandante;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.hibernate.validator.constraints.Email;

@RequestMapping("/demandantes")
@Controller
@RooWebScaffold(path = "demandantes", formBackingObject = Demandante.class)
@GvNIXWebJQuery
public class DemandanteController {
	 
	/*@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid Demandante demandante, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, demandante);
            return "demandantes/create";
        }
		 uiModel.addAttribute("dni", demandante.getDni());
         uiModel.addAttribute("nombre", demandante.getNombre());
         uiModel.addAttribute("fecha_nacimiento", demandante.getFecha_nacimiento());
         uiModel.addAttribute("sexo", demandante.getSexo());
         uiModel.addAttribute("dir_actual", demandante.getDir_actual());
         uiModel.addAttribute("email", demandante.getEmail());
         uiModel.addAttribute("telefono", demandante.getTelefono());
         uiModel.addAttribute("estado", demandante.getEstado());
         //uiModel.addAttribute("myButtonCheckout", true);
         Authentication auth = SecurityContextHolder.getContext().getAuthentication();
         uiModel.addAttribute("usuariod", auth.getName());
         
         demandante.persist();
         //uiModel.addAttribute("tarjetaCredito", factura.getTarjetaCredito());
         return "demandantes/show";
		//System.out.println("Esto es una prueba");
	}*/
}
