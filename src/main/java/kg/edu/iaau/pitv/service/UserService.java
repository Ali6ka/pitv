package kg.edu.iaau.pitv.service;

import kg.edu.iaau.pitv.model.User;

public interface UserService
{
    void save(User user);

    User findByUsername(String username);
}
