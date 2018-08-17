package kg.edu.iaau.pitv.scheduled;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ScheduledTasks
{
    @Scheduled(cron  = "0 * * ? * *")
    public void scheduleTaskWithCronExpression() {
    }
}
