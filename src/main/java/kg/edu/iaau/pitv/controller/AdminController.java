package kg.edu.iaau.pitv.controller;

import kg.edu.iaau.pitv.model.*;
import kg.edu.iaau.pitv.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.sql.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/admin")
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

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    FacultyDepartmentService facultyDepartmentService;

    /********* DASHBOARD ********/
    @RequestMapping(
            value = {""},
            method = {RequestMethod.GET})
    public String getDashboard()
    {
        return "admin/dashboard";
    }

    /********************************** USER **********************************/
    @RequestMapping(
            value = {"/user/list"},
            method = {RequestMethod.GET})
    public String userList(Model model)
    {
        List<User> users = userService.getAll();

        model.addAttribute("users",users);
        return "admin/user-list";
    }

    @RequestMapping(
            value = {"/user/new"},
            method = {RequestMethod.GET})
    public String userAdd(Model model)
    {
        List<Role> roles = roleService.getAll();
        model.addAttribute("user", new User());
        model.addAttribute("roles", roles);
        model.addAttribute("isNew", true);

        return "admin/user-form";
    }

    @RequestMapping(
            value = {"/user/update/{id}"},
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
            value = {"/user/delete/{id}"},
            method = {RequestMethod.GET})
    public String userDelete(Model model, @PathVariable("id") int id,
                             RedirectAttributes redAttrs)
    {
        try {
            userService.delete(userService.getById(id));
        } catch (Exception ex) {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/admin/user/list";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/admin/user/list";
    }

    @RequestMapping(
            value = {"/user/save"},
            method = {RequestMethod.POST})
    public String userSave(@Valid @ModelAttribute("user") User user, BindingResult result,
                           Model model, RedirectAttributes redAttrs)
    {
        if(result.hasErrors()) {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/admin/user/list";
        }

        userService.save(user);
        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/admin/user/list";
    }

    /********************************** ROLE **********************************/
    @RequestMapping(
            value = {"/role/list"},
            method = {RequestMethod.GET})
    public String roleList(Model model)
    {
        List<Role> roles = roleService.getAll();

        model.addAttribute("roles",roles);
        return "admin/role-list";
    }

    @RequestMapping(
            value = {"/role/new"},
            method = {RequestMethod.GET})
    public String roleAdd(Model model)
    {
        model.addAttribute("role", new Role());
        return "admin/role-form";
    }

    @RequestMapping(
            value = {"/role/update/{id}"},
            method = {RequestMethod.GET})
    public String roleUpdate(Model model, @PathVariable("id") int id)
    {
        Role role = roleService.getById(id);

        model.addAttribute("role", role);

        return "admin/role-form";
    }

    @RequestMapping(
            value = {"/role/delete/{id}"},
            method = {RequestMethod.GET})
    public String roleDelete(Model model, @PathVariable("id") int id,
                             RedirectAttributes redAttrs)
    {
        try {
            roleService.delete(roleService.getById(id));
        } catch (Exception ex) {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/admin/role/list";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/admin/role/list";
    }

    @RequestMapping(
            value = {"/role/save"},
            method = {RequestMethod.POST})
    public String roleSave(@Valid @ModelAttribute("role") Role role, Model model,
                           BindingResult result, RedirectAttributes redAttrs)
    {
        if(result.hasErrors())
        {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/admin/role/new";
        }

        roleService.save(role);
        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/admin/role/new";
    }

    /********************************** BLOCK **********************************/
    @RequestMapping(
            value = {"/block/list"},
            method = {RequestMethod.GET})
    public String blockList(Model model)
    {
        List<Block> blocks = blockService.getAll();

        model.addAttribute("blocks",blocks);
        return "admin/block-list";
    }

    @RequestMapping(
            value = {"/block/new"},
            method = {RequestMethod.GET})
    public String blockAdd(Model model)
    {
        List<Role> roles = roleService.getAll();

        model.addAttribute("block", new Block());
        model.addAttribute("roles",roles);
        model.addAttribute("isNew",true);
        return "admin/block-form";
    }

    @RequestMapping(
            value = {"/block/update/{id}"},
            method = {RequestMethod.GET})
    public String blockUpdate(Model model, @PathVariable("id") int id)
    {
        Block block = blockService.getById(id);
        List<Role> roles = roleService.getAll();

        model.addAttribute("block", block);
        model.addAttribute("roles", roles);

        return "admin/block-form";
    }

    @RequestMapping(
            value = {"/block/delete/{id}"},
            method = {RequestMethod.GET})
    public String blockDelete(Model model, @PathVariable("id") int id,
                             RedirectAttributes redAttrs)
    {
        try {
            blockService.delete(blockService.getById(id));
        } catch (Exception ex) {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/admin/block/list";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/admin/block/list";
    }

    @RequestMapping(
            value = {"/block/save"},
            method = {RequestMethod.POST})
    public String blockSave(@Valid @ModelAttribute("block") Block block, Model model,
                            BindingResult result, RedirectAttributes redAttrs)
    {
        if(result.hasErrors())
        {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/admin/block/new";
        }

        blockService.save(block);
        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/admin/block/new";
    }

    /********************************** DEVICE **********************************/
    @RequestMapping(
            value = {"/device/list"},
            method = {RequestMethod.GET})
    public String deviceList(Model model)
    {
        List<Device> devices = deviceService.getAll();

        model.addAttribute("devices",devices);
        return "admin/device-list";
    }

    @RequestMapping(
            value = {"/device/new"},
            method = {RequestMethod.GET})
    public String deviceAdd(Model model)
    {
        List<Block> blocks = blockService.getAll();
        List<Faculty> faculties = facultyDepartmentService.getAllFaculties();

        model.addAttribute("device", new Device());
        model.addAttribute("blocks", blocks);
        model.addAttribute("faculties", faculties);
        return "admin/device-form";
    }

    @RequestMapping(
            value = {"/device/update/{id}"},
            method = {RequestMethod.GET})
    public String deviceUpdate(Model model, @PathVariable("id") int id)
    {
        Device device = deviceService.getById(id);
        List<Block> blocks = blockService.getAll();
        List<Faculty> faculties = facultyDepartmentService.getAllFaculties();

        model.addAttribute("device", device);
        model.addAttribute("blocks", blocks);
        model.addAttribute("faculties", faculties);


        return "admin/device-form";
    }

    @RequestMapping(
            value = {"/device/delete/{id}"},
            method = {RequestMethod.GET})
    public String deviceDelete(Model model, @PathVariable("id") int id,
                              RedirectAttributes redAttrs)
    {
        try {
            deviceService.delete(deviceService.getById(id));
        } catch (Exception ex) {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/admin/device/list";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/admin/device/list";
    }

    @RequestMapping(
            value = {"/device/save"},
            method = {RequestMethod.POST})
    public String deviceSave(@Valid @ModelAttribute("device") Device device, Model model,
                             BindingResult result, RedirectAttributes redAttrs)
    {
        if(result.hasErrors())
        {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/admin/device/new";
        }

        deviceService.save(device);
        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/admin/device/new";
    }

    /********************************** FACULTY **********************************/
    @RequestMapping(
            value = {"/faculty/list"},
            method = {RequestMethod.GET})
    public String facultyList(Model model)
    {
        List<Faculty> faculties = facultyDepartmentService.getAllFaculties();
        model.addAttribute("faculties",faculties);
        return "admin/faculty-list";
    }

    @RequestMapping(
            value = {"/faculty/new"},
            method = {RequestMethod.GET})
    public String facultyAdd(Model model)
    {
        model.addAttribute("faculty", new Faculty());
        return "admin/faculty-form";
    }

    @RequestMapping(
            value = {"/faculty/update/{id}"},
            method = {RequestMethod.GET})
    public String facultyUpdate(Model model, @PathVariable("id") int id)
    {
        Faculty faculty = facultyDepartmentService.getFacultyById(id);
        model.addAttribute("faculty", faculty);
        return "admin/faculty-form";
    }

    @RequestMapping(
            value = {"/faculty/delete/{id}"},
            method = {RequestMethod.GET})
    public String facultyDelete(Model model, @PathVariable("id") int id,
                               RedirectAttributes redAttrs)
    {
        try {
            facultyDepartmentService.delete(facultyDepartmentService.getFacultyById(id));
        } catch (Exception ex) {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/admin/faculty/list";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/admin/faculty/list";
    }

    @RequestMapping(
            value = {"/faculty/save"},
            method = {RequestMethod.POST})
    public String facultySave(@Valid @ModelAttribute("faculty") Faculty faculty, Model model,
                              BindingResult result, RedirectAttributes redAttrs)
    {
        if(result.hasErrors())
        {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/admin/faculty/new";
        }

        facultyDepartmentService.save(faculty);
        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/admin/faculty/new";
    }

    /********************************** DEPARTMENT **********************************/
    @RequestMapping(
            value = {"/department/list"},
            method = {RequestMethod.GET})
    public String departmentList(Model model)
    {
        List<Department> departments = facultyDepartmentService.getAllDepartments();

        model.addAttribute("departments",departments);
        return "admin/department-list";
    }

    @RequestMapping(
            value = {"/department/new"},
            method = {RequestMethod.GET})
    public String departmentAdd(Model model)
    {
        List<Faculty> faculties = facultyDepartmentService.getAllFaculties();

        model.addAttribute("department", new Department());
        model.addAttribute("faculties", faculties);
        return "admin/department-form";
    }

    @RequestMapping(
            value = {"/department/update/{id}"},
            method = {RequestMethod.GET})
    public String departmentUpdate(Model model, @PathVariable("id") int id)
    {
        Department department = facultyDepartmentService.getDepartmentById(id);
        List<Faculty> faculties = facultyDepartmentService.getAllFaculties();

        model.addAttribute("department", department);
        model.addAttribute("faculties", faculties);

        return "admin/department-form";
    }

    @RequestMapping(
            value = {"/department/delete/{id}"},
            method = {RequestMethod.GET})
    public String departmentDelete(Model model, @PathVariable("id") int id,
                               RedirectAttributes redAttrs)
    {
        try {
            facultyDepartmentService.delete(facultyDepartmentService.getDepartmentById(id));
        } catch (Exception ex) {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/admin/department/list";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/admin/department/list";
    }

    @RequestMapping(
            value = {"/department/save"},
            method = {RequestMethod.POST})
    public String departmentSave(@Valid @ModelAttribute("department") Department department, Model model,
                                 BindingResult result, RedirectAttributes redAttrs)
    {
        if(result.hasErrors())
        {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/admin/department/new";
        }

        facultyDepartmentService.save(department);
        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/admin/department/new";
    }
}