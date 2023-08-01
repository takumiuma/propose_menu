<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>メニュー提案アプリ</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
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
      <p class= "comment">${requestScope.message }</p>
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
    　　　　　　　　
           　　　　　<p class="check text-center"><label><input type="checkbox" name="genre" value="和食" checked>和食</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="genre" value="中華料理" checked>中華料理</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="genre" value="洋食" checked>洋食</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="genre" value="韓国料理" checked>韓国料理</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="genre" value="ファーストフード" checked>ファーストフード</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="genre" value="その他" checked>その他</label></p>
    　　　　　　　　
  　　　　　　</div>
　　　　　　</div>
　　　　　　<div class="card" style="width: 18rem;">
  　　　　　　<div class="card-body">
    　　　　　　<h5 class="card-title">カテゴリ</h5>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="肉" checked>肉</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="魚" checked>魚</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="野菜" checked>野菜</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="ご飯もの" checked>ご飯もの</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="麺類" checked>麺類</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="パン" checked>パン</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="スープ・汁物" checked>スープ・汁物</label></p>
           　　　　　<p class="check text-center"><label><input type="checkbox" name="category" value="その他" checked>その他</label></p>
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
     <div class="col-5 ml-3">
    <table class="table table-striped">
    <thead>
        <tr>
            <th>メニューNo.</th>
            <th>料理名</th>
        </tr>
    </thead>
    <tbody>  
    <% 
    ArrayList<String> menuList = (ArrayList<String>)request.getAttribute("menuList");
    int count = 1;
    for(String menu : menuList){
    %>
    <tr>
       <td><%=count %></td>
       <td><%=menu %></td>
    </tr>
    <% 
    count++;
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