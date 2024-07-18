<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>

<%@page import="org.hibernate.Session"%>
<%@page import=" com.entities.Note"%>
<%@page import=" org.hibernate.query.Query"%>
<%@page import=" com.helper.FactoryProvider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<%@include file="all_js_css.jsp"%>

</head>
<body>

	<div >
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		</div>
		
		<br>
		<h1 class="text-uppercase"></h1>


		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Note note = (Note) s.get(Note.class, noteId);
		%>

		<form action="UpdateServlet" method="post" class="container">
		<input value="<%=note.getId() %>" name="noteId"  type="hidden"></input>
			<div class="form-group">
				<label for="title">Note Title</label> 
				<input required name="title"
					type="text"
					 class="form-control" 
					 id="title"
					aria-describedby="emailHelp" 
					placeholder="Enter here"
					value="<%=note.getTitle() %>"
					>
			</div>


			<div class="form-group">
				<label for="Content">Note Content </label>
				<textarea required name="content" id="content"
					placeholder="Enter your content here" class="form-control text-start"
					style="height: 300px; text-align:left">
					<%=note.getContent() %>
					</textarea>
			</div>

			<div class="container text-center		">
				<button type="submit" class="btn" style="background:#aa00ff; color:white">Save your note.</button>
			</div>
		</form>
	</div>
</body>
</html>