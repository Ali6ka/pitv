package kg.edu.iaau.pitv.utils;

import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventDateTime;
import kg.edu.iaau.pitv.model.Department;
import kg.edu.iaau.pitv.model.Device;
import kg.edu.iaau.pitv.model.Faculty;

import java.text.SimpleDateFormat;
import java.util.*;

public class ScheduleUtils
{
    public static Map<String,Map<String,List<Event>>> getFacultySchedule(Faculty faculty){
        Map<String,Map<String,List<Event>>> facShedule = new HashMap<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssz", Locale.US);
            try{
                for(Department department:faculty.getDepartments())
                {
                    Map<String,List<Event>> depSchedule = new TreeMap<>();
                    List<Event> events = GoogleCalendarUtils.getEvents(department.getCalendarId());
                    if(events.size() > 0)
                    {
                        for (Event event : events)
                        {
//                            Date ds = sdf.parse(event.getStart().getDateTime().toString());
//                            DateTime dts = new DateTime(ds);
//                            event.setStart(new EventDateTime().setDateTime(dts));
//
//                            ds = sdf.parse(event.getEnd().getDateTime().toString());
//                            dts = new DateTime(ds);
//                            event.setEnd(new EventDateTime().setDateTime(dts));

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
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        return facShedule;
    }
}
