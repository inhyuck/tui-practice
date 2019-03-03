<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Article New</title>

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
            <div id="editSection"></div>
            
            <button type="submit" id="form-submit">OK</button>
        </form>
    </div>
    <script src="/dist/newBundle.js"></script>
</body>
</html>