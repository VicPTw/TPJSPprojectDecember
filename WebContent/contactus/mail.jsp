<%-- 
    Document   : mail
    Created on : 2018/11/19, 下午 03:13:31
    Author     : user
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.io.*"  %>
<%@page import="javax.mail.*"  %>
<%@page import="javax.mail.internet.*"  %>
<%@page import="javax.activation.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="contactus.css" rel="stylesheet" type="text/css">
        <link href="../style.css" rel="stylesheet" type="text/css">
        <title>SendMail</title>
        
    </head>
    <body>
        <%
        request.setCharacterEncoding("UTF-8");
    String recipients = "mr.shi789789@gmail.com"; 
    final String userName = "ms.shi789789@gmail.com";
    final String password = "so123456os";
    String message = request.getParameter("message");
    String mail = request.getParameter("mail");
    String name = request.getParameter("name");
    
    Properties props = new Properties(); 
 
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.from", "ms.shi789789@gmail.com");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.sendpartial",true);
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.socketFactory.port", "465");
        
    Session se = Session.getInstance(props, new Authenticator() {  //use javax.mail.Session
 protected PasswordAuthentication getPasswordAuthentication() { 
     return new PasswordAuthentication(userName, password); 
 } 
    }); 
        
        MimeMessage theMessage = new MimeMessage(se);
            try{
      theMessage.setReplyTo(InternetAddress.parse(recipients));
      theMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipients, false));
    } catch(Exception e){
      System.out.println("## Bad address:"+InternetAddress.parse(recipients, false));
      return;
    }
        
        
        
        
        
        
        theMessage.setSubject(request.getParameter("subject")+"   "+"(sent from website)");
        MimeBodyPart theMimeBodytext =new MimeBodyPart();
        theMimeBodytext.setText("Name:"+name+"\n"+"-----------------------------------------"+"\n"+mail+"\n"+"-----------------------------------------"+"\n"+"message: "+message);
        
        Multipart theMultipart = new MimeMultipart();
        theMultipart.addBodyPart(theMimeBodytext);
        
        theMessage.setContent(theMultipart);
        Transport.send(theMessage);
        
        out.print("<h1>");
        out.print("mail  send  success");
        out.print("</h1>");
        
        
        
        %>
        
        <div class="sendmail">
        <a href="../index.html">Back to Home</a>
        </div>        
    </body>
</html>
