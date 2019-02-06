<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Article New</title>

<!-- tui-file-uploader -->
<script src="/tui-file-uploader/jquery/dist/jquery.js"></script>
<script src="/tui-file-uploader/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script src="/tui-file-uploader/tui-file-uploader/dist/tui-file-uploader.js"></script>
<link rel="stylesheet" href="/tui-file-uploader/tui-file-uploader/dist/tui-file-uploader.css" />

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
    <!-- tui-file-uploader script -->
    <script>
        var uploader = new tui.FileUploader($('#uploader'), {
            url: {
                send: "http://localhost:8080/article/create",
            },
            isMultiple: true,
            isBatchTransfer: true,
            listUI: {
                type: 'table',
                columnList: [
                    {
                        header: '{{checkbox}}',
                        body: '{{checkbox}}',
                        width: 32
                    },
                    {
                        header: 'File Name',
                        body: '<span class="tui-filename-area"><span class="tui-file-name" style="max-width:480px;">{{filename}}</span></span>',
                        width: 500
                    },
                    {
                        header: 'File Size',
                        body: '{{filesize}}'
                    }
                ]
            }
        });

        var $uploadedCount = $('#uploadedCount');
        var $itemTotalSize = $('#itemTotalSize');
        var $checkedItemCount = $('#checkedItemCount');
        var $checkedItemSize = $('#checkedItemSize');
        var $removeButton = $('.tui-btn-cancel');

        // below service code
        function disableRemoveButton(state) {
            var className = 'tui-is-disabled';

            if (state) {
                $removeButton.addClass(className);
            } else {
                $removeButton.removeClass(className);
            }

            $removeButton.prop('disabled', state);
        }

        function updateCheckedInfo(size, count) {
            $checkedItemSize.html(size);
            $checkedItemCount.html(count);
        }

        function setUploadedCountInfo(count) {
            $uploadedCount.html(count);
        }

        function resetInfo() {
            $itemTotalSize.html('0 KB');
            $checkedItemSize.html('0 KB');
            $checkedItemCount.html('0');
        }

        uploader.on('update', function(evt) { // This event is only fired when using batch transfer
            var items = evt.filelist;
            var totalSize = uploader.getTotalSize(items);

            $itemTotalSize.html(totalSize);
        });

        uploader.on('check', function(evt) {
            var checkedItems = uploader.getCheckedList();
            var checkedItemSize = uploader.getTotalSize(checkedItems);
            var checkedItemCount = checkedItems.length;
            var removeButtonState = (checkedItemCount === 0);

            disableRemoveButton(removeButtonState);
            updateCheckedInfo(checkedItemSize, checkedItemCount);
        });

        uploader.on('checkAll', function(evt) {
            var checkedItems = uploader.getCheckedList();
            var checkedItemSize = uploader.getTotalSize(checkedItems);
            var checkedItemCount = checkedItems.length;
            var removeButtonState = (checkedItemCount === 0);

            disableRemoveButton(removeButtonState);
            updateCheckedInfo(checkedItemSize, checkedItemCount);
        });

        uploader.on('remove', function(evt) {
            var checkedItems = uploader.getCheckedList();
            var removeButtonState = (checkedItems.length === 0);

            disableRemoveButton(removeButtonState);
            setUploadedCountInfo(0);
            resetInfo();
        });

        uploader.on('success', function(evt) { //전송 성공시
            var successCount = evt.success;
            var removeButtonState = (successCount > 0);

            $uploadedCount.html(successCount);

            disableRemoveButton(removeButtonState);
            setUploadedCountInfo(successCount);
            resetInfo();

            alert("전송 성공!");
        });

        uploader.on('error', function(evt) { //전송 실패시
            console.log(evt.status);
        });

        $removeButton.on('click', function() {
            var checkedItems = uploader.getCheckedList();

            uploader.removeList(checkedItems);
        });
    </script>
</body>
</html>