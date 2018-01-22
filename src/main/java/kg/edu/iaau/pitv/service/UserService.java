package kg.edu.iaau.pitv.service;

import kg.edu.iaau.pitv.model.Role;
import kg.edu.iaau.pitv.model.User;

import java.util.List;

public interface UserService
{
    List<User> getAll();

    User getById(int id);

    User findByUsername(String username);

    void save(User user);

    void save(User user, List<String> roleIds);

    void delete(User user);

}
