/*
  Warnings:

  - Made the column `taskId` on table `Planned` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Planned" ALTER COLUMN "taskId" SET NOT NULL;
