package kg.edu.iaau.pitv.model;

import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.util.AutoPopulatingList;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "USER_TBL")
public class User
{
    private int id;

    private String username;

    private String password;

    private String email;

    private String avatar;

    private int enabled;

/*    private List<UserRole> userRoles = new AutoPopulatingList<UserRole>(UserRole.class);*/

    private Set<Role> roles;

    public User() { }

    public User(User user)
    {
        this.id = user.id;
        this.username = user.username;
        this.email = user.email;
        this.password = user.password;
        this.enabled=user.enabled;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator="user_sequence")
    @SequenceGenerator(name="user_sequence", sequenceName = "user_seq")
    @Column(name="user_id")
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    @Column(name = "username")
    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    @Column(name = "password")
    public void setPassword(String password)
    {
        this.password = password;
    }

    @Column(name = "email")
    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    @Column(name = "avatar")
    public String getAvatar()
    {
        return avatar;
    }

    public void setAvatar(String avatar)
    {
        this.avatar = avatar;
    }

    @Column(name ="enabled")
    public int getEnabled()
    {
        return enabled;
    }

    public void setEnabled(int enabled)
    {
        this.enabled = enabled;
    }

    @ManyToMany
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

/*    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
    public List<UserRole> getUserRoles() {
        return this.userRoles;
    }

    public void setUserRoles(List<UserRole> userRoles) {
        this.userRoles = userRoles;
    }*/

}