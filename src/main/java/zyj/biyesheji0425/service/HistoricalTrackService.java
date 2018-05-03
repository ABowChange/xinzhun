package zyj.biyesheji0425.service;

import zyj.biyesheji0425.pojo.History;
import zyj.biyesheji0425.pojo.HistoryView;

import java.util.List;

/**
 * Created by ABowChang on 2018/4/24.
 */
public interface HistoricalTrackService {
    List<HistoryView> allTrack();
    List<HistoryView> trackBypersonId(String personId);
    List<History> nameToTrack(String name);
    List<History> idToTrack(String id);
}
