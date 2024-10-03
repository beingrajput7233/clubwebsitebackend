/*
  Warnings:

  - A unique constraint covering the columns `[College_RollNo]` on the table `Students` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `College_RollNo` to the `Students` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Students" ADD COLUMN     "College_RollNo" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Students_College_RollNo_key" ON "Students"("College_RollNo");
