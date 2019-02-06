<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Article New</title>

<!-- tui-editor -->
<script src="/tui-editor/jquery/dist/jquery.js"></script>
<script src='/tui-editor/markdown-it/dist/markdown-it.js'></script>
<script src="/tui-editor/to-mark/dist/to-mark.js"></script>
<script src="/tui-editor/tui-code-snippet/dist/tui-code-snippet.js"></script>
<script src="/tui-editor/codemirror/lib/codemirror.js"></script>
<script src="/tui-editor/highlightjs/highlight.pack.js"></script>
<script src="/tui-editor/squire-rte/build/squire-raw.js"></script>
<link rel="stylesheet" href="/tui-editor/codemirror/lib/codemirror.css">
<link rel="stylesheet" href="/tui-editor/highlightjs/styles/github.css">

</head>
<body>
    <div>
        <h1>new Article</h1>
        <form method="POST">
            <h1><label>title</label></h1>
            <input type="text" name="title">

            <h1><label>contents</label></h1>

            <!-- tui-editor input -->
            <input type="text" name="contents" id="contents" hidden>
            <!-- tui-editor view -->
            <div class="code-html">
                <script src="/tui-editor/tui-editor/dist/tui-editor-Editor.js"></script>
                <link rel="stylesheet" href="/tui-editor/tui-editor/dist/tui-editor.css">
                <link rel="stylesheet" href="/tui-editor/tui-editor/dist/tui-editor-contents.css">
                
                <div id="editSection"></div>
            </div>
            <script class="code-js">
                var editor = new tui.Editor({
                    el: document.querySelector('#editSection'),
                    initialEditType: 'markdown',
                    previewStyle: 'vertical',
                    height: '300px'
                });
            </script>

            <button type="submit" id="form-submit">OK</button>
        </form>
    </div>

    <script>
        var formSubmitButton = document.querySelector("#form-submit");
        formSubmitButton.addEventListener('click', function() {
            var contents = document.querySelector("#contents");

            // contents.value = editor.getMarkdown(); //markdown 저장
            contents.value = editor.getHtml(); //html 저장
            alert(contents.value);
        });
    </script>
</body>
</html>