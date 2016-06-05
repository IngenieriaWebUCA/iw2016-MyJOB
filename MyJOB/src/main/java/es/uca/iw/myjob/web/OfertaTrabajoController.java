package es.uca.iw.myjob.web;
import es.uca.iw.myjob.domain.OfertaTrabajo;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import es.uca.iw.myjob.domain.OfertaTrabajoBatchService;
import org.gvnix.addon.web.mvc.annotations.batch.GvNIXWebJpaBatch;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;

@RequestMapping("/ofertatrabajoes")
@Controller
@RooWebScaffold(path = "ofertatrabajoes", formBackingObject = OfertaTrabajo.class)
@GvNIXWebJQuery
@GvNIXWebJpaBatch(service = OfertaTrabajoBatchService.class)
@GvNIXDatatables(ajax = true)
public class OfertaTrabajoController {
}
