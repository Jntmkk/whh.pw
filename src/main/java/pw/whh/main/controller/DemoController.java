package pw.whh.main.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import pw.whh.main.service.DemoService;

@RestController
public class DemoController {
    DemoService demoService;

    public DemoController(DemoService demoService) {
        this.demoService = demoService;
    }

    @GetMapping("/user/file")
    public String getData(String username) {
        return demoService.getData(username);
    }
}
