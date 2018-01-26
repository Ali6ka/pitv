package kg.edu.iaau.pitv.controller;

import kg.edu.iaau.pitv.model.Block;
import kg.edu.iaau.pitv.model.Device;
import kg.edu.iaau.pitv.model.Role;
import kg.edu.iaau.pitv.model.User;
import kg.edu.iaau.pitv.service.BlockService;
import kg.edu.iaau.pitv.service.DeviceService;
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

    @Autowired
    BlockService blockService;

    @Autowired
    DeviceService deviceService;

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
    public String roleAdd(Model model)
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
    public String roleSave(Model model,
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

    /********* BLOCK ********/
    @RequestMapping(
            value = {"/dashboard/block/list"},
            method = {RequestMethod.GET})
    public String blockList(Model model)
    {
        List<Block> blocks = blockService.getAll();

        model.addAttribute("blocks",blocks);
        return "admin/block-list";
    }

    @RequestMapping(
            value = {"/dashboard/block/new"},
            method = {RequestMethod.GET})
    public String blockAdd(Model model)
    {
        List<Role> roles = roleService.getAll();

        model.addAttribute("roles",roles);
        return "admin/block-form";
    }

    @RequestMapping(
            value = {"/dashboard/block/update/{id}"},
            method = {RequestMethod.GET})
    public String blockUpdate(Model model, @PathVariable("id") int id)
    {
        Block block = blockService.getById(id);

        model.addAttribute("block", block);

        return "admin/block-form";
    }

    @RequestMapping(
            value = {"/dashboard/block/delete/{id}"},
            method = {RequestMethod.GET})
    public String blockDelete(Model model, @PathVariable("id") int id,
                             RedirectAttributes redAttrs)
    {
        try {
            blockService.delete(blockService.getById(id));
        } catch (Exception ex) {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/dashboard/block/list";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/dashboard/block/list";
    }

    @RequestMapping(
            value = {"/dashboard/block/save"},
            method = {RequestMethod.POST})
    public String blockSave(Model model,
                                   RedirectAttributes redAttrs,
                                   @RequestParam("blockId") String id,
                                   @RequestParam("name") String name)
    {
        Block block;

        try
        {
            if ((id.trim().length() > 0))
                block = blockService.getById(Integer.parseInt(id));
            else
                block = new Block();

            block.setName(name);
            blockService.save(block);

        } catch (Exception ex){
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/dashboard/block/new";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/dashboard/block/new";
    }

    /********* DEVICE ********/
    @RequestMapping(
            value = {"/dashboard/device/list"},
            method = {RequestMethod.GET})
    public String deviceList(Model model)
    {
        List<Device> devices = deviceService.getAll();

        model.addAttribute("devices",devices);
        return "admin/device-list";
    }

    @RequestMapping(
            value = {"/dashboard/device/new"},
            method = {RequestMethod.GET})
    public String deviceAdd(Model model)
    {
        List<Block> blocks = blockService.getAll();

        model.addAttribute("blocks", blocks);
        return "admin/device-form";
    }

    @RequestMapping(
            value = {"/dashboard/device/update/{id}"},
            method = {RequestMethod.GET})
    public String deviceUpdate(Model model, @PathVariable("id") int id)
    {
        Device device = deviceService.getById(id);
        List<Block> blocks = blockService.getAll();

        model.addAttribute("device", device);
        model.addAttribute("blocks", blocks);

        return "admin/device-form";
    }

    @RequestMapping(
            value = {"/dashboard/device/delete/{id}"},
            method = {RequestMethod.GET})
    public String deviceDelete(Model model, @PathVariable("id") int id,
                              RedirectAttributes redAttrs)
    {
        try {
            deviceService.delete(deviceService.getById(id));
        } catch (Exception ex) {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/dashboard/device/list";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/dashboard/device/list";
    }

    @RequestMapping(
            value = {"/dashboard/device/save"},
            method = {RequestMethod.POST})
    public String deviceSave(Model model,
                             RedirectAttributes redAttrs,
                             @RequestParam("deviceId") String id,
                             @RequestParam("ip") String ip,
                             @RequestParam("login") String login,
                             @RequestParam("password") String password,
                             @RequestParam("block") int blockId)
    {
        Device device;

        try
        {
            if ((id.trim().length() > 0))
                device = deviceService.getById(Integer.parseInt(id));
            else
                device = new Device();

            device.setIp(ip);
            device.setLogin(login);
            device.setPassword(password);
            device.setBlock(blockService.getById(blockId));
            deviceService.save(device);

        } catch (Exception ex){
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/dashboard/device/new";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/dashboard/device/new";
    }
}
