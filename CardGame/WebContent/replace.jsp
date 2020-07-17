<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="CardGameJinApp.Practice.Card"%>
<%@ page import="CardGameJinApp.Practice.CardComparator"%>
<%@ page import="CardGameJinApp.Practice.Pathnames"%>
<%@ page import="CardGameJinApp.Practice.CaseChecker"%>



<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"  type="text/css" href="styles.css"/>

<meta charset="UTF-8">
<title>Welcome to Gin</title>
</head>
<body>
	<h1>Welcome to Gin</h1>
	
	<%
	
	boolean p1 = (boolean)session.getAttribute("player1Bool");
	boolean p2 = (boolean)session.getAttribute("player2Bool");
	boolean winner = false;
	
	
	Pathnames pathnames = new Pathnames();
	String[] list = pathnames.getfileList();

	Card h = new Card();
	Stack<Card> deck = (Stack<Card>)session.getAttribute("deck");

	List<Card> player1 = (List<Card>)session.getAttribute("player1cards");
	List<Card> player2 = (List<Card>)session.getAttribute("player2cards");
	
	
	Stack<Card> trash  = (Stack<Card> )session.getAttribute("trash" );
	
	Card draw = (Card) session.getAttribute("cardDraw");
	
	System.out.println("****  REPLACE SERVLET  ****");
	System.out.println("Player 1: boolean --> " + p1);
	System.out.println("Player 2: boolean --> " + p2);
	System.out.println();
	System.out.print("draw card" + draw.toString());


	


	Collections.sort(player1, new CardComparator());
	Collections.sort(player2, new CardComparator());
	if(p1){
	 %>
	

	<h2>Player 1's Cards</h2>


	<div class="main">

		<%
		int count = 0;
		for (Card c : player1) {
			String file = c.getFilename(c);
			String card = Integer.toString(c.getSuite()) +" SPACE " + Integer.toString(c.getNum());

		%>
		<form action="/CardGame/ReplaceServlet">
		
		<div class = "cards">
		
		<img alt="Image not found" src=<%out.print(file);%> height="150px"
			width="110px">
		<input type = "radio" name = "buttonclick" onclick="this.form.submit()" value="<%=count%>">
		</div>
		
		<%
		count++;
			};
		
		
		%>
		
		</form>
		
	</div>
	
	<%}
	
	
	if(p2){%>

	
	<h2>Player 2's Cards</h2>


	<div class="main">

		<%
		int count = 0;
		for (Card c : player2) {
			String file = c.getFilename(c);
			String card = Integer.toString(c.getSuite()) +" SPACE " + Integer.toString(c.getNum());

		%>
		<form action="/CardGame/ReplaceServlet">
		
		<div class = "cards">
		
		<img alt="Image not found" src=<%out.print(file);%> height="150px"
			width="110px">
		<input type = "radio" name = "buttonclick" onclick="this.form.submit()" value="<%=count%>">
		</div>
		
		<%
		count++;
			};
		
		
		%>
		
		</form>
		
	</div>

	
	<%} %>

	<br>
	
	<h1> Please choose a card to replace with the card you drew below</h1>
	<%
	
	String firstN = draw.getFilename(draw);
	%>
	<div class="top">
		<img alt="Image not found" src=<%out.print(firstN);%> height="150px"
			width="110px">

	</div>



	


</body>
</html>