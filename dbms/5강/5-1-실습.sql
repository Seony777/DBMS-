/* 
실습: 주문 관리 시스템

orders 테이블

id: 식별자
order_date: 주문일자(기본값으로 CURRENT_DATE)
customer_name: 고객명(문자열)
product_name: 상품명(문자열)
quantity: 수량
total_price: 주문 총 금액
is_paid: 결제 여부
is_delivered: 배송 여부

1) 위의 정보를 가지고 직접 테이블을 만들어라
2) 데이터 삽입: 최소 5개 정도
3) 데이터 조회: 
product_name, total_price 조회
    1. total_price가 1000원 이상
    2. is_delivered가 true여야 한다.
    옵션. customer_name이 Bob이어야 한다

4) ORDER BY, LIMIT: 가장 높은 금액 순으로 DESC, 상위 3건만
5) DISTINCT: 중복 없이 상품명만 확인
6) 데이터 갱신(update): 
    - 배송되지 않은 주문 중, 총액이 1200원 이상인 주문은 특별 프로모션으로 수량을 1개 더 추가해주기
    - 또 아직 결제되지 않았다면 자동결제로 전환 처리
7) 데이터 삭제(delete): 1년 이상 된 오래도니 주문들은 모두 삭제
8) 서브쿼리: 평균 결제액보다 높은 주문만 조회
9) 뷰: 비싼 주문만 담는 expensive_orders라는 뷰를 생성
    기준: total_price가 1000원 이상이면서 아직 배송중인 주문문
*/

CREATE DATABASE IF NOT EXISTS order_system_db;

USE order_system_db;

CREATE TABLE IF NOT EXISTS order_systems(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE DEFAULT (CURRENT_DATE),
    customer_name VARCHAR(200) NOT NULL,
    product_name VARCHAR(200) NOT NULL,
    quantity INT CHECK (quantity >= 1),
    total_price DECIMAL(10,2) CHECK (total_price > 0),
    is_paid BOOLEAN DEFAULT FALSE,
    is_delivered BOOLEAN DEFAULT FALSE
);

-- INSERT INTO order_systems(customer_name, product_name, quantity, total_price, is_paid, is_delivered)
-- VALUES
-- ('Alice','Macbook',1,1500.50,TRUE,FALSE),
-- ('Bob','K2',2,1000.40,FALSE,TRUE),
-- ('Charlie','Galaxy 25',3,800.60,TRUE,FALSE),
-- ('Diana','Alien',4,2000.20,FALSE,TRUE),
-- ('John','Trackpad',5,400.80,true,FALSE);

-- SELECT product_name, total_price
-- FROM order_systems
-- WHERE total_price >= 1000
-- AND is_delivered = TRUE;

-- SELECT *
-- FROM order_systems
-- ORDER BY total_price DESC
-- LIMIT 3;

-- SELECT DISTINCT product_name
-- FROM order_systems
-- ORDER BY product_name;

-- UPDATE order_systems
-- SET quantity = quantity + 1, is_paid = true
-- WHERE is_delivered = FALSE
-- AND is_paid = FALSE;

-- DELETE FROM order_systems
-- WHERE order_date < '2024-02-24';

-- SELECT * FROM order_systems
-- WHERE total_price > (SELECT AVG(total_price) FROM order_systems);

-- CREATE VIEW expensive_orders AS
-- SELECT * FROM order_systems
-- WHERE total_price >= 1000
-- AND is_delivered = FALSE;

-- SELECT * FROM expensive_orders;