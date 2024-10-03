/*
  Warnings:

  - The primary key for the `Profiles` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The required column `Id` was added to the `Profiles` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- CreateEnum
CREATE TYPE "NotificationStatus" AS ENUM ('PENDING', 'SENT', 'DISCARD');

-- DropIndex
DROP INDEX "Students_Student_Id_key";

-- AlterTable
ALTER TABLE "Profiles" DROP CONSTRAINT "Profiles_pkey",
ADD COLUMN     "Id" TEXT NOT NULL,
ADD CONSTRAINT "Profiles_pkey" PRIMARY KEY ("Id");

-- CreateTable
CREATE TABLE "Notification_Change" (
    "Id" TEXT NOT NULL,
    "notification_object_id" TEXT NOT NULL,
    "actor_id" TEXT NOT NULL,
    "status" "NotificationStatus" NOT NULL,

    CONSTRAINT "Notification_Change_pkey" PRIMARY KEY ("Id")
);

-- CreateTable
CREATE TABLE "Notification_Object" (
    "Id" TEXT NOT NULL,
    "entity_id" TEXT NOT NULL,
    "entity_type_id" INTEGER NOT NULL,
    "created_on" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" "NotificationStatus" NOT NULL,

    CONSTRAINT "Notification_Object_pkey" PRIMARY KEY ("Id")
);

-- CreateTable
CREATE TABLE "Notifications" (
    "Id" TEXT NOT NULL,
    "notification_object_id" TEXT NOT NULL,
    "status" "NotificationStatus" NOT NULL,

    CONSTRAINT "Notifications_pkey" PRIMARY KEY ("Id")
);

-- CreateTable
CREATE TABLE "NotificationStudents" (
    "student_id" TEXT NOT NULL,
    "notification_id" TEXT NOT NULL,

    CONSTRAINT "NotificationStudents_pkey" PRIMARY KEY ("student_id","notification_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Notification_Change_notification_object_id_key" ON "Notification_Change"("notification_object_id");

-- CreateIndex
CREATE UNIQUE INDEX "Notification_Object_entity_id_key" ON "Notification_Object"("entity_id");

-- CreateIndex
CREATE UNIQUE INDEX "Notifications_notification_object_id_key" ON "Notifications"("notification_object_id");

-- AddForeignKey
ALTER TABLE "Notification_Change" ADD CONSTRAINT "Notification_Change_notification_object_id_fkey" FOREIGN KEY ("notification_object_id") REFERENCES "Notification_Object"("Id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification_Change" ADD CONSTRAINT "Notification_Change_actor_id_fkey" FOREIGN KEY ("actor_id") REFERENCES "Mentors"("Mentor_Id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification_Object" ADD CONSTRAINT "Notification_Object_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Meetings"("Meeting_Id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notifications" ADD CONSTRAINT "Notifications_notification_object_id_fkey" FOREIGN KEY ("notification_object_id") REFERENCES "Notification_Object"("Id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NotificationStudents" ADD CONSTRAINT "NotificationStudents_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "Students"("Student_Id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NotificationStudents" ADD CONSTRAINT "NotificationStudents_notification_id_fkey" FOREIGN KEY ("notification_id") REFERENCES "Notifications"("Id") ON DELETE RESTRICT ON UPDATE CASCADE;
