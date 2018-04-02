<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JF Factory</title>
<style>
div.container {
    width: 100%;
    border: 1px solid gray;
}

header, footer {
    padding: 1em;
    color: white;
    background-color: Tomato;
    clear: left;
    text-align: center;
}

nav {
    float: left;
    max-width: 160px;
    margin: 0;
    padding: 1em;
}

nav ul {
    list-style-type: none;
    padding: 0;
}
   
nav ul a {
    text-decoration: none;
}

article {
    margin-left: 170px;
    border-left: 1px solid gray;
    padding: 1em;
    overflow: hidden;
}
</style>
</head>
</head>
<body>

<% 

boolean cookieStatus = false;
//out.println(request.getParameter("AccessToken"));

//out.println(request.getAttribute("AccessToken"));


String uname = request.getParameter("uname");
String encname = request.getParameter("encname");

try
{
	String ED=encname;
	int snd = ED.length()/2;
	
	System.out.println(snd);
	
	
	StringBuffer D1 = new StringBuffer();
	StringBuffer D2 = new StringBuffer();
	
	System.out.println(D1.append(ED.substring(snd)));
	
	System.out.println(D2.append(ED.substring(0,snd)));
	
	
	
	int TL = D1.length()>D2.length()?D1.length():D2.length();
	
	StringBuffer Ori = new StringBuffer();
	System.out.println(TL);
	
	for (int t=0; t<TL;t++) {
		
		
		if(t < D1.length())
		{
			Ori.append(D1.charAt(t));
		}
		if(t < D2.length())
		{
			Ori.append(D2.charAt(t));
		}
		
	}
	
	
	System.out.println("FINAL   :"+Ori);
	
}catch(Exception e)
{
	
}

//out.println(uname);


if( request.getParameter("AccessToken") != null || request.getAttribute("AccessToken") != null)
		{

	Cookie ckadd=  null;
	if(uname != null)
	{
 ckadd=new Cookie("ACUSTAToken",uname);
	}else { ckadd=new Cookie("ACUSTAToken","");}
	response.addCookie(ckadd);
	cookieStatus = true;
		}

Cookie ck[]=request.getCookies();  
if( ck != null)
for(int i=0;i<ck.length;i++){   
 if(ck[i].getName().equalsIgnoreCase("ACUSTAToken"))
 {
	// out.println("<br>"+"<br><b> \t\t\t              "+ck[i].getValue()+" </b> <br>");  //printing name and value of cookie
	 
	 uname = ck[i].getValue();
	 
	 cookieStatus = true;
 }
}  

		

%>

<% 
if(cookieStatus)
{
	 out.println("<br>"+"<br><b> \t\t\t              "+uname+" </b> <br>"); 
	 
	out.println();
out.println("<br> <br> <b> \t JF Factory Application Login Successful .... </b> <br> ");

%>

<div class="container">

<header>
   <h1>JF Factory</h1>
</header>
  
<nav>
  <ul>
    <li><a href="#">Jaguar</a></li>
    <li><a href="#">Ferrari</a></li>
    
  </ul>
</nav>

<article>
  <h1>JF</h1>
  <p>JF is the capital Car Producer...</p>
  
</article>

<footer>You are authorized ...</footer>

</div>


<% }else 


{
	request.setAttribute("Msgg", "Credentials Error, Please use correct credentials...");
	//out.println("<br> <br> <b> \t JF Factory Application Login NOTTT Successful .... </b> <br> ");
	response.sendRedirect("https://gssomanager.eu-gb.mybluemix.net/default.jsp?compID=JFFA");
}


%>

<form action="${pageContext.request.contextPath}/JFServlet" method="post">

<br><br><br>
 <table align="left">
  <tr>
    <td align="left"><input type="submit" name="logoff" value="logoff" /></td>
    <td></td>
  </tr>
</table> 
</form>

</body>
</html>