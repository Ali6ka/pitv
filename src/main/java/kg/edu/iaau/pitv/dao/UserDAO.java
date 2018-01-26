package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserDAO extends JpaRepository <User, Integer>
{
    List<User> findAllByOrderByUsername();
    User findByUsername(String username);
}
