package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TableController {

    @GetMapping("/tables")
    public String tables() {
        return "tables";
    }
}
