/*
  Warnings:

  - Added the required column `duedate` to the `Planned` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Planned" ADD COLUMN     "duedate" TIMESTAMP(3) NOT NULL;
