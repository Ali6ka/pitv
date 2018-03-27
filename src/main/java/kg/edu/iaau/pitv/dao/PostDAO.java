package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PostDAO extends JpaRepository<Post, Integer>
{
    List<Post> findAllByAuthor(String author);
}
