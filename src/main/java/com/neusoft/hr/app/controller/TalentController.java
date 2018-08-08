package com.neusoft.hr.app.controller;

import com.neusoft.hr.app.entity.Talent;
import com.neusoft.hr.app.service.DepartmentService;
import com.neusoft.hr.app.service.PositionService;
import com.neusoft.hr.app.service.TalentService;
import com.neusoft.hr.sys.annotation.Permission;
import com.neusoft.hr.sys.entity.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

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
    public String index(Talent talent,Model model,Integer pageNum){
        Page<Talent> page = talentService.getPage(new Page<Talent>(10, pageNum, talent));
        //model.addAttribute("talents",talentService.findList(talent));
        model.addAttribute("page",page);
        return "talent/talents";
    }

    @RequestMapping("create")
    @Permission("talent:create")
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


    @RequestMapping("statistic/{type}")
    @ResponseBody
    public  List<Map<String,Object>> statistic(@PathVariable("type") String type ){
        List<Map<String,Object>> result =  talentService.statistic(type);
        return result;
    }

    @RequestMapping("statistic/page/{type}")
    public String statisticPage(@PathVariable("type") String type){
        return "talent/"+type;
    }
}
