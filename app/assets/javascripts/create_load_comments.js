function loadCommentsListener(){
  $("#load_comments").on("click", function(event){
    event.preventDefault(); 
    $("tbody").empty();
    console.log(this.href); 
    $.get(this.href, function(data){
      if (data.length === 0) {
        $("#commentMessage").text( "No comments at this time.");
      } else {
        for (let comment of data) {
          var markup = `<tr> 
                          <td>${comment.id}</td> 
                          <td>${comment.comment}</td> 
                          <td>${comment.user_id}</td> 
                          <td>${comment.created_at}</td>
                        </tr>`;
          $("table tbody").append(markup);     
        } 
      }
    })
  })
}

function newCommentsListener(){
  $("#new_comment").on("submit", function(event){

    //console.log(this.action);    
    var values = $(this).serialize();
    var posting = $.post(this.action, values);
    posting.done(function(data) {

    let issueComment = new Comment(data["id"], data["comment"], data["issue_id"], data["user_id"], data["created_at"]);

    var markup = `<tr> 
                    <td>${issueComment.id}</td> 
                    <td>${issueComment.comment}</td> 
                    <td>${issueComment.user_id}</td> 
                    <td>${issueComment.formatCreateDate()}</td>
                  </tr>`;
    $("table tbody").append(markup);     

    // clear Add Comment textarea
    $("#comment_comment").val("");

    // empty commentMessage 
    $("#commentMessage").empty();
    });
    event.preventDefault();
  });
}