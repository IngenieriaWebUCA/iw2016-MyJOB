package es.uca.iw.myjob.web;
import es.uca.iw.myjob.domain.OfertaTrabajo;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/ofertatrabajoes")
@Controller
@RooWebScaffold(path = "ofertatrabajoes", formBackingObject = OfertaTrabajo.class)
@GvNIXWebJQuery
@RooWebFinder
public class OfertaTrabajoController {
	
}
