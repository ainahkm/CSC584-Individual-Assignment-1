##### CSC584 Individual Assignment 1 - Personal Profile Web Application



##### Features



* Form fields: Name, Student ID, Programme, Email, Hobbies and Short Self-Introduction plus a profile photo upload
* The Servlet reads the submitted values and forwards them to the JSP
* The JSP shows the profile with a polaroid-style photo, sticky notes and hobby tags
* User input is HTML-escaped before display so characters such as `<`, `\\\&` and `"` appear correctly and safely
* Responsive layout (desktop and phone)
* No database required the photo is not stored on the server



##### Technologies Used



* HTML5
* JavaServer Pages (JSP)
* Java Servlet 3.1
* CSS3 (custom pastel theme; Google Fonts: Fredoka, Nunito, Caveat)
* Apache NetBeans project (Ant)
* GlassFish Server 4.1.1



##### Required Software



|Software|Version|
|-|-|
|JDK|8 (GlassFish 4.1.1 does not support JDK 9 or newer)|
|Apache NetBeans|with Java Web support|
|GlassFish Server|**4.1.1 (Java EE 7, uses javax.servlet; GlassFish 7 or newer will not work with this code)**|
|Internet connection|for Google Fonts (the page still works without it using default fonts)|

##### 

##### How to Run (NetBeans)



1. **GlassFish 4.1.1 is bundled with NetBeans** (Java EE / All installer) so no separate download is needed. (commonly it already inside the netbean but if you dont have glassfish server you can try another step)
                                        @
**Install GlassFish 4.1.1**: download the zip and extract it (for example to C:\\glassfish4).

2. **Check the server is registered**: Tools -> Servers -> GlassFish Server 4.1.1 should already be listed. If it is missing, click Add Server -> GlassFish Server -> select the glassfish4 folder inside the NetBeans installation folder -> Finish.

3. **Open the project**: File -> Open Project -> select this project folder.

4. **Select the server**: right-click the project -> Properties -> Run -> choose GlassFish Server and set the Java EE Version to Java EE 7.

5. **Build and run**: right-click the project -> Clean and Build, then Run.

6. **The browser opens the form**. If it does not, go to http://localhost:8080/CSC584-Individual-Assignment/ (the port may differ if you changed it). 



##### How to Use



1. Choose a profile photo (JPG or PNG, up to 5 MB).
2. Fill in Name, Student ID, Programme, Email, Hobbies (separate with commas) and a short self-introduction.
3. Click **Create My Profile**.
4. The profile page shows everything you entered. Use **Create another profile** to go back to the form.

##### 

##### Main Files



|File|Purpose|
|-|-|
|`web/index.html`|Profile form (submits with `method="post"`)|
|`ProfileServlet.java`|Receives the POST request and forwards the data to the JSP|
|`web/profile.jsp`|Displays the submitted profile|
|`web/css/style.css`|Styling and responsive layout|
|`web/WEB-INF/web.xml`|Web application configuration|
|`web/META-INF/context.xml`|Tomcat context configuration|

##### 

##### Screenshots



|Form|Profile output|
|-|-|
|Screenshot/form.png and screenshot/form2.png|Screenshot/profile.png|

##### 

##### Author



* Name: *Nur Aina Binti Mohd Abd Hakim*
* Student ID: 2026121721
* Programme: *cs2304C (subject csc584 - enterprise programming)*

