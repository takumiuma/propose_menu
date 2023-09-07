<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String[] genre = request.getParameterValues("genre");
String[] category = request.getParameterValues("category");
if(genre == null && category == null){
	genre = (String[])request.getAttribute("genre");
	category = (String[])request.getAttribute("category");
}
%>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>メニュー提案アプリ</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <link href="style.css" rel="stylesheet">
  <style type="text/css">
  .check{
     margin : 0px ;
     padding : 0px;
     width: 200px;
     height: 10px;
} 
  </style>
</head>
<body>
  <header>

  　
  　<div class="p-3 mb-2 bg-dark-subtle text-emphasis-dark">
  　  <div class="container">
  　　　<h1 class="text-center">メニューを提案します</h1>
  　　</div>
    </div>
  </header>
  <main>
    <c:if test="${not empty requestScope.message }">
      <p class= "comment"><font color="red">${requestScope.message }</font></p>
    </c:if>
    
  <div class="container text-center">
  <div class="row">
    <div class="col">
      <div class="alert alert-primary" role="alert">
      <form action="menu" method="post">
        <p>150種を超えるメニューから1つを提案します</p>
        <input class="btn btn-primary" type="submit" value="かんたん検索" name="全検索">
      </form>
      </div>
      <div class="alert alert-warning" role="alert">
        <form action="menu" method="post">
          <p>あなたのお好みのメニューだけを厳選します</p>
          <div class="card-group">
          <div class="card" style="width: 18rem;">
 　　　　　　 <div class="card-body">
    　　　　　　<h5 class="card-title">ジャンル</h5>
    　　　　　　　　
           　　　　　<p class="check text-center"><label><input type="checkbox" name="genre" value="和食" 
           			<% if (genre != null && Arrays.asList(genre).contains("和食"))
           				out.print("checked"); %>>和食</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="genre" value="中華料理" 
           			<% if (genre != null && Arrays.asList(genre).contains("中華料理"))
           				out.print("checked"); %>>中華料理</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="genre" value="洋食" 
           			<% if (genre != null && Arrays.asList(genre).contains("洋食"))
           				out.print("checked"); %>>洋食</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="genre" value="韓国料理" 
           			<% if (genre != null && Arrays.asList(genre).contains("韓国料理"))
           				out.print("checked"); %>>韓国料理</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="genre" value="ファーストフード" 
           			<% if (genre != null && Arrays.asList(genre).contains("ファーストフード"))
           				out.print("checked"); %>>ファーストフード</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="genre" value="その他" 
           			<% if (genre != null && Arrays.asList(genre).contains("その他"))
           				out.print("checked"); %>>その他</label></p>
    　　　　　　　　
  　　　　　　</div>
　　　　　　</div>
　　　　　　<div class="card" style="width: 18rem;">
  　　　　　　<div class="card-body">
    　　　　　　<h5 class="card-title">カテゴリ</h5>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="肉" 
           			<% if (category != null && Arrays.asList(category).contains("肉"))
           				out.print("checked"); %>>肉</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="魚" 
           			<% if (category != null && Arrays.asList(category).contains("魚"))
           				out.print("checked"); %>>魚</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="野菜" 
           			<% if (category != null && Arrays.asList(category).contains("野菜"))
           				out.print("checked"); %>>野菜</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="ご飯もの" 
           			<% if (category != null && Arrays.asList(category).contains("ご飯もの"))
           				out.print("checked"); %>>ご飯もの</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="麺類" 
           			<% if (category != null && Arrays.asList(category).contains("麺類"))
           				out.print("checked"); %>>麺類</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="パン" 
           			<% if (category != null && Arrays.asList(category).contains("パン"))
           				out.print("checked"); %>>パン</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="スープ・汁物" 
           			<% if (category != null && Arrays.asList(category).contains("スープ・汁物"))
           				out.print("checked"); %>>スープ・汁物</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="その他" 
           			<% if (category != null && Arrays.asList(category).contains("その他"))
           				out.print("checked"); %>>その他</label></p>
  　　　　　　</div>
　　　　　　</div>
          </div>
          <select name="count">
           <option value="1">1件</option>
           <option value="3" selected="selected">3件</option>
           <option value="5">5件</option>
          </select>
          <input class="btn btn-warning" type="submit" value="こだわり検索" name="詳細検索">
        </form>
    </div>
    </div>
    <div class="col">
    <c:if test="${not empty requestScope.menuList }">
    <h3>【検索結果】</h3>
     <div >
    <table class="table table-striped">
    <thead>
        <tr>
            <th>メニュー</th>
            <th>近くのお店検索</th>
            <th>レシピを検索</th>
        </tr>
    </thead>
    <tbody>  
    <% 
    ArrayList<String> menuList = (ArrayList<String>)request.getAttribute("menuList");
    for(String menu : menuList){
    %>
    <tr>
    	<td><%=menu %></td>
        <td>
       		<form action="https://www.google.com/search" target="_blank">
       			<input type="submit" class="btn btn-link" name="q" value="<%=menu %> お店 近く">
       		</form>
        </td>
        <td>
        	<form action="https://www.google.com/search" target="_blank">
       			<input type="submit" class="btn btn-link" name="q" value="<%=menu %> レシピ">
       		</form>
        </td>
    </tr>
    <% 
    }
    %>
    </tbody>
</table>
</div>
    </c:if>
    </div>  
  </div>    
  </div>
    
    
  </main>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/mhDoLbDldZc3qpsJHpLogda//BVZbgYuw6kof4u2FrCedxOtgRZDTHgHUhOCVim" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</body>
</html>