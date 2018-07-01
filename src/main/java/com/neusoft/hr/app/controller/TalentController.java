package com.neusoft.hr.app.controller;

import com.neusoft.hr.app.entity.Talent;
import com.neusoft.hr.app.service.DepartmentService;
import com.neusoft.hr.app.service.PositionService;
import com.neusoft.hr.app.service.TalentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/talent")
public class TalentController {

    @Autowired
    private TalentService talentService;
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private PositionService positionService;

    @RequestMapping({"","list"})
    public String index(Talent talent,Model model){
        model.addAttribute("talents",talentService.findList(talent));
        return "talent/talents";
    }

    @RequestMapping("create")
    public String create(Model model){
        model.addAttribute("departments",departmentService.findAll());
        model.addAttribute("positions",positionService.findAll());
        return "talent/talent";
    }

    @RequestMapping("update/{id}")
    public String update(@PathVariable("id") Long id, Model model){
        model.addAttribute("departments",departmentService.findAll());
        model.addAttribute("positions",positionService.findAll());
        model.addAttribute("talent",talentService.getById(id));
        return "talent/talent";
    }

    @RequestMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id,Model model){
        talentService.delete(id);
        return "talent/talents";
    }

    @RequestMapping("save")
    public String save(Talent talent){
        talentService.save(talent);
        return "redirect:/talent";
    }


}
