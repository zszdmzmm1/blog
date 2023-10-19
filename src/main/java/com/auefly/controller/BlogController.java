package com.auefly.controller;

import com.auefly.pojo.Post;
import com.auefly.pojo.User;
import com.auefly.service.BlogService;
import com.auefly.util.R;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.util.List;


@Controller
@EnableWebMvc
@EnableTransactionManagement
@MultipartConfig
public class BlogController {
    @Autowired
    private BlogService blogService;

    @GetMapping("posts")
    public String index(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "8") int perPage, Model model) {
        model.addAttribute("msg", R.ok(blogService.index(page, perPage)));
        model.addAttribute("page", page);
        int counts = blogService.postsCount();
        model.addAttribute("pageCount", (counts % perPage == 0) ? (counts / perPage) : (counts / perPage + 1));
        return "forward:page/posts.jsp";
    }

    @PostMapping("posts")
    public String store(@RequestPart MultipartFile cover, @RequestParam String content, @RequestParam String title, @RequestParam String description, HttpSession session) {
        User user = (User) session.getAttribute("user");
        System.out.println(content);
        Post post = new Post();
        post.setContent(content);
        post.setTitle(title);
        post.setDescription(description);
        String originalFilename = cover.getOriginalFilename();
        post.setCover(originalFilename);
        post.setUserId(user.getUid());
        blogService.store(post);
        return "redirect:./admin/posts";
    }

    @GetMapping("posts/{id}")
    public String show(@PathVariable int id, Model model) {
        model.addAttribute("msg", R.ok(blogService.show(id)));
        return "forward:/page/posts-show.jsp";
    }

    @PutMapping("posts/{id}")
    @ResponseBody
    public R update(@PathVariable int id, @RequestBody Post post) {
        return R.ok(blogService.update(id, post));
    }

    @DeleteMapping("posts/{id}")
    @ResponseBody
    public R delete(@PathVariable int id) {
        return R.ok(blogService.delete(id));
    }

    @PostMapping("delete-posts")
    @ResponseBody
    public R delete(@RequestParam String sId) {
        String[] idArray = sId.split(",");
        int[] id = new int[idArray.length];
        for (int i = 0; i < idArray.length; i++) {
            id[i] = Integer.parseInt(idArray[i]);
        }
        return R.ok(blogService.deletePosts(id));
    }

    @PostMapping("posts/search")
    public R search(@RequestBody String key) {
        Post post = new Post();
        post.setTitle(key);
        post.setDescription(key);
        List<Post> posts = blogService.search(post);
        return R.ok(posts);
    }

    @GetMapping("login")
    public String login() {
        return "forward:page/login.jsp";
    }

    @PostMapping("login")
    @ResponseBody
    public R login(String email, String password, String isRemember, HttpSession session, HttpServletResponse resp) {
        R response = blogService.login(email, password);
        if (response.getCode() == 200) {
            session.setAttribute("user", response.getData());
            Cookie cookie;
            Cookie cookie1;
            Cookie cookie2;
            if ("true".equals(isRemember)) {
                cookie = new Cookie("email", email);
                cookie1 = new Cookie("password", password);
                cookie2 = new Cookie("isChecked", "checked");
                cookie.setMaxAge(60 * 60 * 12);
                cookie1.setMaxAge(60 * 60 * 12);
                cookie2.setMaxAge(60 * 60 * 12);
            } else {
                cookie = new Cookie("email", null);
                cookie1 = new Cookie("password", null);
                cookie2 = new Cookie("isChecked", null);
                cookie.setMaxAge(0);
                cookie1.setMaxAge(0);
                cookie2.setMaxAge(0);
            }
            resp.addCookie(cookie);
            resp.addCookie(cookie1);
            resp.addCookie(cookie2);
        }
        return response;
    }

    @PostMapping("users/{id}")
    public String user(@PathVariable String id, Model model) {
        int userId = Integer.parseInt(id);
        model.addAttribute("postList", blogService.showByUser(userId));
        return "forward:../page/user-info.jsp";
    }

    @GetMapping("users/{id}")
    public String userGet(@PathVariable String id, Model model) {
        return user(id, model);
    }

    @GetMapping("admin/users")
    public String adminUser(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int perPage, Model model) {
        model.addAttribute("userList", blogService.getAPageUser(page, perPage));
        model.addAttribute("page", page);
        int counts = blogService.usersCount();
        model.addAttribute("count", counts);
        model.addAttribute("pageCount", (counts % perPage == 0) ? (counts / perPage) : (counts / perPage + 1));
        return "forward:../page/admin-users.jsp";
    }

    @GetMapping("admin/posts")
    public String adminPost(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int perPage, Model model) {
        model.addAttribute("postList", blogService.index(page, perPage));
        model.addAttribute("page", page);
        int counts = blogService.postsCount();
        model.addAttribute("count", counts);
        model.addAttribute("pageCount", (counts % perPage == 0) ? (counts / perPage) : (counts / perPage + 1));
        return "forward:../page/admin-posts.jsp";
    }

    @GetMapping("admin/posts/{id}/edit")
    public String postEdit(@PathVariable int id, Model model) {
        Post post = blogService.selectPostById(id);
        model.addAttribute("post", post);
        return "forward:../../../page/admin-update-post.jsp";
    }

    @PostMapping("admin/posts/{id}")
    public String postUpdate(@PathVariable int id, @RequestParam String content, @RequestParam String title, @RequestParam String description, HttpServletRequest request) {
        Post post = new Post();
        post.setContent(content);
        post.setTitle(title);
        post.setDescription(description);
        blogService.update(id, post);
        return "redirect:./admin/posts";
    }


    @GetMapping("admin/add-post")
    public String addPost() {
        return "forward:../page/admin-add-post.jsp";
    }

    @GetMapping("admin/dashboard")
    public String admin() {
        return "forward:../page/dashboard.jsp";
    }

    @GetMapping("logout")
    @ResponseBody
    public void logout(HttpSession session) {
        session.setAttribute("user", null);
    }

    @GetMapping("users/{id}/post")
    public String post(@PathVariable String id, Model model) {
        model.addAttribute("id", id);
        return "forward:../../page/add-post.jsp";
    }

    @GetMapping("register")
    public String register() {
        return "forward:./page/register.jsp";
    }
}