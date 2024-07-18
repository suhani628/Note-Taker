<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
     <%@include file="all_js_css.jsp" %>

<title>Add Notes</title>
</head>
<body>
<div class="container-fluid p-0 m-0 ">
     <%@include file="navbar.jsp" %>
   </div>
   <div class="container text-center">
   <h1 style ="color:#aa00ff ">Please fill your note details.</h1>
   </div>
   <!--  add forms  -->
   <form action="SaveNoteServlet" method="post" class="container">
  <div class="form-group">			  		 
    <label for="title">Note Title</label>
    <input required 
    name="title"
    type="text"
     class="form-control" 
     id="title" 
     aria-describedby="emailHelp" 
     placeholder="Enter here">
  </div>
  
  
  <div class="form-group">
    <label for="Content">Note Content </label>
    <textarea required 
    name="content"
     id="content"
     placeholder="Enter your content here"
     class="form-control"
     style="height:300px"
     ></textarea>
  </div>
  
  <div class="container text-center		" >
    <button type="submit" class="btn btn-primary">Submit</button>
  </div>
</form>

</body>
</html>