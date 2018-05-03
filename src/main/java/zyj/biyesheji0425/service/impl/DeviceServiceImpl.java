package zyj.biyesheji0425.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;
import zyj.biyesheji0425.mapper.DeviceMapper;
import zyj.biyesheji0425.pojo.Device;
import zyj.biyesheji0425.service.DeviceService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DeviceServiceImpl implements DeviceService {
    @Resource
    DeviceMapper deviceMapper;

    @Override
    public List<DeviceMapper> allDevice() {
        List list = deviceMapper.allDevice();
        return list;
    }

    @Override
    public int delectDevice(String jsonString) {
        Device device=jsonToObject(jsonString);

        int falg = deviceMapper.deleteByPrimaryKey(device.getDeviceId());
        return falg;
    }

    @Override
    public Device selectDeviceById(String jsonString) {
        Device device=jsonToObject(jsonString);
        return deviceMapper.selectByPrimaryKey(device.getDeviceId());

    }
    @Override
    public List<Device> selectDeviceByState(String jsonString) {
        System.out.println(jsonString);
        Device device=jsonToObject(jsonString);
        return deviceMapper.selectByState(device.getDeviceState());

    }

    @Override
    public int insertDevice(String jsonString) {
        Device device=jsonToObject(jsonString);

        return deviceMapper.insert(device);
    }

    @Override
    public int updateDevice(String jsonString) {
        Device device=jsonToObject(jsonString);
        return deviceMapper.updateByPrimaryKey(device);
    }

    public Device jsonToObject(String jsonString){
        JSONObject jsonobject = JSONObject.parseObject(jsonString);
        Device device= (Device)JSONObject.toJavaObject(jsonobject,Device.class);
        return device;
    }

}
