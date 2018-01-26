package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleDAO extends JpaRepository<Role, Integer>
{
    public List<Role> findAllByOrderByName();
    Role findByName(String name);
}
