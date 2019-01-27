package io.inhyuck.tuipractice.mapper;

import org.apache.ibatis.annotations.Mapper;

import io.inhyuck.tuipractice.domain.Article;

@Mapper
public interface ArticleMapper {
    Article findOne(int id);
    int save(Article article);
}