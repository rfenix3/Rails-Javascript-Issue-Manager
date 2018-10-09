function Comment(id, comment, issue_id, user_id, created_at) {
  this.id = id;
  this.comment = comment;
  this.issue_id = issue_id;
  this.user_id = user_id;
  this.created_at = created_at;
}

Comment.prototype.getUserName = function() {
  console.log(`Hello everybody!`);
};


