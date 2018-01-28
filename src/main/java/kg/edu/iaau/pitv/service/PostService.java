package kg.edu.iaau.pitv.service;

import kg.edu.iaau.pitv.model.Post;

import java.util.List;

public interface PostService
{
    Post getById(int id);

    List<Post> getAll();

    List<Post> getAllByAuthor(String author);

    void save(Post post);

    void save(Post post, List<String> blockIds, String fileName);

    void delete(Post post);


}
