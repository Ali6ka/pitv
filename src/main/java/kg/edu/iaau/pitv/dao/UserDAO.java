package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDAO extends JpaRepository <User, Integer>
{
    User findByUsername(String username);
}
