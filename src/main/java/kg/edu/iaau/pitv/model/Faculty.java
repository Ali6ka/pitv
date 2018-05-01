package kg.edu.iaau.pitv.model;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table (name = "faculty_tbl")
public class Faculty
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator="fac_sequence")
    @SequenceGenerator(name="fac_sequence", sequenceName = "fac_seq")
    @Column(name = "faculty_id")
    private int id;

    @Column(name = "name", unique = true)
    private String name;

    @OneToMany(
            fetch = FetchType.LAZY,
            mappedBy = "faculty"
    )
    private Set<Department> departments;

    @OneToMany(
            fetch = FetchType.LAZY,
            mappedBy = "faculty"
    )
    private List<Device> devices;

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

    public Set<Department> getDepartments()
    {
        return departments;
    }

    public void setDepartments(Set<Department> departments)
    {
        this.departments = departments;
    }

    public List<Device> getDevices()
    {
        return devices;
    }

    public void setDevices(List<Device> devices)
    {
        this.devices = devices;
    }
}
