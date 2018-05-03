package zyj.biyesheji0425.service;

import com.alibaba.fastjson.JSON;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * Created by ABowChang on 2018/4/25.
 */
public class HistoricalTrackServiceTest extends ConfigTest {

@Resource
HistoricalTrackService historicalTrackService;


    @Test
    public void allTrack1() {
        System.out.println(historicalTrackService.allTrack().get(0).toString());
    }

    @Test
    public void nameToTrack1() {
    }

    @Test
    public void idToTrack1() {
    }
}