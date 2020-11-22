package pw.whh.main.service.impl;

import org.springframework.stereotype.Service;
import pw.whh.main.service.DemoService;
@Service
public class DemoServiceImpl implements DemoService {
    @Override
    public String getData(String username) {
        return "the data is " + username;
    }
}
