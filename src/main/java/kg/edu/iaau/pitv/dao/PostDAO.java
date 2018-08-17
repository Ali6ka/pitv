package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostDAO extends JpaRepository<Post, Integer>
{
    List<Post> findAllByAuthor(String author);

}
