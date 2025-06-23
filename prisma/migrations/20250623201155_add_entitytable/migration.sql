-- CreateTable
CREATE TABLE `address` (
    `address_id` BIGINT NOT NULL AUTO_INCREMENT,
    `street` VARCHAR(255) NOT NULL,
    `postal_code` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL,
    `user_id` BIGINT NOT NULL,

    INDEX `address_user_id_foreign`(`user_id`),
    PRIMARY KEY (`address_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cartitem` (
    `cart_item_id` BIGINT NOT NULL AUTO_INCREMENT,
    `shopping_cart_id` BIGINT NOT NULL,
    `product_id` BIGINT NOT NULL,

    INDEX `cartitem_product_id_foreign`(`product_id`),
    INDEX `cartitem_shopping_cart_id_foreign`(`shopping_cart_id`),
    PRIMARY KEY (`cart_item_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `category` (
    `category_id` BIGINT NOT NULL AUTO_INCREMENT,
    `category_name` VARCHAR(255) NOT NULL,
    `product_description` TEXT NOT NULL,

    PRIMARY KEY (`category_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `like` (
    `like_id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `product_id` BIGINT NOT NULL,

    INDEX `like_product_id_foreign`(`product_id`),
    INDEX `like_user_id_foreign`(`user_id`),
    PRIMARY KEY (`like_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order` (
    `order_id` BIGINT NOT NULL AUTO_INCREMENT,
    `date_order` DATETIME(0) NOT NULL,
    `status` ENUM('pending', 'processing', 'shipped', 'delivered', 'canceled', 'returned') NOT NULL,
    `total_amount` DECIMAL(8, 2) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `address_id` BIGINT NOT NULL,

    INDEX `order_address_id_foreign`(`address_id`),
    INDEX `order_user_id_foreign`(`user_id`),
    PRIMARY KEY (`order_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `orderitem` (
    `order_item_id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_id` BIGINT NOT NULL,
    `order_id` BIGINT NOT NULL,
    `quantity` DOUBLE NOT NULL,
    `price_unit` DECIMAL(8, 2) NOT NULL,
    `seller_id` BIGINT NOT NULL,

    INDEX `orderitem_order_id_foreign`(`order_id`),
    INDEX `orderitem_product_id_foreign`(`product_id`),
    INDEX `orderitem_seller_id_foreign`(`seller_id`),
    PRIMARY KEY (`order_item_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payment` (
    `payment_id` BIGINT NOT NULL AUTO_INCREMENT,
    `amount` DOUBLE NOT NULL,
    `payment_method` ENUM('credit_card', 'cash', 'bank_transfer', 'paypal', 'bitcoin', 'cash_on_delivery') NOT NULL,
    `status` ENUM('pending', 'completed', 'failed', 'refunded') NOT NULL,
    `payment_date` DATETIME(0) NOT NULL,
    `order_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,

    INDEX `payment_order_id_foreign`(`order_id`),
    INDEX `payment_user_id_foreign`(`user_id`),
    PRIMARY KEY (`payment_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product` (
    `product_id` BIGINT NOT NULL AUTO_INCREMENT,
    `seller_id` BIGINT NOT NULL,
    `product_name` VARCHAR(255) NOT NULL,
    `product_description` TEXT NOT NULL,
    `product_price` DOUBLE NOT NULL,
    `product_stock` BIGINT NOT NULL,
    `created_at` DATETIME(0) NOT NULL,

    INDEX `product_seller_id_foreign`(`seller_id`),
    PRIMARY KEY (`product_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_category` (
    `product_category_id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_id` BIGINT NOT NULL,
    `category_id` BIGINT NOT NULL,

    INDEX `product_category_category_id_foreign`(`category_id`),
    INDEX `product_category_product_id_foreign`(`product_id`),
    PRIMARY KEY (`product_category_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `review` (
    `review_id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `product_id` BIGINT NOT NULL,
    `rating` ENUM('1', '2', '3', '4', '5') NOT NULL,
    `comment` VARCHAR(255) NOT NULL,
    `publication_date` DATETIME(0) NOT NULL,

    INDEX `review_product_id_foreign`(`product_id`),
    INDEX `review_user_id_foreign`(`user_id`),
    PRIMARY KEY (`review_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `seller` (
    `seller_id` BIGINT NOT NULL AUTO_INCREMENT,
    `address_id` BIGINT NOT NULL,
    `store_name` VARCHAR(255) NOT NULL,
    `contact_phone` VARCHAR(255) NOT NULL,
    `email_seller` VARCHAR(255) NOT NULL,
    `information_seller` VARCHAR(255) NOT NULL,

    INDEX `seller_address_id_foreign`(`address_id`),
    PRIMARY KEY (`seller_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `shipment` (
    `shipment_id` BIGINT NOT NULL AUTO_INCREMENT,
    `shipment_date` DATETIME(0) NOT NULL,
    `shipment_type` ENUM('standard', 'express', 'overnight') NOT NULL,
    `status` ENUM('pending', 'in_transit', 'delivered', 'canceled') NOT NULL,
    `order_id` BIGINT NOT NULL,

    INDEX `shipment_order_id_foreign`(`order_id`),
    PRIMARY KEY (`shipment_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `shoppingcart` (
    `shopping_cart_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(0) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `user_session_id` BIGINT NOT NULL,

    INDEX `shoppingcart_user_id_foreign`(`user_id`),
    INDEX `shoppingcart_user_session_id_foreign`(`user_session_id`),
    PRIMARY KEY (`shopping_cart_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `user_id` BIGINT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` TEXT NOT NULL,
    `role` ENUM('visitor', 'customer', 'seller', 'admin') NOT NULL,
    `address_id` BIGINT NOT NULL,
    `seller_id` BIGINT NULL,

    INDEX `user_seller_id_foreign`(`seller_id`),
    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usersession` (
    `user_session_id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `refresh_token` BIGINT NOT NULL,
    `created_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `expires_at` DATETIME(0) NOT NULL,

    INDEX `usersession_user_id_foreign`(`user_id`),
    PRIMARY KEY (`user_session_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `entitytable` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `field_1` VARCHAR(191) NOT NULL,
    `field_2` BOOLEAN NOT NULL DEFAULT false,
    `field_3` INTEGER NOT NULL,
    `field_4` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `address` ADD CONSTRAINT `address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `cartitem` ADD CONSTRAINT `cartitem_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `cartitem` ADD CONSTRAINT `cartitem_shopping_cart_id_foreign` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shoppingcart`(`shopping_cart_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `like` ADD CONSTRAINT `like_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `like` ADD CONSTRAINT `like_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `order` ADD CONSTRAINT `order_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `address`(`address_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `order` ADD CONSTRAINT `order_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `orderitem` ADD CONSTRAINT `orderitem_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order`(`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `orderitem` ADD CONSTRAINT `orderitem_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `orderitem` ADD CONSTRAINT `orderitem_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `seller`(`seller_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `payment` ADD CONSTRAINT `payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order`(`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `payment` ADD CONSTRAINT `payment_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `product_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `seller`(`seller_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `product_category` ADD CONSTRAINT `product_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category`(`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `product_category` ADD CONSTRAINT `product_category_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `review_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `review_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `seller` ADD CONSTRAINT `seller_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `address`(`address_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `shipment` ADD CONSTRAINT `shipment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order`(`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `shoppingcart` ADD CONSTRAINT `shoppingcart_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `shoppingcart` ADD CONSTRAINT `shoppingcart_user_session_id_foreign` FOREIGN KEY (`user_session_id`) REFERENCES `usersession`(`user_session_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `seller`(`seller_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usersession` ADD CONSTRAINT `usersession_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
