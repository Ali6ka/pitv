package kg.edu.iaau.pitv.controller;


import kg.edu.iaau.pitv.model.Block;
import kg.edu.iaau.pitv.model.Role;
import kg.edu.iaau.pitv.utils.CustomFileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.User;
import kg.edu.iaau.pitv.model.Post;
import kg.edu.iaau.pitv.service.BlockService;
import kg.edu.iaau.pitv.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class HomeController {

    @Value("${system.app.external.resource.location}")
    private String externalResource;

    @Autowired
    BlockService blockService;

    @Autowired
    PostService postService;

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

    /********************************** POST **********************************/
    @RequestMapping(
            value = {"/post/list"},
            method = {RequestMethod.GET})
    public String postList(Model model)
    {
        Object principal = SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();

        String user = ((User) principal).getUsername();

        List<Post> posts = postService.getAllByAuthor(user);

        model.addAttribute("posts",posts);
        return "/post-list";
    }

    @RequestMapping(
            value = {"/post/new"},
            method = {RequestMethod.GET})
    public String postAdd(Model model)
    {
        List<Block> blocks = blockService.getAll();
        List<Role> roles =

        model.addAttribute("blocks",blocks);
        return "/post-form";
    }

/*    @RequestMapping(
            value = {"/dashboard/block/update/{id}"},
            method = {RequestMethod.GET})
    public String blockUpdate(Model model, @PathVariable("id") int id)
    {
        Block block = blockService.getById(id);
        List<Role> roles = roleService.getAll();

        model.addAttribute("block", block);
        model.addAttribute("roles", roles);

        return "admin/block-form";
    }*/

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

            Object principal = SecurityContextHolder.getContext()
                    .getAuthentication().getPrincipal();


            post.setTitle(title);
            post.setDate(new java.sql.Date(currentDate.getTime()));
            post.setDateUntil(lastDate);
            post.setAuthor(((User) principal).getUsername());

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

}
