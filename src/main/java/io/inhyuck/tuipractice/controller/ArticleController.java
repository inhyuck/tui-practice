package io.inhyuck.tuipractice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import io.inhyuck.tuipractice.domain.Article;
import io.inhyuck.tuipractice.mapper.ArticleMapper;
import io.inhyuck.tuipractice.service.UploadFileService;

@Controller
@RequestMapping("/article")
public class ArticleController {
    
    @Autowired
    private ArticleMapper articleMapper;
    @Autowired
    private UploadFileService uploadFileService;
    
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
    @ResponseBody
    public Article createArticle(Article article, @RequestParam(name="userfile[]") List<MultipartFile> multipartFiles, Model model) {
        articleMapper.save(article);
        uploadFileService.storeFileInLocal(multipartFiles, article.getId());
        return article;
    }
}