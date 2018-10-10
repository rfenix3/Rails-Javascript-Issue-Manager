$(document).ready(function(){

  $( "p" ).text( "The DOM is now loaded and can be manipulated." );

  $(function () {
    $("#userIssueList").on("click", function(event) {
      event.preventDefault();

      var userIssuesURL = $("#userIssueList a").attr("href");
      //console.log(userIssuesURL);
      $("tbody").empty();

      $.get(userIssuesURL + ".json", function(data) {
        console.log(data);
        //alert("Captured View user issues!");
        if (data.length === 0) {
          $("tbody").append("No comments at this time.");
        } else {
          for (let issue of data) {
    
            var markup = `<tr> 
                            <td>${issue.id}</td> 
                            <td>${issue.title}</td> 
                            <td>${issue.status}</td> 
                            <td>${issue.owner}</td>
                            <td>${issue.created}</td>
                            <td>${issue.effort}</td>
                            <td>${issue.completion_date}</td>
                            <td>${issue.employee_id}</td>
                            <td>${issue.user_id}</td>
                            <td>Department</td>
                            <td>X</td>
                          </tr>`;
            $("table tbody").append(markup);     
    
          } 
        }



        
//       $("#issueId").text("Issue ID: " + data["id"]);
//       $("#issueTitle").text("Title: " + data["title"]);
//       $("#issueStatus").text("Status: " + data["status"]);
//       $("#issueOwner").text("Owner: " + data["owner"]);
//       $("#issueCreated").text("Created: " + data["created"]);
//       $("#issueEffort").text("Effort (hrs): " + data["effort"]);
//       $("#issueCompletion").text("Completion Date: " + data["completion_date"]);
//       $("#issueEmployee").text("Employee/Caller: " + data["employee"]["name"]);
//       $("#issueUser").text("Support: " + data["user"]["name"]);

//       // re-set comments section
//       $("tbody").empty();
//       var newUrl = "/issues/" + data["id"] + "/comments"
//       $("#load_comments").attr("href", newUrl);

//       // re-set form_for form-action and comments-issue-id value to the next issue ID
//       $("#new_comment").attr("action", newUrl);
//       $("#comment_issue_id").attr("value", nextId)

//       // re-set the id to current on the link
//       $("#js-next").attr("data-id", data["id"]);
//       console.log("Current data-id: " + data["id"])
//     });
      });
    });
  });
});
