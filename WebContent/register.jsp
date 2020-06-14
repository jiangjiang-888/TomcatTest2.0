<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册</title>
    <link href="style/loginstyle.css" rel="stylesheet" type="text/css"/>
    <script>
        function sel1(obj) {
            if (obj.checked) {
                //如果当前项被选中了
                document.all.chk2.checked = false
                //则不能选择第二组
                document.all.sel1.selectedIndex = 4
                //指定下拉框中选择的项
            }
        }

        function sel2(obj) {
            if (obj.checked) {
                //如果当前项被选中了
                document.all.chk1.checked = false
                //则不能选择第一组
                document.all.sel1.selectedIndex = 0
                //指定下拉框中选择的项
            }
        }


    </script>
</head>
<body>
<%
    String wrong = (String) request.getAttribute("DBMes");
    if (wrong != null) out.print("<script language=javascript>alert('" + wrong + "')</script>");
%>
<div class="divForForm">


    <div class="fromForUser">
        <br/>
        <h2>注册</h2>
        <br/>
        <br/>
        <form action="RegisterServlet" method="post">

            <label>账号: </label>
            <input class="inputForUser" type="text" name="userName" value="${formBean.userName}">

            <span>${formBean.errors.userName}</span>
            <br/>
            <label>输入密码:</label>
            <input class="inputForUser" type="password" name="userPassWord" value="${formBean.userPwd}"/>
            <span>${formBean.errors.userPwd}</span>
            <br/>
            <label>再次输入密码: </label>
            <input class="inputForUser" type="password" name="userPassWord2" value="${formBean.userPwd2}"/>
            <span>${formBean.errors.userPwd2}</span>
            <br/>
            <label>邮箱:</label>
            <input class="inputForUser" type="text" name="userEmail" value="${formBean.userEmail}"/>
            <span>${formBean.errors.userEmail}</span>
            <br/>

            <label>性别:</label>
            <div>
                <input type="checkbox" name="userSex" value="男" id="chk1"
                       onClick="sel1(this)"/>男
                <input type="checkbox" name="userSex" value="女" id="chk2" onClick="sel2(this)">女

            </div>
            <span>${formBean.errors.userSex}</span>

            <br/> <label>联系电话:</label> <input class="inputForUser" type="text"
                                              name="userPhone"
                                              value="${formBean.userPhone}"/><span>${formBean.errors.userPhone}</span>
            <br/> <label>邮寄地址:</label> <input
                class="inputForUser" type="text" name="userAddr" value="${formBean.userAddr}"/>
            <span>${formBean.errors.userAddr}</span><br/> <br/>
            <br/> <input class="clickbutton" type="submit" value="提交"/>
        </form>


    </div>

</div>


</body>
</html>