package io.inhyuck.tuipractice.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UploadFile {
    private int id;
    private int articleId;
    private String originName;
    private String storedName;
    private int size;
}