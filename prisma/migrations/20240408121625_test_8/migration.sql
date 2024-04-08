/*
  Warnings:

  - You are about to drop the column `content` on the `Task` table. All the data in the column will be lost.
  - Added the required column `updatedAt` to the `Planned` table without a default value. This is not possible if the table is not empty.
  - Made the column `taskId` on table `Planned` required. This step will fail if there are existing NULL values in that column.
  - Made the column `userId` on table `Task` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Planned" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "taskId" SET NOT NULL;

-- AlterTable
ALTER TABLE "Task" DROP COLUMN "content",
ALTER COLUMN "userId" SET NOT NULL;
