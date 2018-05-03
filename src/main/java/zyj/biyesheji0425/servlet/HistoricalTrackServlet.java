package zyj.biyesheji0425.servlet;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import zyj.biyesheji0425.pojo.HistoryView;
import zyj.biyesheji0425.service.HistoricalTrackService;
import zyj.biyesheji0425.util.ChangecodingUtil;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class HistoricalTrackServlet {
    @Autowired
    HistoricalTrackService historicalTrackService;
    @RequestMapping("/historicalTrack.action")
    public @ResponseBody ModelAndView allTrack(javax.servlet.http.HttpServletRequest request){
        Date date=new Date();
        ModelAndView modelAndView=new ModelAndView("historicalTrack");
        List<HistoryView> list=historicalTrackService.allTrack();
        String jsonString=JSON.toJSONString(list);
        List<Map<String,String>> mapList = (List<Map<String, String>>) JSON.parse(jsonString);
        for (Map map:mapList
             ) {
            Long dates= (Long) map.get("date");
            date.setTime(dates);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            map.put("date",simpleDateFormat.format(dates));
            //System.out.println("----------------------"+simpleDateFormat.format(dates));
        }
        jsonString=JSON.toJSONString(mapList);
        request.setAttribute("jsonString", jsonString);
        return modelAndView;
    }
    @RequestMapping("/selectHistoricalTrackById.action")
    public @ResponseBody  List<Map<String,String>> selectHistoricalTrackById(@RequestBody String s){
        Date date=new Date();
        List<HistoryView> list=historicalTrackService.trackBypersonId(ChangecodingUtil.changeCoding(s));
        String jsonString=JSON.toJSONString(list);
        List<Map<String,String>> mapList = (List<Map<String, String>>) JSON.parse(jsonString);
        for (Map map:mapList
                ) {
            Long dates= (Long) map.get("date");
            date.setTime(dates);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            map.put("date",simpleDateFormat.format(dates));
            //System.out.println("----------------------"+simpleDateFormat.format(dates));
        }
        return mapList;
    }
}
