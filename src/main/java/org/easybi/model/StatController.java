package org.easybi.model;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/stats")
@Controller
@RooWebScaffold(path = "stats", formBackingObject = Stat.class, update = false, create = false)
@RooWebFinder
public class StatController {
}
