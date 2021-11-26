<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<body>
<h2>Hello World!</h2>
</body>
<%
     // 1 注册驱动
    // 2  获取链接
    InitialContext initialContext = new InitialContext();
    DataSource ds =(DataSource)  initialContext.lookup("");
    Connection connection = ds.getConnection();
    // 3 准备状态
    PreparedStatement preparedStatement = connection.prepareStatement("select *from news_detail");
    // 4 查询
    ResultSet resultSet = preparedStatement.executeQuery();
    // 5 遍历结
    while (resultSet.next()) {
        out.print(resultSet.getInt(1) + " " + resultSet.getInt(2) +""
        +resultSet.getString(3)+resultSet.getString(4)

        );
        out.println("<br>");
    }
    // 6 关闭资源
    resultSet.close();
    preparedStatement.close();

%>
</html>
