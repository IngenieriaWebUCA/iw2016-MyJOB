package es.uca.iw.myjob.web;

import es.uca.iw.myjob.domain.Demandante;
import es.uca.iw.myjob.domain.Empresa;
import es.uca.iw.myjob.domain.Usuario;

import org.springframework.context.i18n.LocaleContextHolder;
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
import org.joda.time.format.DateTimeFormat;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Calendar;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.codec.binary.Hex;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;
import es.uca.iw.myjob.domain.UsuarioBatchService;
import es.uca.iw.myjob.reference.Rol;

import org.gvnix.addon.web.mvc.annotations.batch.GvNIXWebJpaBatch;

@RequestMapping("/usuarios")
@Controller
@RooWebScaffold(path = "usuarios", formBackingObject = Usuario.class)
@GvNIXWebJQuery
@GvNIXDatatables(ajax = true)
@GvNIXWebJpaBatch(service = UsuarioBatchService.class)
public class UsuarioController {

	/*private String sha256(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(password.getBytes());
		byte[] digest = md.digest();
		return new String(Hex.encodeHexString(digest));
	}*/

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid Usuario usuario, BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		uiModel.asMap().clear();
		uiModel.addAttribute("rols", Arrays.asList(Rol.values()));
		usuario.setEnabled("1");
		usuario.setFecha_registro(Calendar.getInstance().getTime());
		usuario.persist();
		return "redirect:/login";
	}

	void populateEditForm(Model uiModel, Usuario usuario) {
		uiModel.addAttribute("usuario", usuario);
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("demandantes", Demandante.findAllDemandantes());
		uiModel.addAttribute("empresas", Empresa.findAllEmpresas());
		uiModel.addAttribute("rols", Arrays.asList(Rol.values()));
	}

	void addDateTimeFormatPatterns(Model uiModel) {
		uiModel.addAttribute("usuario_fecha_registro_date_format",
				DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
	}
}
