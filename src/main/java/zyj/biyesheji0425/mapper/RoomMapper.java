package zyj.biyesheji0425.mapper;

import zyj.biyesheji0425.pojo.Room;

public interface RoomMapper {
    int deleteByPrimaryKey(String roomId);

    int insert(Room record);

    int insertSelective(Room record);

    Room selectByPrimaryKey(String roomId);

    int updateByPrimaryKeySelective(Room record);

    int updateByPrimaryKey(Room record);
}