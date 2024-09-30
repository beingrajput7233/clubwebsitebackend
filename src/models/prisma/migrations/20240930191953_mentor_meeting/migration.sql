-- CreateEnum
CREATE TYPE "Status" AS ENUM ('Scheduled', 'Cancelled', 'Completed');

-- CreateTable
CREATE TABLE "MeetingMentor" (
    "meeting_id" TEXT NOT NULL,
    "mentor_id" TEXT NOT NULL,

    CONSTRAINT "MeetingMentor_pkey" PRIMARY KEY ("meeting_id","mentor_id")
);

-- CreateTable
CREATE TABLE "Meetings" (
    "Meeting_Id" TEXT NOT NULL,
    "Meeting_Time" TEXT NOT NULL,
    "Meeting_Venue" TEXT NOT NULL,
    "Meeting_Agenda" TEXT NOT NULL,
    "Created_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "Meeting_Status" "Status" NOT NULL,

    CONSTRAINT "Meetings_pkey" PRIMARY KEY ("Meeting_Id")
);

-- CreateTable
CREATE TABLE "Mentors" (
    "Mentor_Id" TEXT NOT NULL,
    "Mentor_RollNo" BIGINT NOT NULL,
    "Mentor_Email" TEXT NOT NULL,
    "Mentor_Name" TEXT NOT NULL,
    "Mentor_Description" TEXT,

    CONSTRAINT "Mentors_pkey" PRIMARY KEY ("Mentor_Id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Mentors_Mentor_RollNo_key" ON "Mentors"("Mentor_RollNo");

-- AddForeignKey
ALTER TABLE "MeetingMentor" ADD CONSTRAINT "MeetingMentor_meeting_id_fkey" FOREIGN KEY ("meeting_id") REFERENCES "Meetings"("Meeting_Id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MeetingMentor" ADD CONSTRAINT "MeetingMentor_mentor_id_fkey" FOREIGN KEY ("mentor_id") REFERENCES "Mentors"("Mentor_Id") ON DELETE RESTRICT ON UPDATE CASCADE;
