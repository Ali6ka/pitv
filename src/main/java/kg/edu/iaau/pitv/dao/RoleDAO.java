package kg.edu.iaau.pitv.dao;

import kg.edu.iaau.pitv.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleDAO extends JpaRepository<Role, Integer>
{
}
