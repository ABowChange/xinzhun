package zyj.biyesheji0425.controller;

import org.springframework.beans.factory.InitializingBean;
import zyj.biyesheji0425.springWebSocket.WebSocketHandler;

import javax.annotation.Resource;
import java.util.Random;

public class BluetoothContro implements Runnable,InitializingBean {
    @Resource
    WebSocketHandler webSocketHandler;
    @Override
    public void run() {
        Random random = new Random();
        int x = 0;
        int y = 0;
        int z = 0;
        String string="X:"+x+",Y:"+y+",Z:"+z;
        while (true){
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            x= (int) Math.random()*4000-2000;
            y= (int) Math.random()*4000-2000;
            z= (int) Math.random()*4000-2000;
            string="'X':"+x+",'Y':"+y+",'Z':"+z;
            System.out.println(string);
            webSocketHandler.sendMessageToUsers(string);
        }
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        Thread thread = new Thread(this);
        System.out.println("模拟设备");
        thread.start();
    }
}
