package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDAO extends JpaRepository <User, Integer>
{
    List<User> findAllByOrderByUsername();

    User findByUsername(String username);
}
