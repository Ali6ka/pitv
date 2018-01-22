package kg.edu.iaau.pitv.service;

import kg.edu.iaau.pitv.dao.RoleDAO;
import kg.edu.iaau.pitv.dao.UserDAO;
import kg.edu.iaau.pitv.model.Role;
import kg.edu.iaau.pitv.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service("userService")
public class UserServiceImpl implements UserService
{
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private RoleService roleService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public List<User> getAll()
    {
        return userDAO.findAll();
    }

    @Override
    public User getById(int id)
    {
        return userDAO.findOne(id);
    }

    @Override
    public User findByUsername(String username) {
        return userDAO.findByUsername(username);
    }

    @Override
    public void save(User user)
    {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(new HashSet<>(roleService.getAll()));
        userDAO.save(user);
    }

    @Override
    public void save(User user, List<String> roleIds)
    {
        Set <Role> roles = new HashSet<>();

        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        for(String id : roleIds){
            roles.add(roleService.getById(Integer.parseInt(id)));
        }
        user.setRoles(roles);
        userDAO.save(user);
    }

    @Override
    public void delete(User user)
    {
        userDAO.delete(user);
    }

}
