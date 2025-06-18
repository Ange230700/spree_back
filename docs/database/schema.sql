-- docs\database\schema.sql

CREATE TABLE `address`(
    `address_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `street` VARCHAR(255) NOT NULL,
    `postal_code` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL,
    `user_id` BIGINT(20) NOT NULL
);
CREATE TABLE `cartitem`(
    `cart_item_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `shopping_cart_id` BIGINT(20) NOT NULL,
    `product_id` BIGINT(20) NOT NULL
);
CREATE TABLE `category`(
    `category_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_name` VARCHAR(255) NOT NULL,
    `product_description` TEXT NOT NULL
);
CREATE TABLE `like`(
    `like_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT(20) NOT NULL,
    `product_id` BIGINT(20) NOT NULL
);
CREATE TABLE `order`(
    `order_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date_order` DATETIME NOT NULL,
    `status` ENUM('pending', 'processing', 'shipped', 'delivered', 'canceled', 'returned') NOT NULL,
    `total_amount` DECIMAL(8, 2) NOT NULL,
    `user_id` BIGINT(20) NOT NULL,
    `address_id` BIGINT(20) NOT NULL
);
CREATE TABLE `orderitem`(
    `order_item_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT(20) NOT NULL,
    `order_id` BIGINT(20) NOT NULL,
    `quantity` DOUBLE NOT NULL,
    `price_unit` DECIMAL(8, 2) NOT NULL,
    `seller_id` BIGINT(20) NOT NULL
);
CREATE TABLE `payment`(
    `payment_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `amount` DOUBLE NOT NULL,
    `payment_method` ENUM('credit_card', 'cash', 'bank_transfer', 'paypal', 'bitcoin', 'cash_on_delivery') NOT NULL,
    `status` ENUM('pending', 'completed', 'failed', 'refunded') NOT NULL,
    `payment_date` DATETIME NOT NULL,
    `order_id` BIGINT(20) NOT NULL,
    `user_id` BIGINT(20) NOT NULL
);
CREATE TABLE `product`(
    `product_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `seller_id` BIGINT(20) NOT NULL,
    `product_name` VARCHAR(255) NOT NULL,
    `product_description` TEXT NOT NULL,
    `product_price` DOUBLE NOT NULL,
    `product_stock` BIGINT(20) NOT NULL,
    `created_at` DATETIME NOT NULL
);
CREATE TABLE `product_category`(
    `product_category_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT(20) NOT NULL,
    `category_id` BIGINT(20) NOT NULL
);
CREATE TABLE `review`(
    `review_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT(20) NOT NULL,
    `product_id` BIGINT(20) NOT NULL,
    `rating` ENUM('1', '2', '3', '4', '5') NOT NULL,
    `comment` VARCHAR(255) NOT NULL,
    `publication_date` DATETIME NOT NULL
);
CREATE TABLE `seller`(
    `seller_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `address_id` BIGINT(20) NOT NULL,
    `store_name` VARCHAR(255) NOT NULL,
    `contact_phone` VARCHAR(255) NOT NULL,
    `email_seller` VARCHAR(255) NOT NULL,
    `information_seller` VARCHAR(255) NOT NULL
);
CREATE TABLE `shipment`(
    `shipment_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `shipment_date` DATETIME NOT NULL,
    `shipment_type` ENUM('standard', 'express', 'overnight') NOT NULL,
    `status` ENUM('pending', 'in_transit', 'delivered', 'canceled') NOT NULL,
    `order_id` BIGINT(20) NOT NULL
);
CREATE TABLE `shoppingcart`(
    `shopping_cart_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `created_at` DATETIME NOT NULL,
    `user_id` BIGINT(20) NOT NULL,
    `user_session_id` BIGINT(20) NOT NULL
);
CREATE TABLE `user`(
    `user_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` TEXT NOT NULL,
    `role` ENUM('visitor', 'customer', 'seller', 'admin') NOT NULL,
    `address_id` BIGINT(20) NOT NULL,
    `seller_id` BIGINT(20) NULL DEFAULT NULL
);
CREATE TABLE `usersession`(
    `user_session_id` BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT(20) NOT NULL,
    `refresh_token` BIGINT(20) NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    `expires_at` DATETIME NOT NULL
);
ALTER TABLE
    `address` ADD CONSTRAINT `address_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`user_id`);
ALTER TABLE
    `orderitem` ADD CONSTRAINT `orderitem_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`);
ALTER TABLE
    `orderitem` ADD CONSTRAINT `orderitem_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `order`(`order_id`);
ALTER TABLE
    `orderitem` ADD CONSTRAINT `orderitem_seller_id_foreign` FOREIGN KEY(`seller_id`) REFERENCES `seller`(`seller_id`);
ALTER TABLE
    `product` ADD CONSTRAINT `product_seller_id_foreign` FOREIGN KEY(`seller_id`) REFERENCES `seller`(`seller_id`);
ALTER TABLE
    `user` ADD CONSTRAINT `user_seller_id_foreign` FOREIGN KEY(`seller_id`) REFERENCES `seller`(`seller_id`);
ALTER TABLE
    `shipment` ADD CONSTRAINT `shipment_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `order`(`order_id`);
ALTER TABLE
    `review` ADD CONSTRAINT `review_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`user_id`);
ALTER TABLE
    `review` ADD CONSTRAINT `review_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`);
ALTER TABLE
    `seller` ADD CONSTRAINT `seller_address_id_foreign` FOREIGN KEY(`address_id`) REFERENCES `address`(`address_id`);
ALTER TABLE
    `order` ADD CONSTRAINT `order_address_id_foreign` FOREIGN KEY(`address_id`) REFERENCES `address`(`address_id`);
ALTER TABLE
    `usersession` ADD CONSTRAINT `usersession_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`user_id`);
ALTER TABLE
    `product_category` ADD CONSTRAINT `product_category_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `category`(`category_id`);
ALTER TABLE
    `product_category` ADD CONSTRAINT `product_category_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`);
ALTER TABLE
    `cartitem` ADD CONSTRAINT `cartitem_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`);
ALTER TABLE
    `cartitem` ADD CONSTRAINT `cartitem_shopping_cart_id_foreign` FOREIGN KEY(`shopping_cart_id`) REFERENCES `shoppingcart`(`shopping_cart_id`);
ALTER TABLE
    `like` ADD CONSTRAINT `like_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `product`(`product_id`);
ALTER TABLE
    `like` ADD CONSTRAINT `like_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`user_id`);
ALTER TABLE
    `order` ADD CONSTRAINT `order_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`user_id`);
ALTER TABLE
    `shoppingcart` ADD CONSTRAINT `shoppingcart_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`user_id`);
ALTER TABLE
    `shoppingcart` ADD CONSTRAINT `shoppingcart_user_session_id_foreign` FOREIGN KEY(`user_session_id`) REFERENCES `usersession`(`user_session_id`);
ALTER TABLE
    `payment` ADD CONSTRAINT `payment_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`user_id`);
ALTER TABLE
    `payment` ADD CONSTRAINT `payment_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `order`(`order_id`);