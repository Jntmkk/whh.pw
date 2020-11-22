package pw.whh.main.service.impl;

import pw.whh.main.service.DemoService;

public class DemoServiceImpl implements DemoService {
    @Override
    public String getData(String username) {
        return "the data is " + username;
    }
}
