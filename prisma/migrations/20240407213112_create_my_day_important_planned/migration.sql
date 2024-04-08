/*
  Warnings:

  - You are about to drop the column `important` on the `Task` table. All the data in the column will be lost.
  - You are about to drop the column `planned` on the `Task` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Task" DROP COLUMN "important",
DROP COLUMN "planned";

-- CreateTable
CREATE TABLE "MyDay" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "taskId" TEXT NOT NULL,
    "plannedId" TEXT NOT NULL,

    CONSTRAINT "MyDay_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Important" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "taskId" TEXT NOT NULL,
    "plannedId" TEXT NOT NULL,

    CONSTRAINT "Important_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Planned" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "taskId" TEXT,

    CONSTRAINT "Planned_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MyDay" ADD CONSTRAINT "MyDay_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MyDay" ADD CONSTRAINT "MyDay_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MyDay" ADD CONSTRAINT "MyDay_plannedId_fkey" FOREIGN KEY ("plannedId") REFERENCES "Planned"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Important" ADD CONSTRAINT "Important_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Important" ADD CONSTRAINT "Important_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Important" ADD CONSTRAINT "Important_plannedId_fkey" FOREIGN KEY ("plannedId") REFERENCES "Planned"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Planned" ADD CONSTRAINT "Planned_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Planned" ADD CONSTRAINT "Planned_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE CASCADE ON UPDATE CASCADE;
