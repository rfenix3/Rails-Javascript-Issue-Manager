class Comment {
  constructor(id, comment, issue_id, user_id, created_at) {
    this.id = id;
    this.comment = comment;
    this.issue_id = issue_id;
    this.user_id = user_id;
    this.created_at = created_at;
  };

  formatCreateDate() {
    var create_date = this.created_at;

    var month = create_date.slice(5,7);
    var day = create_date.slice(8,10);
    var year = create_date.slice(0,4);
    var time = create_date.slice(11,19)
    
    var formatted_date = `${month}/${day}/${year} ${time} <--- New Comment!`;
    
    return formatted_date;
  };

}


