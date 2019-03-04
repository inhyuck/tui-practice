require('tui-file-uploader/dist/tui-file-uploader.css');

var $ = require('jquery');
var FileUploader = require('tui-file-uploader');

var uploader = new FileUploader($('#uploader'), {
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