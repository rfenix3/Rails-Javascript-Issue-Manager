function nextIssueListener(){

  $("#js-next").on("click", function(event) {
    event.stopPropagation();

    var nextId = parseInt($("#js-next").attr("data-id")) - 1;

    $.get("/issues/" + nextId + ".json", function(data) {
      console.log(data);
      $("#issueId").text("Issue ID: " + data["id"]);
      $("#issueTitle").text("Title: " + data["title"]);
      $("#issueStatus").text("Status: " + data["status"]);
      $("#issueOwner").text("Owner: " + data["owner"]);
      $("#issueCreated").text("Created: " + data["created"]);
      $("#issueEffort").text("Effort (hrs): " + data["effort"]);
      $("#issueCompletion").text("Completion Date: " + data["completion_date"]);
      $("#issueEmployee").text("Employee/Caller: " + data["employee"]["name"]);
      $("#issueUser").text("Support: " + data["user"]["name"]);

      // re-set comments section
      $("tbody").empty();
      var newUrl = "/issues/" + data["id"] + "/comments"
      $("#load_comments").attr("href", newUrl);

      // re-set form_for form-action and comments-issue-id value to the next issue ID
      $("#new_comment").attr("action", newUrl);
      $("#comment_issue_id").attr("value", nextId)

      // re-set the id to current on the link
      $("#js-next").attr("data-id", data["id"]);
      console.log("Current data-id: " + data["id"])

      // re-set comment message
      $("#commentMessage").empty();

    });
  });
};