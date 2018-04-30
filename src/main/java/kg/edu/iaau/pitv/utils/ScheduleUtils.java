package kg.edu.iaau.pitv.utils;

import com.google.api.services.calendar.model.Event;

import java.util.*;

public class ScheduleUtils
{
    public static Map<String,List<Event>> getFacultySchedule(){
        Map<String,List<Event>> result = new TreeMap<>();
        List<Event> events = null;
        try{
            events = CalendarQuickstart.getEvents();
            for (Event event : events)
            {
                String key = event.getDescription();
                if (result.containsKey(key)){
                    result.get(key).add(event);
                }else {
                    result.put(key, new ArrayList<>());
                    result.get(key).add(event);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
