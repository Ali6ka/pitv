package kg.edu.iaau.pitv.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "BLOCK_TBL")
public class Block
{

    private int id;

    private String name;

    private Set<Role> roles;

    private Set<Device> devices;

    private Set<Post> posts;

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

    @ManyToMany
    @JoinTable(name = "block_role",
            joinColumns = @JoinColumn(name = "block_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles()
    {
        return roles;
    }

    public void setRoles(Set<Role> roles)
    {
        this.roles = roles;
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

    @ManyToMany(mappedBy = "blocks")
    public Set<Post> getPosts()
    {
        return posts;
    }

    public void setPosts(Set<Post> posts)
    {
        this.posts = posts;
    }
}
