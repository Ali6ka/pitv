package kg.edu.iaau.pitv.model;

import javax.persistence.*;

@Entity
@Table(name = "department_tbl")
public class Department
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator="dep_sequence")
    @SequenceGenerator(name="dep_sequence", sequenceName = "dep_seq")
    @Column(name = "department_id")
    private int id;

    @Column(name = "name", unique = true)
    private String name;

    @Column (name = "code", unique = true)
    private String code;

    @Column (name = "calendar_id")
    private String calendarId;

    @ManyToOne
    @JoinColumn(name = "faculty_id")
    private Faculty faculty;

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getCode()
    {
        return code;
    }

    public void setCode(String code)
    {
        this.code = code;
    }

    public String getCalendarId()
    {
        return calendarId;
    }

    public void setCalendarId(String calendarId)
    {
        this.calendarId = calendarId;
    }

    public Faculty getFaculty()
    {
        return faculty;
    }

    public void setFaculty(Faculty faculty)
    {
        this.faculty = faculty;
    }
}
