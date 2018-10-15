function sortIssueTitleListener() {
  $("#sortTitle").on("click", function(event) {
    event.preventDefault();

    $("tbody").empty();

    $.get("/issues", function(data) {
      //console.log(data);

      data.sort(function(a, b) {
        var titleA = a.title.toUpperCase(); // ignore upper and lowercase
        var titleB = b.title.toUpperCase(); // ignore upper and lowercase
        if (titleA < titleB) {
          return -1;
        }
        if (titleA > titleB) {
          return 1;
        }
      
        // names must be equal
        return 0;
      });

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
};

