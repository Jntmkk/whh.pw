package pw.whh.main.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class DefaultController {
    @Value("${spring.web.resources.static-locations}")
    String env;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("welcome", env);
        return "index";
    }
}
