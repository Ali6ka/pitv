package kg.edu.iaau.pitv.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "BLOCK_TBL")
public class Block
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator="block_sequence")
    @SequenceGenerator(name="block_sequence", sequenceName = "block_seq")
    @Column(name="block_id")
    private int id;

    @Column(name="block_name", unique = true)
    private String name;

    @ManyToMany
    @JoinTable(name = "block_role",
            joinColumns = @JoinColumn(name = "block_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    @OneToMany(
            fetch = FetchType.LAZY,
            mappedBy = "block"
    )
    private Set<Device> devices;

    @ManyToMany(mappedBy = "blocks")
    private Set<Post> posts;

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

    public Set<Role> getRoles()
    {
        return roles;
    }

    public void setRoles(Set<Role> roles)
    {
        this.roles = roles;
    }

    public Set<Device> getDevices()
    {
        return devices;
    }

    public void setDevices(Set<Device> devices)
    {
        this.devices = devices;
    }

    public Set<Post> getPosts()
    {
        return posts;
    }

    public void setPosts(Set<Post> posts)
    {
        this.posts = posts;
    }
}
