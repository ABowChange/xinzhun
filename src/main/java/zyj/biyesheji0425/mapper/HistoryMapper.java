package zyj.biyesheji0425.mapper;

import zyj.biyesheji0425.pojo.History;
import zyj.biyesheji0425.pojo.HistoryKey;

import java.util.List;

public interface HistoryMapper {
    int deleteByPrimaryKey(HistoryKey key);

    List<History> selectAllHistory();

    int insert(History record);

    int insertSelective(History record);

    History selectByPrimaryKey(HistoryKey key);

    int updateByPrimaryKeySelective(History record);

    int updateByPrimaryKey(History record);
}