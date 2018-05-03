package zyj.biyesheji0425.service;

import com.alibaba.fastjson.JSON;
import org.junit.Test;
import zyj.biyesheji0425.mapper.DeviceMapper;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

public class DeviceServiceTest extends ConfigTest {
    @Resource
    DeviceMapper deviceMapper;
    @Test
    public void allDevice() {
        List list=deviceMapper.allDevice();
        System.out.println(JSON.toJSONString(list));
    }
}