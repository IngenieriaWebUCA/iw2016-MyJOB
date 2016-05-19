package es.uca.iw.myjob.web;
import es.uca.iw.myjob.domain.OfertaTrabajo;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/ofertatrabajoes")
@Controller
@RooWebScaffold(path = "ofertatrabajoes", formBackingObject = OfertaTrabajo.class)
public class OfertaTrabajoController {
}
