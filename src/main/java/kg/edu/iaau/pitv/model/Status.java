package kg.edu.iaau.pitv.model;

import javax.persistence.*;

@Entity
@Table(name = "status_tbl")
public class Status
{
    private int id;

    private String title;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator="status_sequence")
    @SequenceGenerator(name = "status_sequence", sequenceName = "status_seq")
    @Column(name="status_id")
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    @Column(name = "title", unique = true)
    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }
}
