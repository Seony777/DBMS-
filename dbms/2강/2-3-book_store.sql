/*
window 기준 ctrl + / 누르면 해당 언어에 해당하는 주석 생성
*/
-- 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS online_bookstore;

-- 사용할 데이터베이스 선택
USE online_bookstore;

-- 일반적으로는 테이블명을 복수형으로 만든다. 여러개가 담기므로
-- books 테이블: 책 데이터들을 저장 가능
CREATE TABLE IF NOT EXISTS books (
    title VARCHAR(200), 
    author VARCHAR(100),
    price DECIMAL(6,2),
    is_published BOOLEAN
);

-- customer 테이블: 고객 정보들을 저장장
CREATE TABLE IF NOT EXISTS customers(
    customer_name VARCHAR(100),
    email VARCHAR(200),
    membership_level ENUM('standard','premium','vip')
    
);

-- orders 테이블: 주문 데이터를 저장장
CREATE TABLE IF NOT EXISTS orders(
    order_date TIMESTAMP, 
    quantity INT,
    order_message TEXT 
);

-- 1) books 테이블 예시 데이터터
INSERT INTO books(title, author, price, is_published)
VALUES
('역사의 쓸모','최태성',19.99,TRUE),
('sweep spot','샘 리처드',25.50,FALSE),
('싯다르타','헤르만 헤세',13.45,TRUE);

-- books 테이블 데이터 확인
SELECT * FROM books;


DROP DATABASE online_bookstore;