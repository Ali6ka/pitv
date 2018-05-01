package kg.edu.iaau.pitv.model;

import org.hibernate.annotations.JoinColumnOrFormula;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table (name = "DEVICE_TBL")
public class Device
{
    private int id;

    private String ip;

    private String login;

    private String password;

    private Block block;

    private Faculty faculty;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator="device_sequence")
    @SequenceGenerator(name="device_sequence", sequenceName = "device_seq")
    @Column(name="device_id")
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    @Column(name="ip", unique = true)
    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
    }

    @Column(name="login")
    public String getLogin()
    {
        return login;
    }

    public void setLogin(String login)
    {
        this.login = login;
    }

    @Column(name="password")
    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }


    @ManyToOne
    @JoinColumn(name = "block_id")
    public Block getBlock()
    {
        return block;
    }

    public void setBlock(Block block)
    {
        this.block = block;
    }

    @ManyToOne
    @JoinColumn(name = "faculty_id")
    public Faculty getFaculty()
    {
        return faculty;
    }

    public void setFaculty(Faculty faculty)
    {
        this.faculty = faculty;
    }
}
