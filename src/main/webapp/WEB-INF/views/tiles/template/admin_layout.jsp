<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<c:if test="${noLayout eq null}">
	<tiles:insertAttribute name="admin_header"/>
	<tiles:insertAttribute name="admin_nav"/>
</c:if>
<tiles:insertAttribute name="admin_content"/>
<c:if test="${noLayout eq null}">
	<tiles:insertAttribute name="admin_footer"/>
</c:if>