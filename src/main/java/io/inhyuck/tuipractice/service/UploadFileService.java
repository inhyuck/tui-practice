package io.inhyuck.tuipractice.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import io.inhyuck.tuipractice.domain.UploadFile;
import io.inhyuck.tuipractice.mapper.UploadFileMapper;

@Service
public class UploadFileService {
    //파일을 저장할 로컬 경로
    static final String FILE_PATH = "/Users/inhyuck/dev/upload";

    @Autowired
    private UploadFileMapper uploadFileMapper;

    public List<UploadFile> storeFileInLocal(List<MultipartFile> multipartFiles, int articleId) {
        if (multipartFiles == null) {
            return null;
        }

        List<UploadFile> uploadFileList = new ArrayList<>();

        for (MultipartFile file : multipartFiles) {
            String originName = Paths.get(file.getOriginalFilename()).getFileName().toString();
            String storedName = getNewName(originName);
            Path filePath = getFilePath(storedName);

            UploadFile uploadFile = UploadFile.builder()
                                            .articleId(articleId)
                                            .originName(originName)
                                            .storedName(storedName)
                                            .size((int)file.getSize())
                                            .build();
            // db에 파일 meta정보 저장
            uploadFileMapper.save(uploadFile);
            uploadFileList.add(uploadFile);

            // 서버 로컬에 저장
            try {
                Files.write(filePath, file.getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return uploadFileList;
    } 

    //파일 저장시 변경할 이름
    private String getNewName(String originName) {
        return "stored-" + System.nanoTime() + originName;
    }

    private Path getFilePath(String storedName) {
        return Paths.get(FILE_PATH, storedName);
    }
}