/*
  Warnings:

  - You are about to drop the column `duedate` on the `Planned` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Planned" DROP COLUMN "duedate",
ALTER COLUMN "taskId" DROP NOT NULL;
