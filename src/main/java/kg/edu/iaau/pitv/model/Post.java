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

    private String author;

    private Date date;

    private Date dateUntil;

    private Set<Block> blocks;

    private String filePath;


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator="post_sequence")
    @SequenceGenerator(name="post_sequence", sequenceName = "post_seq")
    @Column(name="user_id")
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

    @Column(name = "author")
    public String getAuthor()
    {
        return author;
    }

    public void setAuthor(String author)
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

    @OneToMany

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
}
