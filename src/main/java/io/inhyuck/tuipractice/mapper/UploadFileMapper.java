package io.inhyuck.tuipractice.mapper;

import org.apache.ibatis.annotations.Mapper;

import io.inhyuck.tuipractice.domain.UploadFile;

@Mapper
public interface UploadFileMapper {
    int save(UploadFile uploadFile);
}