-- Stored Procedure for managing blog posts

-- Functionality: Add new blog post
CREATE PROCEDURE AddNewBlogPost (
    @Title VARCHAR(255),
    @Content TEXT,
    @UserID INT
)
AS
BEGIN
    INSERT INTO BlogPost (Title, Content, UserID, CreatedAt)
    VALUES (@Title, @Content, @UserID, GETDATE());
END;

-- Functionality: Retrieve post details by UserID
CREATE PROCEDURE GetPostDetails (
    @UserID INT
)
AS
BEGIN
    SELECT * FROM BlogPost WHERE UserID = @UserID;
END;

-- Functionality: Update blog post details
CREATE PROCEDURE UpdateBlogPost (
    @PostID INT,
    @Title VARCHAR(255),
    @Content TEXT
)
AS
BEGIN
    UPDATE BlogPost
    SET Title = @Title, Content = @Content
    WHERE PostID = @PostID;
END;

-- Functionality: Delete blog post by ID
CREATE PROCEDURE DeleteBlogPost (
    @PostID INT
)
AS
BEGIN
    DELETE FROM BlogPost WHERE PostID = @PostID;
    -- Additional logic to delete associated comments, if needed
END;

-- Functionality: Add comment to a blog post
CREATE PROCEDURE AddCommentToPost (
    @PostID INT,
    @UserID INT,
    @ParentCommentID INT,
    @CommentContent TEXT
)
AS
BEGIN
    INSERT INTO Comments (PostID, UserID, ParentCommentID, CommentContent, CommentDate)
    VALUES (@PostID, @UserID, @ParentCommentID, @CommentContent, GETDATE());
END;

-- Functionality: Delete comment by ID
CREATE PROCEDURE DeleteComment (
    @CommentID INT
)
AS
BEGIN
    DELETE FROM Comments WHERE CommentID = @CommentID;
END;

-- Functionality: Fetch comments for a specific post
CREATE PROCEDURE GetPostComments (
    @PostID INT
)
AS
BEGIN
    SELECT * FROM Comments WHERE PostID = @PostID;
END;