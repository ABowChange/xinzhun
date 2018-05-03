package zyj.biyesheji0425.util;

import java.io.UnsupportedEncodingException;

public class ChangecodingUtil {
    public static String changeCoding(String string) {
        String newString=null;
        try {
            newString=java.net.URLDecoder.decode(string, "utf-8");
            return newString.substring(0,newString.length()-1);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
