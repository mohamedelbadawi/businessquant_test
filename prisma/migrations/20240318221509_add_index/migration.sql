/*
  Warnings:

  - You are about to drop the column `data` on the `data` table. All the data in the column will be lost.
  - Added the required column `date` to the `data` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `data` DROP COLUMN `data`,
    ADD COLUMN `date` DATETIME(3) NOT NULL;

-- CreateIndex
CREATE INDEX `data_ticker_idx` ON `data`(`ticker`);
