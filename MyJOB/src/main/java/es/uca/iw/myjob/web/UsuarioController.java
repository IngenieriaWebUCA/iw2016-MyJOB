package es.uca.iw.myjob.web;
import es.uca.iw.myjob.domain.Demandante;
import es.uca.iw.myjob.domain.Usuario;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.gvnix.addon.datatables.annotations.GvNIXDatatables;

@RequestMapping("/usuarios")
@Controller
@RooWebScaffold(path = "usuarios", formBackingObject = Usuario.class)
@GvNIXWebJQuery
@GvNIXDatatables(ajax = true)
public class UsuarioController {
	
	/*@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid Usuario usuario, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, usuario);
            return "usuarios/create";
        }
		 uiModel.addAttribute("email", usuario.getEmail());
         uiModel.addAttribute("enabled", 1);
         uiModel.addAttribute("fecha_registro", usuario.getFecha_registro());
         uiModel.addAttribute("password", usuario.getPassword());
         uiModel.addAttribute("rol", usuario.getRol().ordinal());
         uiModel.addAttribute("tipo_usuario", usuario.getTipoUsuario().ordinal());
         uiModel.addAttribute("username", usuario.getUsername());
         
         usuario.persist();
         if (usuario.getRol().equals(usuario.getRol().ROL_DEMANDANTE)){
        	 return "demandantes/create";
         }
         if (usuario.getRol().equals(usuario.getRol().ROL_EMPRESA)){
        	 return "empresas/create";
         }
         //uiModel.addAttribute("tarjetaCredito", factura.getTarjetaCredito());
		//System.out.println("Esto es una prueba");
		return "usuarios/show";
         
	}*/
}
