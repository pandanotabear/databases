-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 192.168.0.120
-- Waktu pembuatan: 25 Bulan Mei 2024 pada 07.07
-- Versi server: 8.0.36-0ubuntu0.22.04.1
-- Versi PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sauproject`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `customerId` int NOT NULL,
  `userId` int NOT NULL,
  `customerName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerStoreName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerAddress` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerPhoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerEmail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customerCoordinate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActived` tinyint(1) DEFAULT '0',
  `createdAt` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `items`
--

CREATE TABLE `items` (
  `itemId` int NOT NULL,
  `productId` int NOT NULL,
  `smallUnit` int NOT NULL,
  `smallStockSellingPrice` double NOT NULL,
  `smallStock` int DEFAULT NULL,
  `largeUnit` int NOT NULL,
  `largeStockSellingPrice` double NOT NULL,
  `largeStock` int DEFAULT NULL,
  `itemStock` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expirationDate` date DEFAULT NULL,
  `createdAt` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `productId` int NOT NULL,
  `supplierId` int NOT NULL,
  `productCode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productAmount` int NOT NULL,
  `productPurchasePrice` double NOT NULL,
  `createdAt` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `profiles`
--

CREATE TABLE `profiles` (
  `profileId` int NOT NULL,
  `userId` int NOT NULL,
  `firstName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchases`
--

CREATE TABLE `purchases` (
  `purchaseId` int NOT NULL,
  `itemId` int NOT NULL,
  `supplierId` int NOT NULL,
  `pruchaseSmallAmount` int DEFAULT NULL,
  `purchaseLargeAmout` int DEFAULT NULL,
  `purchaseDate` datetime(3) NOT NULL,
  `createdAt` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `roleId` int NOT NULL,
  `roleName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roleKey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `salesReport`
--

CREATE TABLE `salesReport` (
  `salesReportId` int NOT NULL,
  `salesReportNumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discountInNominal` double DEFAULT NULL,
  `discountInPercent` double DEFAULT NULL,
  `salesAmount` int NOT NULL,
  `paidTotal` double NOT NULL,
  `totalRemaining` double NOT NULL,
  `peymentMethod` enum('CASH','TRANSFER','CREDIT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `salesReportDate` datetime(3) NOT NULL,
  `salesReportSource` enum('MARKETING','RITAIL_STORE') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stockIn`
--

CREATE TABLE `stockIn` (
  `stockInId` int NOT NULL,
  `itemId` int NOT NULL,
  `stockInAmount` int NOT NULL,
  `stockInFrom` int NOT NULL,
  `transactionType` enum('USER_TO_USER','USER_TO_WAREHOUSE','USER_TO_STORE','STORE_TO_STORE','STORE_TO_WAREHOUSE','STORE_TO_USER','WAREHOUSE_TO_WAREHOUSE','WAREHOUSE_TO_STORE','WAREHOUSE_TO_USER','IN_HOUSE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stockInNotes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stockInDate` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stockInStore`
--

CREATE TABLE `stockInStore` (
  `stockInStoreId` int NOT NULL,
  `itemId` int NOT NULL,
  `storeId` int NOT NULL,
  `totalStockInStore` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0',
  `largeStockInStore` int NOT NULL,
  `smallStockInStore` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stockInUser`
--

CREATE TABLE `stockInUser` (
  `stockInStoreId` int NOT NULL,
  `itemId` int NOT NULL,
  `userId` int NOT NULL,
  `totalStockInUser` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0',
  `largeStockInUser` int NOT NULL,
  `smallStockInUser` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stockInWarehouse`
--

CREATE TABLE `stockInWarehouse` (
  `stockInWarehouseId` int NOT NULL,
  `itemId` int NOT NULL,
  `warehouseId` int NOT NULL,
  `totalStockInWarehouse` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0',
  `largeStockInWarehouse` int NOT NULL,
  `smallStockInWarehouse` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stockOut`
--

CREATE TABLE `stockOut` (
  `stockOutId` int NOT NULL,
  `itemId` int NOT NULL,
  `stockOutAmount` int NOT NULL,
  `stockOutTo` int NOT NULL,
  `transactionType` enum('USER_TO_USER','USER_TO_WAREHOUSE','USER_TO_STORE','STORE_TO_STORE','STORE_TO_WAREHOUSE','STORE_TO_USER','WAREHOUSE_TO_WAREHOUSE','WAREHOUSE_TO_STORE','WAREHOUSE_TO_USER','IN_HOUSE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stockOutNotes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stockOutDate` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stocks`
--

CREATE TABLE `stocks` (
  `stockId` int NOT NULL,
  `itemId` int NOT NULL,
  `totalSmallStock` int NOT NULL,
  `totalLargeStock` int NOT NULL,
  `log` text COLLATE utf8mb4_unicode_ci,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stores`
--

CREATE TABLE `stores` (
  `storeId` int NOT NULL,
  `storeName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeAddress` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storeCoordinate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `supplierId` int NOT NULL,
  `supplierName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplierCompanyName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplierAddress` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplierPhoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplierEmail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplierCoordinate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0',
  `isActive` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `transactionId` int NOT NULL,
  `operatorId` int NOT NULL,
  `userId` int NOT NULL,
  `type` enum('SALES','RITAIL') COLLATE utf8mb4_unicode_ci NOT NULL,
  `salesReportNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `itemId` int NOT NULL,
  `largeQty` int NOT NULL,
  `largeSubTotal` double NOT NULL,
  `smallQty` int NOT NULL,
  `smallSubTotal` double NOT NULL,
  `total` double NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `units`
--

CREATE TABLE `units` (
  `unitId` int NOT NULL,
  `unitKey` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unitName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0',
  `isActive` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `userId` int NOT NULL,
  `roleId` int NOT NULL,
  `userName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isLogin` tinyint(1) DEFAULT '0',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0',
  `salesReportSalesReportId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouses`
--

CREATE TABLE `warehouses` (
  `warehouseId` int NOT NULL,
  `warehouseName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouseAddress` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouseCoordinate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `isDeleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerId`),
  ADD UNIQUE KEY `customers_customerId_key` (`customerId`),
  ADD KEY `customers_userId_key` (`userId`);

--
-- Indeks untuk tabel `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemId`),
  ADD UNIQUE KEY `items_itemId_key` (`itemId`),
  ADD UNIQUE KEY `items_productId_key` (`productId`),
  ADD KEY `largeUnit` (`largeUnit`),
  ADD KEY `smallUnit` (`smallUnit`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productId`),
  ADD UNIQUE KEY `products_productId_key` (`productId`),
  ADD UNIQUE KEY `products_productCode_key` (`productCode`),
  ADD KEY `supplierId` (`supplierId`);

--
-- Indeks untuk tabel `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`profileId`),
  ADD UNIQUE KEY `profiles_profileId_key` (`profileId`),
  ADD UNIQUE KEY `profiles_userId_key` (`userId`);

--
-- Indeks untuk tabel `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`purchaseId`),
  ADD UNIQUE KEY `purchases_purchaseId_key` (`purchaseId`),
  ADD KEY `purchases_itemId_fkey` (`itemId`),
  ADD KEY `purchases_supplierId_fkey` (`supplierId`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleId`),
  ADD UNIQUE KEY `roles_roleId_key` (`roleId`);

--
-- Indeks untuk tabel `salesReport`
--
ALTER TABLE `salesReport`
  ADD PRIMARY KEY (`salesReportId`),
  ADD UNIQUE KEY `salesReport_salesReportId_key` (`salesReportId`),
  ADD KEY `salesReportNumber` (`salesReportNumber`);

--
-- Indeks untuk tabel `stockIn`
--
ALTER TABLE `stockIn`
  ADD PRIMARY KEY (`stockInId`),
  ADD UNIQUE KEY `stockIn_stockInId_key` (`stockInId`),
  ADD KEY `stockIn_itemId_fkey` (`itemId`);

--
-- Indeks untuk tabel `stockInStore`
--
ALTER TABLE `stockInStore`
  ADD PRIMARY KEY (`stockInStoreId`),
  ADD UNIQUE KEY `stockInStore_stockInStoreId_key` (`stockInStoreId`),
  ADD KEY `stockInStore_itemId_fkey` (`itemId`),
  ADD KEY `stockInStore_storeId_fkey` (`storeId`);

--
-- Indeks untuk tabel `stockInUser`
--
ALTER TABLE `stockInUser`
  ADD PRIMARY KEY (`stockInStoreId`),
  ADD UNIQUE KEY `stockInUser_stockInStoreId_key` (`stockInStoreId`),
  ADD KEY `stockInUser_itemId_fkey` (`itemId`),
  ADD KEY `stockInUser_userId_fkey` (`userId`);

--
-- Indeks untuk tabel `stockInWarehouse`
--
ALTER TABLE `stockInWarehouse`
  ADD PRIMARY KEY (`stockInWarehouseId`),
  ADD UNIQUE KEY `stockInWarehouse_stockInWarehouseId_key` (`stockInWarehouseId`),
  ADD KEY `stockInWarehouse_itemId_fkey` (`itemId`),
  ADD KEY `stockInWarehouse_warehouseId_fkey` (`warehouseId`);

--
-- Indeks untuk tabel `stockOut`
--
ALTER TABLE `stockOut`
  ADD PRIMARY KEY (`stockOutId`),
  ADD UNIQUE KEY `stockOut_stockOutId_key` (`stockOutId`),
  ADD KEY `stockOut_itemId_fkey` (`itemId`);

--
-- Indeks untuk tabel `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`stockId`),
  ADD UNIQUE KEY `stocks_stockId_key` (`stockId`),
  ADD KEY `stocks_itemId_fkey` (`itemId`);

--
-- Indeks untuk tabel `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`storeId`),
  ADD UNIQUE KEY `stores_storeId_key` (`storeId`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplierId`),
  ADD UNIQUE KEY `suppliers_supplierId_key` (`supplierId`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transactionId`),
  ADD KEY `salesReportNumber` (`salesReportNumber`);

--
-- Indeks untuk tabel `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unitId`),
  ADD UNIQUE KEY `units_unitId_key` (`unitId`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `users_roleId_key` (`roleId`),
  ADD KEY `users_salesReportSalesReportId_fkey` (`salesReportSalesReportId`);

--
-- Indeks untuk tabel `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`warehouseId`),
  ADD UNIQUE KEY `warehouses_warehouseId_key` (`warehouseId`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `customerId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `items`
--
ALTER TABLE `items`
  MODIFY `itemId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `productId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `profiles`
--
ALTER TABLE `profiles`
  MODIFY `profileId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `purchases`
--
ALTER TABLE `purchases`
  MODIFY `purchaseId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `roleId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `salesReport`
--
ALTER TABLE `salesReport`
  MODIFY `salesReportId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stockIn`
--
ALTER TABLE `stockIn`
  MODIFY `stockInId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stockInStore`
--
ALTER TABLE `stockInStore`
  MODIFY `stockInStoreId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stockInUser`
--
ALTER TABLE `stockInUser`
  MODIFY `stockInStoreId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stockInWarehouse`
--
ALTER TABLE `stockInWarehouse`
  MODIFY `stockInWarehouseId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stockOut`
--
ALTER TABLE `stockOut`
  MODIFY `stockOutId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stocks`
--
ALTER TABLE `stocks`
  MODIFY `stockId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stores`
--
ALTER TABLE `stores`
  MODIFY `storeId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplierId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transactionId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `units`
--
ALTER TABLE `units`
  MODIFY `unitId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `warehouseId` int NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`smallUnit`) REFERENCES `units` (`unitId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`largeUnit`) REFERENCES `units` (`unitId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `items_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_supplierId_fkey` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`supplierId`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `purchases_supplierId_fkey` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`supplierId`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stockIn`
--
ALTER TABLE `stockIn`
  ADD CONSTRAINT `stockIn_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stockInStore`
--
ALTER TABLE `stockInStore`
  ADD CONSTRAINT `stockInStore_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `stockInStore_storeId_fkey` FOREIGN KEY (`storeId`) REFERENCES `stores` (`storeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stockInUser`
--
ALTER TABLE `stockInUser`
  ADD CONSTRAINT `stockInUser_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `stockInUser_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stockInWarehouse`
--
ALTER TABLE `stockInWarehouse`
  ADD CONSTRAINT `stockInWarehouse_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `stockInWarehouse_warehouseId_fkey` FOREIGN KEY (`warehouseId`) REFERENCES `warehouses` (`warehouseId`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stockOut`
--
ALTER TABLE `stockOut`
  ADD CONSTRAINT `stockOut_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `users_salesReportSalesReportId_fkey` FOREIGN KEY (`salesReportSalesReportId`) REFERENCES `salesReport` (`salesReportId`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
