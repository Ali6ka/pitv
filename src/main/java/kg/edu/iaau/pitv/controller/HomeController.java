package kg.edu.iaau.pitv.controller;


import com.google.api.services.calendar.model.Event;
import kg.edu.iaau.pitv.model.Block;
import kg.edu.iaau.pitv.model.Role;
import kg.edu.iaau.pitv.model.User;
import kg.edu.iaau.pitv.service.UserService;
import kg.edu.iaau.pitv.utils.CalendarQuickstart;
import kg.edu.iaau.pitv.utils.CustomFileUtils;
import kg.edu.iaau.pitv.utils.ScheduleUtils;
import org.apache.commons.collections.ArrayStack;
import org.springframework.beans.factory.annotation.Value;
import kg.edu.iaau.pitv.model.Post;
import kg.edu.iaau.pitv.service.BlockService;
import kg.edu.iaau.pitv.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
public class HomeController {

    @Value("${system.app.external.resource.location}")
    private String externalResource;

    @Autowired
    BlockService blockService;

    @Autowired
    UserService userService;

    @Autowired
    PostService postService;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @RequestMapping("/")
    public String index()
    {
        return "index";
    }

    @RequestMapping(
            value = {"/login"},
            method = {RequestMethod.GET})
    public String loginPage()
    {
        return "login";
    }

    @RequestMapping(
            value = {"/accessDenied"},
            method = {RequestMethod.GET}
    )
    public String accessDeniedPage(ModelMap model)
    {
        return "accessDenied";
    }

    @RequestMapping(
            value = {"/logout"},
            method = {RequestMethod.GET}
    )
    public String logoutPage(HttpServletRequest request, HttpServletResponse response)
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            (new SecurityContextLogoutHandler()).logout(request, response, auth);
        }

        return "redirect:/login?logout";
    }

    /********************************** PROFILE **********************************/

    @RequestMapping(value = "/schedule", method = RequestMethod.GET)
    public String getSchedule(Model model){
        Map<String,List<Event>> events = ScheduleUtils.getFacultySchedule();
        model.addAttribute("schedule", events);
        return "/schedule";
    }

    /********************************** POST **********************************/
    @RequestMapping(
            value = {"/post/list"},
            method = {RequestMethod.GET})
    public String postList(Model model)
    {
        String username = userService.getCurrentUser().getUsername();

        List<Post> posts = postService.getAll();

        model.addAttribute("posts",posts);
        return "/post-list";
    }

    @RequestMapping(
            value = {"/post/new"},
            method = {RequestMethod.GET})
    public String postAdd(Model model)
    {
        List<Block> result = blockService.getUserAvailableBlocks
                (userService.getCurrentUser().getId());

        model.addAttribute("blocks",result);
        return "/post-form";
    }

    @RequestMapping(
            value = {"/post/delete/{id}"},
            method = {RequestMethod.GET})
    public String postDelete(Model model, @PathVariable("id") int id,
                              RedirectAttributes redAttrs)
    {
        try {
            postService.delete(postService.getById(id));
        } catch (Exception ex) {
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/post/list";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/post/list";
    }

    @RequestMapping(
            value = {"/post/save"},
            method = {RequestMethod.POST})
    public String postSave(Model model,
                            RedirectAttributes redAttrs,
                            @RequestParam("title") String title,
                            @RequestParam("dateUntil") String dateUntil,
                            @RequestParam("blocks") List<String> blockIds,
                            @RequestParam("file") MultipartFile multipartFile)
    {
        Post post = new Post();
        java.util.Date currentDate = new java.util.Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yyyy");
        String filePath = null;

        try
        {
            java.util.Date deadLine = simpleDateFormat.parse(dateUntil);
            Date lastDate = new Date(deadLine.getTime());

            post.setTitle(title);
            post.setDate(new Date(currentDate.getTime()));
            post.setDateUntil(lastDate);
            post.setAuthor(userService.getCurrentUser());

            if (!multipartFile.getOriginalFilename().isEmpty()) {
                filePath = CustomFileUtils.uploadFile(multipartFile, this.externalResource);
                if (filePath == null) {
                    redAttrs.addFlashAttribute("result","fail");
                    return "redirect:/post/new";
                }
                post.setFilePath(filePath);
            }

            postService.save(post,blockIds,filePath);


        } catch (Exception ex){
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/post/new";
        }

        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/post/new";
    }

    /********************************** PROFILE **********************************/

    @RequestMapping(
            value = {"/user/profile"},
            method = {RequestMethod.GET})
    public String userProfile(Model model)
    {
        User user = userService.getCurrentUser();

        model.addAttribute("user",user);
        return "/user-profile";
    }

    @RequestMapping(
            value = {"/user/details"},
            method = {RequestMethod.GET})
    public String userDetails(Model model)
    {
        User user = userService.getCurrentUser();

        model.addAttribute("user", user);
        return "/user-details";
    }

    @RequestMapping(
            value = {"/user/details/save-info"},
            method = {RequestMethod.POST})
    public String updateUserDetails(Model model, RedirectAttributes redAttrs,
                                    @RequestParam("username") String username,
                                    @RequestParam("email") String email,
                                    @RequestParam("avatar") MultipartFile avatar)
    {
        User user = userService.getCurrentUser();
        String avatarPath = null;
        try
        {
            user.setUsername(username);
            user.setEmail(email);

            if (!avatar.getOriginalFilename().isEmpty())
            {
                avatarPath = CustomFileUtils.uploadFile(avatar, this.externalResource);
                if (avatarPath == null)
                {
                    redAttrs.addFlashAttribute("result", "fail");
                    return "redirect:/user/details";
                }
                user.setAvatar(avatarPath);
            }
            userService.save(user);
        }catch (Exception ex){
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/user/details";
        }
        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/user/details";
    }

    @RequestMapping(
            value = {"/user/details/save-password"},
            method = {RequestMethod.POST})
    public String updateUserDetails(Model model, RedirectAttributes redAttrs,
                                    @RequestParam("current") String currentPassword,
                                    @RequestParam("new") String newPassword)
    {
        User user = userService.getCurrentUser();
        try
        {
            if(!bCryptPasswordEncoder.matches(currentPassword,user.getPassword())){
                redAttrs.addFlashAttribute("result", "fail");
                return "redirect:/user/details";
            }
            user.setPassword(newPassword);
            userService.save(user);
        }catch (Exception ex){
            redAttrs.addFlashAttribute("result", "fail");
            return "redirect:/user/details";
        }
        redAttrs.addFlashAttribute("result", "success");
        return "redirect:/user/details";
    }

}
