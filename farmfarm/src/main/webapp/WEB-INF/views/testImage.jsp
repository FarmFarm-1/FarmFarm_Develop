<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>File Upload</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <input type="file" id="file" style="display: none;" />
    <div id="upload">Upload a file</div>

    <script>
        $(document).ready(function() {
            $("#upload").click(function() {
                $("#file").click();
            });

            $("#file").change(function() {
                var file = this.files[0];

                var formData = new FormData();
                formData.append("file", file);

                $.ajax({
                    url: '/upload',  // S3Service의 uploadFile 메서드를 호출하는 엔드포인트를 입력하세요.
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(data) {
                        console.log("File uploaded successfully");
                    }
                });
            });
        });
    </script>
</body>
</html>