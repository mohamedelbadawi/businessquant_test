-- CreateTable
CREATE TABLE `data` (
    `id` VARCHAR(191) NOT NULL,
    `ticker` VARCHAR(191) NOT NULL,
    `data` DATETIME(3) NOT NULL,
    `revenue` DOUBLE NOT NULL,
    `gp` DOUBLE NOT NULL,
    `fcf` DOUBLE NOT NULL,
    `capex` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
