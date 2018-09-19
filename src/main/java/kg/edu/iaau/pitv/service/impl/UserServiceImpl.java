package kg.edu.iaau.pitv.service.impl;

import kg.edu.iaau.pitv.dao.RoleDAO;
import kg.edu.iaau.pitv.dao.UserDAO;
import kg.edu.iaau.pitv.model.Role;
import kg.edu.iaau.pitv.model.User;
import kg.edu.iaau.pitv.service.RoleService;
import kg.edu.iaau.pitv.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.sql.Date;
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
        return userDAO.findAllByOrderByUsername();
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
    public User getCurrentUser()
    {
        Object principal = SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();

        User user =null;

        if(!principal.toString().equals("anonymousUser"))
            user = findByUsername(((org.springframework.security.core.userdetails.User)
                    principal).getUsername());

        return user;
    }

    @Override
    public void save(User user)
    {
        if(user.getPassword().length() < 40)
            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));

        if(user.getDateOfActivation() == null)
            user.setDateOfActivation(new Date(new java.util.Date().getTime()));

        userDAO.saveAndFlush(user);
    }

    @Override
    public void save(User user, List<String> roleIds)
    {
        Set <Role> roles = new HashSet<>();
        if(user.getPassword().length() < 40)
            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        for(String id : roleIds){
            roles.add(roleService.getById(Integer.parseInt(id)));
        }
        user.setRoles(roles);
        userDAO.saveAndFlush(user);
    }

    @Override
    public void delete(User user)
    {
        userDAO.delete(user);
    }

}
