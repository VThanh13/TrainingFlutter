abstract class BlogManageState{}

abstract class BlogManageActionState extends BlogManageState{}

class BlogManageInitialState extends BlogManageState{}

class ClickToCommentBlogState extends BlogManageState{}

class ClickToCreateBlogState extends BlogManageState{}