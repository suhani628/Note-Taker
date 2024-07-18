
<%@page import="java.util.List"%>

<%@page import="org.hibernate.Session"%>
<%@page import=" com.entities.Note"%>
<%@page import=" org.hibernate.query.Query"%>
<%@page import=" com.helper.FactoryProvider"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All notes</title>
<%@include file="all_js_css.jsp"%>

</head>
<body>
	<div class="container-fluid p-0 m-0 ">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-center text-uppercase " style ="color:#aa00ff">All Notes</h1>
		</div>
		<div class=" container row mx-auto">
		<div class="col-12 ">
		    <%
		Session s = FactoryProvider.getFactory().openSession();
        Query q=s.createQuery("from Note");
       List<Note> list= q.list();
       for(Note note:list){
    	   %>
    	   <div class="card mt-3 " style=" margin:auto" >
  <img class="card-img-top mt-3 mx-auto" style="max-width:100px " src="image/post-it.png" alt="Card image cap">
  <div class="card-body px-5 mt-0">
    <h5 class="card-title text-center"><%= note.getTitle() %></h5>
    <p class="card-text">
    <%=
    note.getContent()
    %>
    </p>
    <p ><b class="text-primary"><%= note.getAddedDate() %></b></p>
    <div class="container text-center mt-2">
    
    <a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
    
    <a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
    </div>
  </div>
</div>
    	   
      <% 
       }
		s.close();
		%>
		</div>
		</div>
		
	
</body>
</html>