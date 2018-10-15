
function userIssuesListener() {

  $("#domReadyCheck").text( "The DOM is now loaded and can be manipulated by javascript." );

  $("#userIssueList").on("click", function(event) {
    event.preventDefault();

    var userIssuesURL = $("#userIssueList a").attr("href");
    //console.log(userIssuesURL);
    $("tbody").empty();

    $.get(userIssuesURL, function(data) {
      console.log(data);
      //alert("Captured View user issues!");
      if (data.length === 0) {
        $("tbody").append("No comments at this time.");
      } else {
        for (let issue of data) {
  
          var markup = `<tr> 
                          <td>${issue.id}</td> 
                          <td> <a href="issues/${issue.id}">${issue.title}</td> 
                          <td>${issue.status}</td> 
                          <td>${issue.owner}</td>
                          <td>${issue.created}</td>
                          <td>${issue.effort}</td>
                          <td>${issue.completion_date}</td>
                          <td>${issue.user.name}</td>
                          <td>${issue.employee.name}</td>
                          <td>${issue.employee.department}</td>
                          <td>X</td>
                        </tr>`;
          $("table tbody").append(markup);     
  
        } 
      }
    }, "json");
  });

}