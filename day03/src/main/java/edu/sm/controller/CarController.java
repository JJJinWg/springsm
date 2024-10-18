package edu.sm.controller;

import edu.sm.app.dto.CarDto;
import edu.sm.app.service.CarService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/car")
public class CarController {

    final CarService carService;
    String dir = "car/";

    // 공통적으로 페이지의 레이아웃을 설정하는 메소드
    private void setPageAttributes(Model model, String left, String center) {
        model.addAttribute("left", dir + left);
        model.addAttribute("center", dir + center);
    }

    @RequestMapping("")
    public String car(Model model) {
        model.addAttribute("left", "car/left");
        model.addAttribute("center", "car/center");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") String id) {
        try {
            CarDto carDto = carService.get(id);
            model.addAttribute("car", carDto);
            setPageAttributes(model, "left", "detail");
        } catch (Exception e) {
            log.error("Error fetching car details for id: " + id, e);
            return "error/404"; // 에러 페이지로 리디렉션
        }
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(CarDto carDto) {
        try {
            carService.modify(carDto);
            return "redirect:/car/detail?id=" + carDto.getCarId();
        } catch (Exception e) {
            log.error("Error updating car: " + carDto, e);
            return "error/500"; // 에러 페이지로 리디렉션
        }
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(@RequestParam("id") String id) {
        try {
            carService.del(id);
            return "redirect:/car/get";
        } catch (Exception e) {
            log.error("Error deleting car with id: " + id, e);
            return "error/500"; // 에러 페이지로 리디렉션
        }
    }

    @RequestMapping("/add")
    public String add(Model model) {
        setPageAttributes(model, "left", "add");
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model) {
        try {
            List<CarDto> cars = carService.get();
            model.addAttribute("cars", cars);
            setPageAttributes(model, "left", "get");
        } catch (Exception e) {
            log.error("Error fetching car list", e);
            return "error/500"; // 에러 페이지로 리디렉션
        }
        return "index";
    }
}
