function Comment(comment, issue_id, user_id) {
  this.comment = comment;
  this.issue_id = issue_id;
  this.user_id = user_id;
}

Comment.prototype;
// {}

Comment.prototype.getUserName = function() {
  console.log(`Hello everybody, my name is ${this.user.name}`);
};

