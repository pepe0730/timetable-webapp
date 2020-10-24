package utils;

import java.util.Calendar;

public class Date {
    public static String getDayOfTheWeek() {
        Calendar cal = Calendar.getInstance();
        switch (cal.get(Calendar.DAY_OF_WEEK)) {
            case Calendar.SUNDAY: return "日曜日";
            case Calendar.MONDAY: return "月曜日";
            case Calendar.TUESDAY: return "火曜日";
            case Calendar.WEDNESDAY: return "水曜日";
            case Calendar.THURSDAY: return "木曜日";
            case Calendar.FRIDAY: return "金曜日";
            case Calendar.SATURDAY: return "土曜日";
        }
        throw new IllegalStateException();
    }
}
