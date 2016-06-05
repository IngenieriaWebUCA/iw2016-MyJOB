package es.uca.iw.myjob.web;
import es.uca.iw.myjob.domain.Perfil;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import es.uca.iw.myjob.domain.PerfilBatchService;
import org.gvnix.addon.web.mvc.annotations.batch.GvNIXWebJpaBatch;

@RequestMapping("/perfils")
@Controller
@RooWebScaffold(path = "perfils", formBackingObject = Perfil.class)
@GvNIXWebJQuery
@GvNIXWebJpaBatch(service = PerfilBatchService.class)
public class PerfilController {
}
