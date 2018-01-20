package kg.edu.iaau.pitv.model;

import javax.persistence.*;

@Entity
@Table(name = "USER_ROLE_TBL",
        uniqueConstraints = @UniqueConstraint(
                columnNames = { "USER_ID", "ROLE_ID"}))
public class UserRole
{
    private int id;

    private User user;

    private Role role;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator="user_sequence")
    @SequenceGenerator(name="user_sequence", sequenceName = "user_seq")
    @Column(name="user_role_id", unique = true, nullable = false)
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    public User getUser()
    {
        return user;
    }

    public void setUser(User user)
    {
        this.user = user;
    }

    @ManyToOne
    @JoinColumn(name = "role_id", nullable = false)
    public Role getRole()
    {
        return role;
    }

    public void setRole(Role role)
    {
        this.role = role;
    }


}
