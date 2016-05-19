// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.myjob.web;

import es.uca.iw.myjob.domain.Demandante;
import es.uca.iw.myjob.domain.Empresa;
import es.uca.iw.myjob.domain.OfertaTrabajo;
import es.uca.iw.myjob.reference.EstadoEmpleo;
import es.uca.iw.myjob.web.OfertaTrabajoController;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect OfertaTrabajoController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String OfertaTrabajoController.create(@Valid OfertaTrabajo ofertaTrabajo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ofertaTrabajo);
            return "ofertatrabajoes/create";
        }
        uiModel.asMap().clear();
        ofertaTrabajo.persist();
        return "redirect:/ofertatrabajoes/" + encodeUrlPathSegment(ofertaTrabajo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String OfertaTrabajoController.createForm(Model uiModel) {
        populateEditForm(uiModel, new OfertaTrabajo());
        return "ofertatrabajoes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String OfertaTrabajoController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ofertatrabajo", OfertaTrabajo.findOfertaTrabajo(id));
        uiModel.addAttribute("itemId", id);
        return "ofertatrabajoes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String OfertaTrabajoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ofertatrabajoes", OfertaTrabajo.findOfertaTrabajoEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) OfertaTrabajo.countOfertaTrabajoes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ofertatrabajoes", OfertaTrabajo.findAllOfertaTrabajoes(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "ofertatrabajoes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String OfertaTrabajoController.update(@Valid OfertaTrabajo ofertaTrabajo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ofertaTrabajo);
            return "ofertatrabajoes/update";
        }
        uiModel.asMap().clear();
        ofertaTrabajo.merge();
        return "redirect:/ofertatrabajoes/" + encodeUrlPathSegment(ofertaTrabajo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String OfertaTrabajoController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, OfertaTrabajo.findOfertaTrabajo(id));
        return "ofertatrabajoes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String OfertaTrabajoController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        OfertaTrabajo ofertaTrabajo = OfertaTrabajo.findOfertaTrabajo(id);
        ofertaTrabajo.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ofertatrabajoes";
    }
    
    void OfertaTrabajoController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("ofertaTrabajo_fecha_aprox_inic_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void OfertaTrabajoController.populateEditForm(Model uiModel, OfertaTrabajo ofertaTrabajo) {
        uiModel.addAttribute("ofertaTrabajo", ofertaTrabajo);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("demandantes", Demandante.findAllDemandantes());
        uiModel.addAttribute("empresas", Empresa.findAllEmpresas());
        uiModel.addAttribute("estadoempleos", Arrays.asList(EstadoEmpleo.values()));
    }
    
    String OfertaTrabajoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
