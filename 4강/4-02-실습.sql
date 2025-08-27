CREATE DATABASE IF NOT EXISTS hotel_bookings;

USE hotel_bookings;
-- bookings 테이블 생성
CREATE TABLE IF NOT EXISTS bookings2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    booking_date DATE DEFAULT (CURRENT_DATE),
    checkin_date DATE,
    guest_name VARCHAR(200) NOT NULL,
    room_type VARCHAR(200) NOT NULL,
    total_cost DECIMAL(10,2) CHECK(total_cost > 0),
    is_prepaid BOOLEAN DEFAULT FALSE,
    is_canceled BOOLEAN DEFAULT FALSE
);

/* 실습
1. 데이터 삽입
1) 최소 5건 이상의 예약 정보를 넣자.
2) guest_name, room_type, total_cost는 반드시 지정
3) checkin_date는 NULL이거나 특정 날짜를 지정.
4) is_prepaid, is_canceled 는 자유롭게 지정

2. 데이터 조회 및 필터링
1) 선결제이면서, 취소되지 않은 예약만 조회
2) 결과를 total_cost 내림차순으로 정렬
3) 상위 3개 결과만 표시

3. 데이터 수정
1) 체크인 날짜가 확정되지 않았던 예약들 중
room_type이 'single'이면서 total_cost가 100이하인 예약은 모두 취소한다고 가정
--> 이 조건들을 모두 만족하는 행들에 대해, is_canceled를 TRUE로 업데이트

4. 데이터 삭제
현시점으로부터 2년 뒤의 예약은 모두 삭제하려 한다. ('2027-02-21')

5. DISTINCT
현재까지 등록된 예약 정보중에서 중복 없는 방 유형 목록을 보고 싶다. 또 게스트 이름도 중복 없이 얻을 수 있도록 하자.

6. 서브쿼리 & 뷰
1) 서브쿼리
    조건: total_cost가 전체 예약 평균(AVG(total_cost))보다 높은 예약만 조회
2) 뷰
    목표: costly_booking라는 뷰를 만들어라
    total_cost가 300 이상이면서, is canceled가 FALSE인 예약만 담기는 뷰
*/

INSERT INTO bookings2(checkin_date, guest_name,room_type,total_cost,is_prepaid,is_canceled)
VALUES
(NULL,'Alice','Single',100.50,TRUE,FALSE),
(NULL,'Bob','Suite',650.00,TRUE,TRUE),
(NULL,'John','Double',220.40,FALSE,FALSE),
('2027-08-25','Jack','Suite',550.00,FALSE,TRUE),
('2025-02-24','Jack','Single',120.00,TRUE,FALSE);

SELECT * FROM bookings2
WHERE is_prepaid = TRUE AND is_canceled = FALSE
ORDER BY total_cost DESC
LIMIT 3;

UPDATE bookings2
SET is_canceled = TRUE
WHERE checkin_date IS NULL AND 
-- NULL여부는 =이 아니라 IS를 사용
room_type = 'Single' AND 
total_cost <= 100;

DELETE FROM bookings2
WHERE checkin_date > '2027-02-21';

SELECT DISTINCT room_type, guest_name
FROM bookings2;


-- 서브쿼리
SELECT * FROM bookings2
WHERE total_cost > (SELECT AVG(total_cost) FROM bookings2);

-- 뷰
CREATE VIEW costly_bookings AS
SELECT * FROM bookings2
WHERE total_cost >= 300
AND is_canceled = FALSE;

SELECT * FROM costly_bookings;




