package zyj.biyesheji0425.mapper;

import zyj.biyesheji0425.pojo.HistoryView;

import java.util.List;

public interface HistoryViewMapper {
    List<HistoryView> selectAllTrack();
    List<HistoryView> trackBypersonId(String personId);
}
