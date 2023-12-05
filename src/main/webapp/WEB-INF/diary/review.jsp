
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.List" %>
<%@ page import="model.dto.review.Review" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<div id="reviewContainer">

<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Filtering</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
   <link rel="stylesheet" href="<c:url value='/css/diary/filtering.css' />" type="text/css">
<script src="<c:url value='/js/diary/fullcalendar.js'/>" type="text/javascript"></script>
</head>
<style>

</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">

</script>
<%
//Retrieve the jsonResult attribute
	List<Review> reviewDateList = (List<Review>)request.getAttribute("reviewDateList");
%>
<body>
<%
// Check if reviewDateList is not null
if (reviewDateList != null) {
%>
    <div class="gallery">
        <div class="container text-center">
            <% for (int i = 0; i < reviewDateList.size(); i++) { %>
                <% if (i % 4 == 0) { %>
                    <div class="row">
                <% } %>
                <div class="col">
                    <article class="card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        <figure>
                            <img src="<%= reviewDateList.get(i).getMediaImg() %>" alt="movie">
                            <figcaption>
                                <p class="h6">
                                    <%= reviewDateList.get(i).getTitle() %>
                                </p>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <% if (i % 4 == 3 || i == reviewDateList.size() - 1) { %>
                    </div>
                <% } %>
            <% } %>
        </div>
    </div>
        <script>
        // Call the renderDateHeader function after the page is loaded
        window.onload = function () {
            renderDateHeader();
        };

        function renderDateHeader() {
            // Your rendering logic here
            console.log("Page is loaded. Rendering logic executed.");
        }
    </script>
<%
} else {
    // Handle the case when reviewDateList is null
   
}
%>
   <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
         <div class="modal-content">
            <div class="modal-header">
               <h1 class="modal-title fs-5" id="exampleModalLabel">Title</h1>
               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <form>
                  <div class="mb-3">
                     <label for="recipient-name" class="col-form-label">date :</label>
                     <input type="date">
                  </div>
                  <div class="mb-3">
                     <label for="message-text" class="col-form-label">Review Score :</label>
                     <div class="star-rating space-x-4 mx-auto">
                        <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings" />
                        <label for="5-stars" class="star pr-4">★</label>
                        <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings" />
                        <label for="4-stars" class="star">★</label>
                        <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings" />
                        <label for="3-stars" class="star">★</label>
                        <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings" />
                        <label for="2-stars" class="star">★</label>
                        <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
                        <label for="1-star" class="star">★</label>
                     </div>
                  </div>
                  <div class="mb-3">
                     <label for="recipient-name" class="col-form-label">my review:</label>
                     <input type="text" class="form-control" id="recipient-name">
                  </div>
                  <div class="mb-3">
                     <label for="message-text" class="col-form-label">others:</label>
                     <textarea class="form-control" id="message-text"></textarea>
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-danger">삭제하기</button>
               <button type="button" class="btn btn-primary">저장하기</button>
            </div>
         </div>
      </div>
   </div>

</body>

</div>
</html>