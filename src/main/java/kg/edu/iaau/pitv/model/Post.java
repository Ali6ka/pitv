package kg.edu.iaau.pitv.model;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "post_tbl")
public class Post
{
    private int id;

    private String title;

    private User author;

    private Date date;

    private Date dateUntil;

    private Set<Block> blocks;

    private String filePath;

    private Status status;


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator="post_sequence")
    @SequenceGenerator(name="post_sequence", sequenceName = "post_seq")
    @Column(name = "post_id")
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    @Column(name = "title")
    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    @ManyToOne
    @JoinColumn(name = "author_id")
    public User getAuthor()
    {
        return author;
    }

    public void setAuthor(User author)
    {
        this.author = author;
    }

    @Column(name = "date")
    public Date getDate()
    {
        return date;
    }

    public void setDate(Date date)
    {
        this.date = date;
    }

    @Column(name = "date_until")
    public Date getDateUntil()
    {
        return dateUntil;
    }

    public void setDateUntil(Date dateUntil)
    {
        this.dateUntil = dateUntil;
    }

    @ManyToMany
    @JoinTable(name = "post_block",
            joinColumns = @JoinColumn(name = "post_id"),
            inverseJoinColumns = @JoinColumn(name = "block_id"))
    public Set<Block> getBlocks()
    {
        return blocks;
    }

    public void setBlocks(Set<Block> blocks)
    {
        this.blocks = blocks;
    }

    @Column(name = "file_path")
    public String getFilePath()
    {
        return filePath;
    }

    public void setFilePath(String filePath)
    {
        this.filePath = filePath;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "status_id")
    public Status getStatus()
    {
        return status;
    }

    public void setStatus(Status status)
    {
        this.status = status;
    }
}
