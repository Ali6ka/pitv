package kg.edu.iaau.pitv.model;

import org.hibernate.annotations.JoinColumnOrFormula;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table (name = "DEVICE_TBL")
public class Device
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator="device_sequence")
    @SequenceGenerator(name="device_sequence", sequenceName = "device_seq")
    @Column(name="device_id")
    private int id;

    @Column(name="ip", unique = true)
    private String ip;

    @Column(name="login")
    private String login;

    @Column(name="password")
    private String password;

    @ManyToOne
    @JoinColumn(name = "block_id")
    private Block block;

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

    public String getIp()
    {
        return ip;
    }

    public void setIp(String ip)
    {
        this.ip = ip;
    }

    public String getLogin()
    {
        return login;
    }

    public void setLogin(String login)
    {
        this.login = login;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public Block getBlock()
    {
        return block;
    }

    public void setBlock(Block block)
    {
        this.block = block;
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
