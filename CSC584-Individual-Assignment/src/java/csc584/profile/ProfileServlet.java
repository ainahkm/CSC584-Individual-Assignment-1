package csc584.profile;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class ProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // retrieve form data yg kita dh masukkan
        String name = clean(request.getParameter("name"));
        String studentId = clean(request.getParameter("studentId"));
        String programme = clean(request.getParameter("programme"));
        String email = clean(request.getParameter("email"));
        String hobbies = clean(request.getParameter("hobbies"));
        String introduction = clean(request.getParameter("introduction"));

        // split hobi jadi list bila kita letak koma
        List<String> hobbyList = new ArrayList<>();
        for (String h : hobbies.split(",")) {
            String t = h.trim();
            if (!t.isEmpty()) {
                hobbyList.add(t);
            }
        }

        // tmpt upload photo including dgn requirement dia 
        String photoDataUri = "";
        Part photo = request.getPart("photo");
         //kalau nk check size gmbor 
        if (photo != null && photo.getSize() > 0) {
            String type = photo.getContentType();
            if (type != null && type.startsWith("image/")) {
                try (InputStream in = photo.getInputStream();
                     ByteArrayOutputStream out = new ByteArrayOutputStream()) {
                    byte[] buf = new byte[8192];
                    int n;
                    while ((n = in.read(buf)) != -1) {
                        out.write(buf, 0, n);
                    }
                    //tukar gambar jadi base 64 since kita nk transfer gmbr kt JSP as temporary x nk save permanent kt server
                    photoDataUri = "data:" + type + ";base64,"
                            + Base64.getEncoder().encodeToString(out.toByteArray());
                }
            }
        }

        request.setAttribute("name", name);
        request.setAttribute("studentId", studentId);
        request.setAttribute("programme", programme);
        request.setAttribute("email", email);
        request.setAttribute("hobbies", hobbies);
        request.setAttribute("hobbyList", hobbyList);
        request.setAttribute("introduction", introduction);
        request.setAttribute("photoDataUri", photoDataUri);

        RequestDispatcher rd = request.getRequestDispatcher("/profile.jsp");
        rd.forward(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect("index.html");
    }

    private static String clean(String value) {
        return value == null ? "" : value.trim();
    }
}
