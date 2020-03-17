<%@page import="java.util.List"%>
<%@page import="com.exam.view.domain.ExamRIO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page import="com.exam.*" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<!-- controller에서 model의 name이라는 attribute의 값을 가져옴 -->
이름 : ${name} <br>
<!-- controller에서 model의 addr이라는 attribute의 값을 가져옴 -->
주소 : ${addr} <br>

<!-- 데이블 생성 -->
<!-- 안에서 데이터를 뿌려줄것임 -->
<!-- c:choose 태그는 다중 조건을 처리할 때 씀 -->
<!-- c:choose 안에서 when과 otherwise사용하면서 조건을 처리-->
<!-- when조건 사용시 test적어줌 -->
<!-- 조건 안에 empty는 "~없을 때" 라는 조건이다.-->
<!-- 그리고 examRIO형의 데이터를 가져오는데 controller에서 넣을때 attribute이름을 exam이라 지었다. -->
<!-- 그래서 examRIO형의 exam.get....()로 getter메소드를 가져올 수 있는 것이다. -->
<hr>
<table cellspacing=1 width=600 border=1>
	<c:choose>
		<c:when test="${empty exam}">
			<tr>
				<td colspan=3>
					exam 없다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td width=50><p align=center>${exam.name}</p></td>
				<td width=50><p align=center>${exam.studentid}</p></td>
				<td width=50><p align=center>${exam.kor}</p></td>
				<td width=50><p align=center>${exam.eng}</p></td>
				<td width=50><p align=center>${exam.mat}</p></td>
			</tr>
		</c:otherwise>
	</c:choose>
</table>
<hr>
<!-- c:forEach태그를 통해 반복문을 할 수 있다. -->
<!-- c:forEach 문에 items로 가져올 데이터를 선택한다. -->
<!-- 그다음에  var 속성에 변수를 설정함으로서 , 가져온 데이터에 사용할 이름을 정해준다. -->
<table cellspacing=1 width=600 border=1>
	<c:choose>
		<c:when test="${empty exams}">
			<tr>
				<td colspan=3>
					exams 없다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${exams}" var="e">
				<tr>
					<td width=50><p align=center>${e.name}</p></td>
					<td width=50><p align=center>${e.studentid}</p></td>
					<td width=50><p align=center>${e.kor}</p></td>
					<td width=50><p align=center>${e.eng}</p></td>
					<td width=50><p align=center>${e.mat}</p></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<hr><hr>
아래는 Scriptlet 방식(Spring에서는 잘 사용하지 않음)
<hr>
<%
	//getAttribute를 통해서 모델에 저장된 이름을 가져온다.
	//형변환을 통해 모델에 담긴 object형을 string에 담는다.
	String name = (String)request.getAttribute("name");		//이름
	String addr = (String)request.getAttribute("addr");		//주소
	out.println("이름 : " + name + "<br>");
	out.println("주소 : " + addr + "<br>");
%>
<hr>
<%
	//getAttribute를 통해서 모델이 저장된 값을 가져온다.
	//형변환을 통해 ExamRIO형태로 변수에 담는다.
	ExamRIO exam = (ExamRIO) request.getAttribute("exam");
%>
	<!-- 테이블 생성 -->
	<table cellspacing=1 width=600 border=1>
		<tr>
		<tr>
			<td width=50><p align=center><%=exam.getName() %></p></td>
			<td width=50><p align=center><%=exam.getStudentid() %></p></td>
			<td width=50><p align=center><%=exam.getKor() %></p></td>
			<td width=50><p align=center><%=exam.getEng() %></p></td>
			<td width=50><p align=center><%=exam.getMat() %></p></td>
		</tr>
	</table>
<%
	//getAttribute를 통해서 모델이 저장된 값을 가져온다.
	//형변환을 통해 List<ExamRIO> 형태로 변수에 담는다.
	List<ExamRIO> exams = (List<ExamRIO>)request.getAttribute("exams");
%>
<hr>
	<!-- 테이블 생성 -->
	<!-- 반복문인 for문을 통해 list에 담긴 값들을 size갯수만큼(전체) 출력한다. -->
	<table cellspacing=1 width=600 border=1>
		<%for(int i = 0;i < exams.size(); i++){ %>
			<tr>
				<td width=50><p align=center><%=exams.get(i).getName() %></p></td>
				<td width=50><p align=center><%=exams.get(i).getStudentid() %></p></td>
				<td width=50><p align=center><%=exams.get(i).getKor() %></p></td>
				<td width=50><p align=center><%=exams.get(i).getEng() %></p></td>
				<td width=50><p align=center><%=exams.get(i).getMat() %></p></td>
			</tr>
		<%} %>
	</table>
</body>
</html>
