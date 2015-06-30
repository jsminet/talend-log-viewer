// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.easybi.model;

import org.easybi.model.Stat;
import org.easybi.model.StatController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect StatController_Roo_Controller {
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String StatController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("stat", Stat.findStat(id));
        uiModel.addAttribute("itemId", id);
        return "stats/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String StatController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("stats", Stat.findStatEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Stat.countStats() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("stats", Stat.findAllStats(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "stats/list";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String StatController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Stat stat = Stat.findStat(id);
        stat.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/stats";
    }
    
    void StatController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("stat_moment_date_format", "dd-MM-yyyy hh:mm:ss a");
    }
    
}