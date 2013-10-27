<%@ page import="photostools.*" %>
<%@ page import="java.io.File" %>


<%

    String rootPhotoDirectory = "E:\\USA\\";
    String requestDirectory = request.getParameter("d");
    String requestFile = request.getParameter("f") == null ? "" : request.getParameter("f");
    String requestFC = request.getParameter("fc") == null ? "" : request.getParameter("fc");

    String currentDirectory = rootPhotoDirectory;
    if (requestDirectory != null) {
        currentDirectory = currentDirectory + requestDirectory + "\\";
    } else {
        requestDirectory = "";
    }

    if (!requestFC.equals("")) {
        PhotoReader.sendFile(rootPhotoDirectory + requestFC, response);
        return;
    }


%>
<html>
<body>

<table>
    <tr>
        <td width="20%" valign="top">

            <a href="index.jsp">..</a>

            <% for (File file : PhotoReader.listDirectories(currentDirectory)) { %>
                <% if (file.isDirectory()) {%> <br> <a href="index.jsp?d=<%=requestDirectory + "\\" + file.getName()%>"><%=file.getName()%></a> <% } %>
            <% } %>

            <br><br>

            <% for (File file : PhotoReader.listDirectories(currentDirectory)) { %>
                <% if (file.isFile()) {%> <a href="index.jsp?f=<%=requestDirectory + "\\" + file.getName()%>&d=<%=requestDirectory%>"><%=file.getName()%></a><br> <% } %>
            <% } %>
        </td>
        <td width="80%" valign="top">
            <% if (!requestFile.equals("")) { %>
                <img src="index.jsp?fc=<%=requestFile%>" width="800">
            <% } %>
        </td>
    </tr>
</table>


</body>
</html>
