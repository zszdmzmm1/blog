package com.auefly.controller;

import com.auefly.pojo.Post;
import com.auefly.service.BlogService;
import com.auefly.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;


@Controller
@EnableWebMvc
@EnableTransactionManagement
public class BlogController {
    @Autowired
    private BlogService blogService;

    @GetMapping("posts")
    public String index(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "4") int perPage, Model model) {
        model.addAttribute("msg", R.ok(blogService.index(page, perPage)));
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
    @ResponseBody
    public R search(@RequestBody Post post) {
        return R.ok(blogService.search(post));
    }
}
