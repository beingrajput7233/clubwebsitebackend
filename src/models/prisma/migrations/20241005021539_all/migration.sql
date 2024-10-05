-- CreateTable
CREATE TABLE "Blog" (
    "Id" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Description" TEXT,
    "CreationTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdationTime" TIMESTAMP(3) NOT NULL,
    "Image" TEXT,
    "Deleted" BOOLEAN NOT NULL DEFAULT false,
    "Priority" BOOLEAN NOT NULL DEFAULT false,
    "Number_Of_Likes" INTEGER NOT NULL DEFAULT 0,
    "AuthorId" TEXT NOT NULL,

    CONSTRAINT "Blog_pkey" PRIMARY KEY ("Id")
);

-- CreateTable
CREATE TABLE "Comment" (
    "Id" TEXT NOT NULL,
    "Description" TEXT,
    "NumberOfLikes" INTEGER NOT NULL DEFAULT 0,
    "CreationTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "UpdationTime" TIMESTAMP(3) NOT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT false,
    "Priority" BOOLEAN NOT NULL DEFAULT false,
    "AuthorId" TEXT NOT NULL,
    "BlogId" TEXT NOT NULL,
    "ParentId" TEXT,

    CONSTRAINT "Comment_pkey" PRIMARY KEY ("Id")
);

-- AddForeignKey
ALTER TABLE "Blog" ADD CONSTRAINT "studentauthor" FOREIGN KEY ("AuthorId") REFERENCES "Students"("Student_Id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Blog" ADD CONSTRAINT "mentorauthor" FOREIGN KEY ("AuthorId") REFERENCES "Mentors"("Mentor_Id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "StudentAuthorComment" FOREIGN KEY ("AuthorId") REFERENCES "Students"("Student_Id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "MentorAuthorComment" FOREIGN KEY ("AuthorId") REFERENCES "Mentors"("Mentor_Id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_BlogId_fkey" FOREIGN KEY ("BlogId") REFERENCES "Blog"("Id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "ParentBlogId" FOREIGN KEY ("ParentId") REFERENCES "Blog"("Id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "ParentCommentId" FOREIGN KEY ("ParentId") REFERENCES "Comment"("Id") ON DELETE SET NULL ON UPDATE CASCADE;
