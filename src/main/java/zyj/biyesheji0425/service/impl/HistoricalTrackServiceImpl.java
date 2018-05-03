package zyj.biyesheji0425.service.impl;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;
import zyj.biyesheji0425.mapper.HistoryMapper;
import zyj.biyesheji0425.mapper.HistoryViewMapper;
import zyj.biyesheji0425.pojo.History;
import zyj.biyesheji0425.pojo.HistoryView;
import zyj.biyesheji0425.service.HistoricalTrackService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ABowChang on 2018/4/24.
 */
@Service
public class HistoricalTrackServiceImpl implements HistoricalTrackService {
    @Resource
    private HistoryMapper historyMapper;
    @Resource
    private HistoryViewMapper historyViewMapper;

    public HistoryView jsonToObject(String jsonString){
        JSONObject jsonobject = JSONObject.parseObject(jsonString);
        HistoryView historyView= (HistoryView)JSONObject.toJavaObject(jsonobject,HistoryView.class);
        return historyView;
    }

    public List<HistoryView> allTrack() {
        return historyViewMapper.selectAllTrack();
    }

    @Override
    public List<HistoryView> trackBypersonId(String jsonString) {
        HistoryView historyView=jsonToObject(jsonString);
        if (historyView.getPersonId()==null){
            return historyViewMapper.selectAllTrack();
        }
        return historyViewMapper.trackBypersonId(historyView.getPersonId());
    }


    public List<History> nameToTrack(String name) {
        return null;
    }


    public List<History> idToTrack(String id) {
        return null;
    }
}
