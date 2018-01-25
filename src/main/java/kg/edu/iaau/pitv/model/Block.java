package kg.edu.iaau.pitv.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "BLOCK_TBL")
public class Block
{

    private int id;

    private String name;

    private Role role;

    private Set<Device> devices;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator="block_sequence")
    @SequenceGenerator(name="block_sequence", sequenceName = "block_seq")
    @Column(name="block_id")
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }


    @Column(name="block_name", unique = true)
    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    @ManyToOne
    @JoinColumn(
            name = "role_id"
    )
    public Role getRole()
    {
        return role;
    }

    public void setRole(Role role)
    {
        this.role = role;
    }

    @OneToMany(
            fetch = FetchType.LAZY,
            mappedBy = "block"
    )
    public Set<Device> getDevices()
    {
        return devices;
    }

    public void setDevices(Set<Device> devices)
    {
        this.devices = devices;
    }

}
