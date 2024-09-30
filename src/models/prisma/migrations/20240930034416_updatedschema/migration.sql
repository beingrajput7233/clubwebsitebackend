/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "Profiles" (
    "student_id" TEXT NOT NULL,
    "Profile_CF" TEXT,
    "Profile_CC" TEXT,
    "Profile_Atcoder" TEXT,

    CONSTRAINT "Profiles_pkey" PRIMARY KEY ("student_id")
);

-- CreateTable
CREATE TABLE "Students" (
    "Student_Id" TEXT NOT NULL,
    "Name" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "College_Branch" TEXT NOT NULL,
    "College_Year" TEXT NOT NULL,

    CONSTRAINT "Students_pkey" PRIMARY KEY ("Student_Id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Profiles_student_id_key" ON "Profiles"("student_id");

-- CreateIndex
CREATE UNIQUE INDEX "Students_Student_Id_key" ON "Students"("Student_Id");

-- CreateIndex
CREATE UNIQUE INDEX "Students_Email_key" ON "Students"("Email");

-- AddForeignKey
ALTER TABLE "Profiles" ADD CONSTRAINT "Profiles_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "Students"("Student_Id") ON DELETE CASCADE ON UPDATE CASCADE;
