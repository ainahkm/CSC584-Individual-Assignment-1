<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%!
    private static String esc(Object o) 
{
        if (o == null) return "";
        String s = o.toString();
        StringBuilder sb = new StringBuilder(s.length() + 16);
        for (int i = 0; i < s.length(); i++) 
        {       
            char c = s.charAt(i);
            switch (c) 
            {
                case '<':  sb.append("&lt;");   break;
                case '>':  sb.append("&gt;");   break;
                case '&':  sb.append("&amp;");  break;
                case '"':  sb.append("&quot;"); break;
                case '\'': sb.append("&#39;");  break;
                default:   sb.append(c);
            }
        }
        return sb.toString();
}
%>
<%
    String name         = (String) request.getAttribute("name");
    String studentId    = (String) request.getAttribute("studentId");
    String programme    = (String) request.getAttribute("programme");
    String email        = (String) request.getAttribute("email");
    String introduction = (String) request.getAttribute("introduction");
    String photoDataUri = (String) request.getAttribute("photoDataUri");
    @SuppressWarnings("unchecked")
    List<String> hobbyList = (List<String>) request.getAttribute("hobbyList");

    if (name == null) 
    {
        response.sendRedirect("index.html");
        return;
    }
    boolean hasPhoto = photoDataUri != null && !photoDataUri.isEmpty();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><%= esc(name) %> | Portfolio</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@600&family=Fredoka:wght@500;600;700&family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
</head>
<body class="page-profile">

  <main class="sheet">

    <!-- part gambar dgn greeting-->
    <section class="hero">
      <figure class="polaroid">
        <span class="tape" aria-hidden="true"></span>
        <% if (hasPhoto) { %>
          <img src="<%= photoDataUri %>" alt="Photo of <%= esc(name) %>">
        <% } else { %>
          <div class="no-photo">No photo</div>
        <% } %>
        <figcaption class="hand"><%= esc(name) %> &#9825;</figcaption>
      </figure>

      <div class="hello">
        <p class="hand">hi, I'm</p>
        <h1 class="big-name"><%= esc(name) %></h1>
        <p class="tagline"><%= esc(programme) %></p>
      </div>
    </section>

    <!-- part ayat about-->
    <section class="block about">
      <h2 class="pill pill-pink">About Me</h2>
      <p class="intro"><%= esc(introduction).replace("\n", "<br>") %></p>
    </section>

    <!-- part ayat sticky notes -->
    <section class="notes">
      <article class="sticky sticky-yellow">
        <h3>Student ID</h3>
        <p><%= esc(studentId) %></p>
      </article>
      <article class="sticky sticky-blue">
        <h3>Programme</h3>
        <p><%= esc(programme) %></p>
      </article>
      <article class="sticky sticky-pink">
        <h3>Email</h3>
        <p><a href="mailto:<%= esc(email) %>"><%= esc(email) %></a></p>
      </article>
    </section>

    <!--  part dekat Hobbies -->
    <section class="block hobbies">
      <h2 class="pill pill-lilac">Hobbies</h2>
      <ul class="tags">
        <% if (hobbyList != null) 
        {
             int i = 0;
             for (String h : hobbyList) 
            { 
        %>
          <li class="tag tag-<%= i % 4 %>"><%= esc(h) %></li>
        <%   i++;
            }
        } 
        %>
      </ul>
    </section>

    <footer class="foot">
      <a class="btn btn-main" href="index.html">&larr; Create another profile</a>
    </footer>

  </main>

</body>
</html>
