<%@page import="bean.*"%>
<%
// Create Objects
MainPage mp = new MainPage();
mp.setMainTitle("TestMainTitle");
mp.setMainContent("TestMainContent");
mp.setMainImg("TestMainImg.jpg");

Partner p = new Partner();
p.setpId("DEFAULT");
p.setpTitle("TestpTitle");
p.setpContent("TestpContent");
p.setpImg("TestpImg.jpg");
p.setpLink("TestpLink.com");

Service s = new Service();
s.setsId("TestsId");
s.setsTitle("TestsTitle");
s.setsContent("TestsContent");
s.setsImg("TestsImg.jpg");

SubService ss = new SubService();
ss.setSbId("DEFAULT");
ss.setSbTitle("TestSbTitle");
ss.setSbContent("TestSbContent");
ss.setSbImg("TestSbImg");
ss.setsId(s.getsId());
// Create Objects End
%>