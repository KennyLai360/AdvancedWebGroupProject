<jsp:include page="../templates/gameHeaderTemplate.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container preventSelection" style="padding-top:30px;">
    <div class="row">
        <div class="col-md-12">
            <div style="border: black 1px solid; height:500px; border-radius: 20px;">
                <div class="row">
                    <div class="text-center col-md-12">
                        <h4>Leaderboards</h4>
                        <hr>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div id="joinGameLobbyTable" class="table-responsive table-bordered">

                            <table class="table" style="padding-left:10px; padding-right:10px;">
                                <thead>
                                <tr>
                                    <th>Score</th>
                                    <th>Medal</th>
                                    <th>Username</th>
                                </tr>
                                </thead>
                                <c:forEach items="${listOfUsers}" var="user">
                                    <tr>
                                        <td><c:out value="${user.score}"/></td>
                                        <td><c:out value="${user.medal}"/></td>
                                        <td><c:out value="${user.ssoId}"/></td>
                                    </tr>
                                </c:forEach>

                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../templates/footerTemplate.jsp"/>

</body>
</html>



