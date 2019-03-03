// deps for editor
require('codemirror/lib/codemirror.css'); // codemirror
require('tui-editor/dist/tui-editor.css'); // editor ui
require('tui-editor/dist/tui-editor-contents.css'); // editor content
require('highlight.js/styles/github.css'); // code block highlight

var Editor = require('tui-editor');

var editor = new Editor({
    el: document.querySelector('#editSection'),
    initialEditType: 'markdown',
    previewStyle: 'vertical',
    height: '300px'
});

var formSubmitButton = document.querySelector("#form-submit");
formSubmitButton.addEventListener('click', function() {
    var contents = document.querySelector("#contents");

    // contents.value = editor.getMarkdown(); //markdown 저장
    contents.value = editor.getHtml(); //html 저장
    alert(contents.value);
});

