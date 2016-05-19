package es.uca.iw.myjob.web;
import es.uca.iw.myjob.domain.Perfil;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/perfils")
@Controller
@RooWebScaffold(path = "perfils", formBackingObject = Perfil.class)
public class PerfilController {
}
