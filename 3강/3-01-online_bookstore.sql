-- 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS online_bookstore;

-- 사용할 데이터베이스 선택
USE online_bookstore;

-- 일반적으로는 테이블명을 복수형으로 만든다. 여러개가 담기므로
-- books 테이블: 책 데이터들을 저장 가능
CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL, -- 책 제목은 항상 필요요 
    author VARCHAR(100),
    price DECIMAL(6,2) CHECK (price > 0),-- 0보다 크고 9999.99까지 가능능
    is_published BOOLEAN
);



-- ALTER TABLE books
-- MODIFY COLUMN title VARCHAR(200) NOT NULL;

-- -- customer 테이블: 고객 정보들을 저장장
CREATE TABLE IF NOT EXISTS customers(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(200),
    membership_level ENUM('standard','premium','vip')
    
);

-- DROP TABLE IF EXISTS customers;

-- orders 테이블: 주문 데이터를 저장장
CREATE TABLE IF NOT EXISTS orders(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quantity INT,
    order_message TEXT 
);

-- ALTER TABLE orders
-- MODIFY COLUMN order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- INSERT INTO orders(order_date,quantity,order_message)
-- VALUES
-- (NULL,3,'제발 빨리 보내주세요!'),
-- ('2025-01-06 21:44:57',1,'새해 복 많이 받으세요!');

-- INSERT INTO orders(quantity,order_message)
-- VALUES
-- (4,'항상 감사합니다.');

-- 1) books 테이블 예시 데이터터
INSERT INTO books(title, author, price, is_published)
VALUES
('역사의 쓸모','최태성',15.50,TRUE),
('sweep spot','샘 리처드',25.50,FALSE),
('싯다르타','헤르만 헤세',13.45,TRUE);

-- books 테이블 데이터 확인
SELECT * FROM books;

