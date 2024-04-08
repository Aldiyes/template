/*
  Warnings:

  - You are about to drop the column `userId` on the `Important` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `MyDay` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Planned` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Important" DROP CONSTRAINT "Important_userId_fkey";

-- DropForeignKey
ALTER TABLE "MyDay" DROP CONSTRAINT "MyDay_userId_fkey";

-- DropForeignKey
ALTER TABLE "Planned" DROP CONSTRAINT "Planned_userId_fkey";

-- AlterTable
ALTER TABLE "Important" DROP COLUMN "userId";

-- AlterTable
ALTER TABLE "MyDay" DROP COLUMN "userId";

-- AlterTable
ALTER TABLE "Planned" DROP COLUMN "userId";
