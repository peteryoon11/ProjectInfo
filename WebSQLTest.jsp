<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>    
    <script type="text/JavaScript">
    
      var db;
      function createDB(){
        db = window.openDatabase("myDB","1.0", "테스트용DB", 1024*1024);
      }
      
      function createTable(){
        db.transaction(function(tx){
          tx.executeSql("create table Test(id,name)");
        });
      }
      
      function insertData(){
        db.transaction(function(tx){
          tx.executeSql("insert into Test values(?,?)",[txtID.value,txtName.value]);
        });
      }
      
      function selectData(){
        db.transaction(function(tx){
          tx.executeSql("select * from Test",[],
            
            function(tx,result){            
              for(var i = 0; i < result.rows.length; i++){
                var row = result.rows.item(i);
                document.getElementById('table1').innerHTML +=  "<tr><td>" + row['id'] + "</td><td>" + row['name'] + "</td></tr>";
              }            
                                   
            });
            
        });
      }
            
    </script>
  </head>
  
  <body> 
  
    <button onclick="createDB()">DB 생성</button>
    <br>        
    <button onclick="createTable()">테이블생성</button>    
    <br>  
    ID: <input type="text" id="txtID"> , NAME: <input type="text" id="txtName">
    <button onclick="insertData()">데이터 입력</button>
    <br>    
    <button onclick="selectData()">데이타 조회</button>    
    <br>
    <table id="table1"></table>
  </body>
</html>