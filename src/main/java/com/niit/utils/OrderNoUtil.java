package com.niit.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 86166
 */
public class OrderNoUtil {
    /**
     * 获取订单号
     * @return
     */
    private static String date;
    private static long orderNum = 0L;
    public static synchronized String getOrderNo() {
        String str = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
        if(date==null||!date.equals(str)){
            date = str;
            orderNum = 0L;
        }
        orderNum++;
        long orderNO = Long.parseLong(date)*10000;
        orderNO += orderNum;
        return orderNO+"";
    }
}
