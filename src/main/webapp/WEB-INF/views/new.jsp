<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Article New</title>

</head>
<body>
    <!-- tui-file-uploader view -->
    <div class="file-uploader-wrapper" style="width: 698px">
        <div id="uploader" class="tui-file-uploader">
            <label>title</label>
            <input type="text" name="title">

            <label>contents</label>
            <input type="text" name="contents">

            <div class="tui-file-uploader-header">
                <span class="tui-file-uploader-tit">File Uploader</span>
                <span class="tui-file-upload-msg"><span id="uploadedCount">0</span> files successfully uploaded</span>
                <div class="tui-btn-area">
                    <button type="button" class="tui-btn tui-btn-cancel tui-is-disabled" disabled>Remove</button>
                    <label class="tui-btn tui-btn-upload">
                        <span class="tui-btn-txt">Add files</span>
                        <input type="file" name="userfile[]" class="tui-input-file">
                    </label>
                </div>
            </div>
            <div class="tui-js-file-uploader-list tui-js-file-uploader-dropzone tui-file-uploader-area tui-has-scroll">
                <div class="tui-dropzone-contents">
                    <span class="tui-dropzone-msg">Drop files here.</span>
                </div>
            </div>
            <div class="tui-file-uploader-info">
                <span class="tui-info-txt">Selected <em class="tui-spec"><span id="checkedItemCount">0</span> files</em> (<span id="checkedItemSize">0 KB</span>)</span>
                <span class="tui-info-txt">Total <span id="itemTotalSize">0 KB</span></span>
            </div>
            <div class="tui-btn-submit">
                <button type="submit" class="tui-btn tui-btn-large">OK</button>
            </div>
        </div>
    </div>
    <script src="/dist/newBundle.js"></script>
</body>
</html>