package com.auefly.controller;

import com.auefly.pojo.Post;
import com.auefly.service.BlogService;
import com.auefly.util.R;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import java.util.List;


@Controller
@EnableWebMvc
@EnableTransactionManagement
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
    @ResponseBody
    public R store(@RequestBody Post post) {
        return R.ok(blogService.store(post));
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
}