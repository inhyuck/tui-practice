package io.inhyuck.tuipractice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import io.inhyuck.tuipractice.domain.Article;
import io.inhyuck.tuipractice.mapper.ArticleMapper;

@Controller
@RequestMapping("/article")
public class ArticleController {
    
    @Autowired
    private ArticleMapper articleMapper;
    
    @GetMapping("/{id}")
    public String findOne(@PathVariable("id") int id, Model model) {
        Article article = articleMapper.findOne(id);
        model.addAttribute("article", article);
        return "article";
    }

    @GetMapping("create")
    public String createArticle(Model model) {
        Article article = new Article();
        model.addAttribute("article", article);
        return "new";
    }

    @PostMapping("create")
    public String createArticle(Article article, Model model) {
        articleMapper.save(article);
        model.addAttribute("id", article.getId());
        return "success";
    }
}