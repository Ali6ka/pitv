package kg.edu.iaau.pitv.utils;

import com.google.api.services.calendar.model.Event;
import kg.edu.iaau.pitv.model.Department;
import kg.edu.iaau.pitv.model.Device;
import kg.edu.iaau.pitv.model.Faculty;

import java.util.*;

public class ScheduleUtils
{
    public static Map<String,Map<String,List<Event>>> getFacultySchedule(Faculty faculty){
        Map<String,Map<String,List<Event>>> facShedule = new HashMap<>();
            try{
                for(Department department:faculty.getDepartments())
                {
                    Map<String,List<Event>> depSchedule = new TreeMap<>();
                    List<Event> events = GoogleCalendarUtils.getEvents(department.getCalendarId());

                    for (Event event : events)
                    {
                        String key = event.getDescription();
                        if (depSchedule.containsKey(key))
                        {
                            depSchedule.get(key).add(event);
                        } else
                        {
                            depSchedule.put(key, new ArrayList<>());
                            depSchedule.get(key).add(event);
                        }
                    }

                    facShedule.put(department.getName(), depSchedule);
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        return facShedule;
    }
}
