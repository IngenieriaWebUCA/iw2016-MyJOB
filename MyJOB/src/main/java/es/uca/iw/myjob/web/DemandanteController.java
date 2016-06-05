package es.uca.iw.myjob.web;
import es.uca.iw.myjob.domain.Demandante;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Calendar;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.hibernate.validator.constraints.Email;
import org.joda.time.format.DateTimeFormat;

import es.uca.iw.myjob.domain.DemandanteBatchService;
import es.uca.iw.myjob.domain.OfertaTrabajo;
import es.uca.iw.myjob.domain.Perfil;
import es.uca.iw.myjob.domain.Usuario;
import es.uca.iw.myjob.reference.EstadoOferta;
import es.uca.iw.myjob.reference.Rol;

import org.gvnix.addon.web.mvc.annotations.batch.GvNIXWebJpaBatch;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;

@RequestMapping("/demandantes")
@Controller
@RooWebScaffold(path = "demandantes", formBackingObject = Demandante.class)
@GvNIXWebJQuery
@GvNIXWebJpaBatch(service = DemandanteBatchService.class)
@GvNIXDatatables(ajax = true)
public class DemandanteController {
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Demandante demandante, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, demandante);
            return "demandantes/create";
        }
        uiModel.asMap().clear();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        
        String name = auth.getName();
        uiModel.addAttribute("Usuariod", name);
        
        demandante.persist();
        return "redirect:/demandantes/" + encodeUrlPathSegment(demandante.getId().toString(), httpServletRequest);
    }
	
	 @RequestMapping(params = "form", produces = "text/html")
	    public String createForm(Model uiModel) {
	        populateEditForm(uiModel, new Demandante());
	        return "demandantes/create";
	    }
	    
	    @RequestMapping(value = "/{id}", produces = "text/html")
	    public String show(@PathVariable("id") Long id, Model uiModel) {
	        addDateTimeFormatPatterns(uiModel);
	        uiModel.addAttribute("demandante", Demandante.findDemandante(id));
	        uiModel.addAttribute("itemId", id);
	        return "demandantes/show";
	    }
	    
	    @RequestMapping(produces = "text/html")
	    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
	        if (page != null || size != null) {
	            int sizeNo = size == null ? 10 : size.intValue();
	            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
	            uiModel.addAttribute("demandantes", Demandante.findDemandanteEntries(firstResult, sizeNo, sortFieldName, sortOrder));
	            float nrOfPages = (float) Demandante.countDemandantes() / sizeNo;
	            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
	        } else {
	            uiModel.addAttribute("demandantes", Demandante.findAllDemandantes(sortFieldName, sortOrder));
	        }
	        addDateTimeFormatPatterns(uiModel);
	        return "demandantes/list";
	    }
	    
	    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
	    public String update(@Valid Demandante demandante, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
	        if (bindingResult.hasErrors()) {
	            populateEditForm(uiModel, demandante);
	            return "demandantes/update";
	        }
	        uiModel.asMap().clear();
	        demandante.merge();
	        return "redirect:/demandantes/" + encodeUrlPathSegment(demandante.getId().toString(), httpServletRequest);
	    }
	    
	    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
	    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
	        populateEditForm(uiModel, Demandante.findDemandante(id));
	        return "demandantes/update";
	    }
	    
	    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
	    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
	        Demandante demandante = Demandante.findDemandante(id);
	        demandante.remove();
	        uiModel.asMap().clear();
	        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
	        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
	        return "redirect:/demandantes";
	    }
	
	void populateEditForm(Model uiModel, Demandante demandante) {
        uiModel.addAttribute("demandante", demandante);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ofertatrabajoes", OfertaTrabajo.findAllOfertaTrabajoes());
        uiModel.addAttribute("perfils", Perfil.findAllPerfils());
        uiModel.addAttribute("usuarios", Usuario.findAllUsuarios());
        uiModel.addAttribute("estadoofertas", Arrays.asList(EstadoOferta.values()));
    }
	
	 void addDateTimeFormatPatterns(Model uiModel) {
	        uiModel.addAttribute("demandante_fecha_nacimiento_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
	  }
	
	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
	
}
