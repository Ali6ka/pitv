package kg.edu.iaau.pitv.controller;

import kg.edu.iaau.pitv.model.Role;
import kg.edu.iaau.pitv.model.User;
import kg.edu.iaau.pitv.service.RoleService;
import kg.edu.iaau.pitv.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class AdminController
{

    @Autowired
    RoleService roleService;

    @Autowired
    UserService userService;

    /********* DASHBOARD ********/
    @RequestMapping(
            value = {"/dashboard"},
            method = {RequestMethod.GET})
    public String getDashboard()
    {
        return "admin/dashboard";
    }

    /********* USER ********/
    @RequestMapping(
            value = {"/dashboard/user/list"},
            method = {RequestMethod.GET})
    public String userList(Model model)
    {
        List<User> users = userService.getAll();

        model.addAttribute("users",users);
        return "admin/user-list";
    }

    @RequestMapping(
            value = {"/dashboard/user/new"},
            method = {RequestMethod.GET})
    public String userAdd(Model model)
    {
        List<Role> roles = roleService.getAll();

        model.addAttribute("roles", roles);
        return "admin/user-form";
    }

    @RequestMapping(
            value = {"/dashboard/user/update/{id}"},
            method = {RequestMethod.GET})
    public String userUpdate(Model model, @PathVariable("id") int id)
    {
        User user = userService.getById(id);
        Set<Role> userRoles = user.getRoles();
        List<Role> roles = roleService.getAll();

        model.addAttribute("user", user);
        model.addAttribute("userRoles", userRoles );
        model.addAttribute("roles", roles);

        return "admin/user-form";
    }

    @RequestMapping(
            value = {"/dashboard/user/delete/{id}"},
            method = {RequestMethod.GET})
    public String userDelete(Model model, @PathVariable("id") int id,
                             RedirectAttributes redAttrs)
    {
        try {
            userService.delete(userService.getById(id));
        } catch (Exception ex) {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/dashboard/user/list";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/dashboard/user/list";
    }

    @RequestMapping(
            value = {"/dashboard/user/save"},
            method = {RequestMethod.POST})
    public String userSave(Model model,
                           RedirectAttributes redAttrs,
                           @RequestParam("userId") String id,
                           @RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("email") String email,
                           @RequestParam("roles") List<String> roles)
    {
        User user;

        try
        {
            if ((id.trim().length() > 0))
                user = userService.getById(Integer.parseInt(id));
            else
                user = new User();

            user.setPassword(password);
            user.setUsername(username);
            user.setEmail(email);
            user.setEnabled(1);

            userService.save(user, roles);
        } catch (Exception ex){
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/dashboard/user/new";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/dashboard/user/new";
    }


    /********* ROLE ********/
    @RequestMapping(
            value = {"/dashboard/role/list"},
            method = {RequestMethod.GET})
    public String roleList(Model model)
    {
        List<Role> roles = roleService.getAll();

        model.addAttribute("roles",roles);
        return "admin/role-list";
    }

    @RequestMapping(
            value = {"/dashboard/role/new"},
            method = {RequestMethod.GET})
    public String getDashboardRole(Model model)
    {
        return "admin/role-form";
    }

    @RequestMapping(
            value = {"/dashboard/role/update/{id}"},
            method = {RequestMethod.GET})
    public String roleUpdate(Model model, @PathVariable("id") int id)
    {
        Role role = roleService.getById(id);

        model.addAttribute("role", role);

        return "admin/role-form";
    }

    @RequestMapping(
            value = {"/dashboard/role/delete/{id}"},
            method = {RequestMethod.GET})
    public String roleDelete(Model model, @PathVariable("id") int id,
                             RedirectAttributes redAttrs)
    {
        try {
            roleService.delete(roleService.getById(id));
        } catch (Exception ex) {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/dashboard/role/list";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/dashboard/role/list";
    }

    @RequestMapping(
            value = {"/dashboard/role/save"},
            method = {RequestMethod.POST})
    public String setDashboardRole(Model model,
                                   RedirectAttributes redAttrs,
                                   @RequestParam("roleId") String id,
                                   @RequestParam("name") String name)
    {
        Role role;

        try
        {
            if ((id.trim().length() > 0))
                role = roleService.getById(Integer.parseInt(id));
            else
                role = new Role();

            role.setName(name);
            roleService.save(role);

        } catch (Exception ex){
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/dashboard/role/new";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/dashboard/role/new";
    }
}
