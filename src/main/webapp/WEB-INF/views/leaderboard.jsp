<jsp:include page="../templates/gameHeaderTemplate.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    $(document).ready(function()
        {
            <!--Sort by descending order of score -->
            $("#leaderboardTable").tablesorter( {sortList: [[0,1]]} ); ;
        }
    );
</script>

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
                        <div id="tableContent" class="table-responsive table-bordered">

                            <table id="leaderboardTable" class="table tablesorter" style="padding-left:10px; padding-right:10px;">
                                <thead>
                                <tr>
                                    <th style="cursor:hand">Score</th>
                                    <th>Medal</th>
                                    <th>User</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listOfUsers}" var="data">
                                <tr>
                                    <td><c:out value="${data.score}"/></td>
                                    <td><c:out value="${data.medal}"/></td>
                                    <td><c:out value="${data.ssoId}"/></td>
                                </tr>
                                </c:forEach>
                                <c:forEach items="${listOfUsers}" var="data">
                                <tr>
                                    <td><c:out value="${data.score}"/></td>
                                    <td><c:out value="${data.medal}"/></td>
                                    <td><c:out value="${data.ssoId}"/></td>
                                </tr>
                                </c:forEach>
                                <c:forEach items="${listOfUsers}" var="data">
                                <tr>
                                    <td><c:out value="${data.score}"/></td>
                                    <td><c:out value="${data.medal}"/></td>
                                    <td><c:out value="${data.ssoId}"/></td>
                                </tr>
                                </c:forEach>

                            </table>
                            </tbody>

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



