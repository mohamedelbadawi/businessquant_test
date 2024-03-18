/*
  Warnings:

  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropIndex
DROP INDEX `data_ticker_idx` ON `data`;

-- DropTable
DROP TABLE `user`;

-- CreateIndex
CREATE INDEX `data_ticker_date_idx` ON `data`(`ticker`, `date`);
