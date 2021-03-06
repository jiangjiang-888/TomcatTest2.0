<%--
  Created by IntelliJ IDEA.
  User: 江江江
  Date: 2020/6/3
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="main.*" %>
<%@ page import="static java.lang.Double.*" %>
<%@ page import="main.Dao.RegisterDao" %>
<%@ page import="main.Bean.UserBean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>销量清单</title>
    <link href="style/showitemstyle.css" rel="stylesheet" type="text/css"/>
    <link href="style/publicstyle.css" rel="stylesheet" type="text/css"/>


</head>
<body>

    <%
		request.setCharacterEncoding("UTF-8");

	%>


<body>
<div style="background-color:#D56F2B;height:45px; line-height:45px; color:white; text-align:right;padding-right:300px;">
    <%
        UserBean saler = (UserBean) request.getSession().getAttribute("saler");
        if (saler == null) {
            request.getRequestDispatcher("/SalerLoginIn.jsp").forward(request, response);

        } else {
            out.print("你好,销售員:" +saler.getUserName());
            out.print("<a href=ListItemServlet?act=loginout> 注销 </a>");
            out.print("  邮箱:" + saler.getUserEmail());
        }
    %>
</div>
<div class="wrap">


    <aside id="left">

        <div class="div">
            <b> <a href="ListItemServlet2">商品表</a>
            </b>
        </div>

        <div class="div">
            <b> <a href="ListSaleItemServet?action=sellorder">销量表 </a></b>
        </div>
        <div class="div">
            <b> <a href="ListSaleItemServet?action=salestate">销售情况 </a></b>
        </div>
        <div class="div">
            <b> <a href="ListUserBrowseTime">用户浏览情况 </a></b>
        </div>

    </aside>

    <section id="right">
        <div>

            <ul>
                <li><a href="ListSaleItemServet">全部商品</a></li>
                <li>
                    <form class="inputbg" action="ListSaleItemServet">
                        <input type="text" name="itemName" id="itemName"
                               placeholder="搜索……"> <input type="submit" value="确定">
                        <input type="text" name="action" value="sellorder" style="visibility: hidden;width: 0px;">
                    </form>
                </li>


            </ul>


        </div>
        <div style="overflow-x: auto; overflow-y: auto; height: 550px; width: 100% ;">


            <table>

                <tr>
                    <th>编号</th>
                    <th>名称</th>
                    <th>价格</th>
                    <th>销量</th>
                    <th>总价</th>

                </tr>

                <c:forEach items="${items}" var="s" varStatus="vs">

                    <tr>
                        <td>${s.itemId }</td>
                        <td>${s.itemName }</td>
                        <td>${s.itemPrice }</td>
                        <td>${s.itemSale }</td>
                        <td>${s.totalprice}</td>


                    </tr>

                </c:forEach>


            </table>
        </div>
    </section>
</div>


<div class="bottom">
    <label style="text-align:center;font-size:25px;color:#E87529;margin-top:5px;margin-right:5%;float:right;" >
        合计：￥<%out.print(request.getAttribute("totalprice"));%>
    </label>
<%--    <div class="bottom-totalprice" >合计：￥<%out.print(request.getAttribute("totalprice"));%></div>--%>
</div>

</body>
</html>