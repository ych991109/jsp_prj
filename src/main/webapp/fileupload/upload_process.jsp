<%@page import="org.apache.coyote.http11.filters.SavedRequestInputFilter"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="multipart/form-data인 경우 web parameter가 전달되지 않는다."%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://192.168.10.216/html_prj/common/images/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="http://192.168.10.216/html_prj/common/css/main_20240911.css">
<!-- bootstrap CDN 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝-->

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">

</style>
<script type="text/javascript">
$(function(){

});//ready

</script>
</head>
<body>
<div id="wrap">
<%-- 
web parameter가 전달되지 않는다.
업로더<%= request.getParameter("uploader")  %><br>
EL : ${ param.uploader }<br> --%>
요청방식 : <%= request.getMethod() %><br>
<%
Boolean uploadFlag = (Boolean) session.getAttribute("uploadFlag");
if (uploadFlag == null) {
    uploadFlag = false; // 기본값으로 false 설정
}

if (!uploadFlag) {
    // 1. 업로드된 파일의 저장 디렉토리 얻기
    File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
    // 2. 업로드 파일의 최대 크기(byte > Kbyte > Mbyte > Gbyte)
    int maxSize = 1024 * 1024 * 10; // 10Mbyte까지의 파일만 업로드 가능, 초과 예외발생(예외처리 X)
    int uploadSize = 1024 * 1024 * 600; // 큰 파일도 업로드는 가능하도록 설정

    // 3. FileUpload Component를 생성 - 생성과 동시에 업로드가 진행
    try {
        MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), uploadSize, "UTF-8", new DefaultFileRenamePolicy());

        // 웹 파라메터 받기 (request가 아닌 MultipartRequest 파일 컴포넌트를 사용하여 파라메터를 받는다.)
        String uploader = mr.getParameter("uploader");
        String[] extArr = mr.getParameterValues("ext");

        // 파일 처리
        // 원본파일명
        String originName = mr.getOriginalFileName("upfile");
        // 변경된 파일명
        String fileSysName = mr.getFilesystemName("upfile");

        // 업로드된 파일이 최대 크기를 초과하는지 체크
        File uploadFile = new File(saveDir.getAbsolutePath() + "/" + fileSysName);
        if (uploadFile.length() > maxSize) { // 업로드 최대 크기를 초과
            uploadFile.delete(); // 업로드된 파일 삭제
%>
            <div class='alert alert-danger'>
                <%= originName %>은 10Mbyte( <%= maxSize %>)를 초과합니다.<br>
                업로드 파일을 크기 내의 파일로 변환하여 업로드 해주세요<br>
                <a href="javascript:history.back()">이전으로</a>
            </div>
<%
        } else {
%>
            <h2>파일업로드 성공</h2>
            <div>
                업로더 : <%= uploader %><br>
                확장자 : <%
                    if (extArr == null) {
                        out.print("선택 확장자 없음");
                    } else {
                        for (String tempExt : extArr) {
                            out.print(tempExt);
                            out.print("&nbsp");
                        }
                    }
                %>
                <br>
                원본파일명 : <%= originName %><br>
                변경파일명 : <%= fileSysName %>
                <img src="http://localhost/jsp_prj/upload/<%= fileSysName %>"/><br>
                <a href="file_list.jsp">파일리스트보기</a>
            </div>
<%
        } // end else
    } catch (Exception e) {
        e.printStackTrace();
%>
        <div class='alert alert-danger'>파일 업로드 실패</div>
<%
    } // end catch

    session.setAttribute("uploadFlag", true);
} // end if
%>

</div>
</body>
</html>
