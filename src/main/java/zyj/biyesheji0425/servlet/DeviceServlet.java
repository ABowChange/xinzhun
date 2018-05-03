package zyj.biyesheji0425.servlet;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import zyj.biyesheji0425.pojo.Device;
import zyj.biyesheji0425.service.DeviceService;
import zyj.biyesheji0425.util.ChangecodingUtil;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class DeviceServlet {
    @Autowired
    DeviceService deviceService;

    @RequestMapping("/showDevice.action")
    public @ResponseBody
    ModelAndView allDevice(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("equipmentManagement");
        String string = JSON.toJSONString(deviceService.allDevice());
        request.setAttribute("allDevice", string);
        return modelAndView;
    }



    @RequestMapping("delectDevice.action")
    public @ResponseBody
    Map delectDevice(@RequestBody String jsonString) {
        int flag = deviceService.delectDevice(ChangecodingUtil.changeCoding(jsonString));
        Map map = new HashMap();
        map.put("flag", flag);
        return map;
    }

    @RequestMapping("selectDeviceById.action")
    public @ResponseBody
    List<Device> selectDeviceById(@RequestBody String jsonString) {
        Device device = deviceService.selectDeviceById(ChangecodingUtil.changeCoding(jsonString));
        List<Device> list=new ArrayList<>();
        list.add(device);
        if (device != null) {
            return list;
        }
        return null;
    }

    @RequestMapping("selectDeviceByState.action")
    public @ResponseBody
    List<Device> selectDeviceByState(@RequestBody String jsonString) {
        List<Device> deviceList = deviceService.selectDeviceByState(ChangecodingUtil.changeCoding(jsonString));
        if (deviceList.size() != 0) {
            return deviceList;
        }
        return null;
    }

    @RequestMapping("insertDevice.action")
    public @ResponseBody
    Map insertDevice(@RequestBody String jsonString) {

        int flag = deviceService.insertDevice(ChangecodingUtil.changeCoding(jsonString));
        Map map = new HashMap();
        map.put("flag", flag);
        return map;
    }

    @RequestMapping("updateDevice.action")
    public @ResponseBody
    Map updateDevice(@RequestBody String jsonString) {
        int flag = deviceService.updateDevice(jsonString);
        Map map = new HashMap();
        map.put("flag", flag);
        return map;
    }


}
