package kg.edu.iaau.pitv.service;

import kg.edu.iaau.pitv.model.Role;
import org.springframework.stereotype.Service;

import java.util.List;

public interface RoleService
{
    List<Role> getAll();

    Role getById(int id);

    Role getByName(String name);

    void save(Role role);

    void delete(Role role);
}
