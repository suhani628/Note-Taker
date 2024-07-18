package com.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import com.entities.Note;
import com.helper.FactoryProvider;
//import com.mysql.cj.xdevapi.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
		String title=	request.getParameter("title");
		String content=	request.getParameter("content");
            Note note=new Note(title,content,new Date());
            System.out.println(note.getId()+" :"+note.getTitle() );
			Session s= FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
			s.save(note);
			tx.commit();
			s.close();
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<h1 text-align:center;>note is added.</h1>");
			out.println( "<h1 text-align:center;><a href='all_notes.jsp'>all</a></h1>");
            
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
