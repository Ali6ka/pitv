package kg.edu.iaau.pitv.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "ROLE_TBL")
public class Role
{
    private int id;

    private String name;

/*    private Set<UserRole> userRoles;*/

    private Set<User> users;

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
