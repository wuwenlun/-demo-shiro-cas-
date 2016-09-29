<%@ tag language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="pageNum" type="java.lang.Integer" required="true" rtexprvalue="true" %>
<%@ attribute name="pageSize" type="java.lang.Integer" required="true" rtexprvalue="true" %>
<%@ attribute name="pageRange" type="java.lang.Integer" required="true" rtexprvalue="true" %>
<%@ attribute name="pages" type="java.lang.Integer" required="true" rtexprvalue="true" %>
<%@ attribute name="jumpFunction" type="java.lang.String" required="true" rtexprvalue="true" %>
<%
	long begin = Math.max(1, pageNum - pageRange/2);
	long end = Math.min(begin + (pageRange-1),pages);
	
	request.setAttribute("p_begin", begin);
	request.setAttribute("p_end", end);
%>
 <% if (pages >= 1){%>
 
  


	
		 <% if (pageNum!=1){%>
               	<li><a href="javascript:<%=jumpFunction%>(<%=pageSize%>,1)">首页</a></li>
                <li><a href="javascript:<%=jumpFunction%>(<%=pageSize%>,<%=pageNum-1%>)">上一页</a></li>
         <%}else{%>
        
         <%}%>
 
		<c:forEach var="i" begin="${p_begin}" end="${p_end}">
            <c:choose>
                <c:when test="${i == pageNum}">
                    <li class="active"><a href="javascript:void(0);">${i}</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="javascript:<%=jumpFunction%>(<%=pageSize%>,${i})">${i}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
			
	  	 <% if (!pageNum.equals(pages)){%>
       		 <li><a href="javascript:<%=jumpFunction%>(<%=pageSize%>,<%=pageNum+1%>)">下一页</a></li>
                <li><a href="javascript:<%=jumpFunction%>(<%=pageSize%>,<%=pages%>)">末页</a></li>
         <%}else{%>
         
         <%}%>
        
 <% }%>