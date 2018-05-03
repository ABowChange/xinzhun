package zyj.biyesheji0425.mapper;

import zyj.biyesheji0425.pojo.Device;

import java.util.List;

public interface DeviceMapper {
    int deleteByPrimaryKey(String deviceId);

    int insert(Device record);

    int insertSelective(Device record);

    Device selectByPrimaryKey(String deviceId);

    int updateByPrimaryKeySelective(Device record);

    int updateByPrimaryKey(Device record);

    /**
     * 查询所有的设备信息
     * @return
     */
    List<Device> allDevice();

    /**
     * 状态查询
     * @param deviceState
     * @return
     */
    List<Device> selectByState(Integer deviceState);
}