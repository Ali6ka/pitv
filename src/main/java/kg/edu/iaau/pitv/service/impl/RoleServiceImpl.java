package kg.edu.iaau.pitv.service.impl;

import kg.edu.iaau.pitv.dao.RoleDAO;
import kg.edu.iaau.pitv.model.Role;
import kg.edu.iaau.pitv.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("roleService")
public class RoleServiceImpl implements RoleService
{

    @Autowired
    RoleDAO roleDAO;

    @Override
    @Transactional(readOnly = true)
    public List<Role> getAll()
    {
        return roleDAO.findAllByOrderByName();
    }

    @Override
    @Transactional(readOnly = true)
    public Role getById(int id)
    {
        return roleDAO.findOne(id);
    }

    @Override
    @Transactional(readOnly = true)
    public Role getByName(String name)
    {
        return roleDAO.findByName(name);
    }

    @Override
    @Transactional
    public void save(Role role)
    {
        roleDAO.saveAndFlush(role);
    }

    @Override
    @Transactional
    public void delete(Role role)
    {
        roleDAO.delete(role);
    }
}
