package kg.edu.iaau.pitv.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "ROLE_TBL")
public class Role
{
    private int id;

    private String name;

    private Set<User> users;

    private Set<Block> blocks;

    /*    private Set<UserRole> userRoles;*/

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator="user_sequence")
    @SequenceGenerator(name="user_sequence", sequenceName = "user_seq")
    @Column(name="role_id")
    public int getId()

    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    @Column(name = "name")
    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    @ManyToMany(mappedBy = "roles")
    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    @ManyToMany(mappedBy = "roles")
    public Set<Block> getBlocks()
    {
        return blocks;
    }

    public void setBlocks(Set<Block> blocks)
    {
        this.blocks = blocks;
    }

/*    @OneToMany(fetch = FetchType.LAZY, mappedBy = "role")
    public Set<UserRole> getUserRoles()
    {
        return userRoles;
    }

    public void setUserRoles(Set<UserRole> userRoles)
    {
        this.userRoles = userRoles;
    }*/
}
