package es.uca.iw.myjob.web;
import es.uca.iw.myjob.domain.Direccion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/direccions")
@Controller
@RooWebScaffold(path = "direccions", formBackingObject = Direccion.class)
@GvNIXWebJQuery
public class DireccionController {
}
