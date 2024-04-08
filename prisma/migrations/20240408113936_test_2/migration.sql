/*
  Warnings:

  - Added the required column `dueDate` to the `Planned` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Planned" ADD COLUMN     "dueDate" TEXT NOT NULL;
