CREATE DATABASE IF NOT EXISTS hotel_bookings;

USE hotel_bookings;
-- bookings 테이블 생성
CREATE TABLE IF NOT EXISTS bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    booking_date DATE DEFAULT (CURRENT_DATE),
    checkin_date DATE,
    guest_name VARCHAR(200) NOT NULL,
    room_type VARCHAR(200) NOT NULL,
    total_cost DECIMAL(10,2) CHECK(total_cost > 0),
    is_prepaid BOOLEAN DEFAULT FALSE,
    is_canceled BOOLEAN DEFAULT FALSE
);

--  bookings 테이블에 예시 데이터 삽입
-- INSERT INTO bookings(checkin_date,guest_name,room_type,total_cost,is_prepaid,is_canceled)
-- VALUES
-- (NULL,'Alice','Single',100.50,TRUE,FALSE),
-- 체크인 확정 안됨
-- ('2025-03-31','Bob','Suite',650.00,TRUE,FALSE),
-- 체크인 예정정
-- ('2025-02-26','John','Double',220.40,FALSE,FALSE),
-- ('2025-02-25','Jack','Suite',550.00,FALSE,FALSE),
-- ('2025-02-24','Ann','Single',120.00,TRUE,FALSE);

--  checin_date와 total_cost를 수정정
-- UPDATE bookings
-- SET checkin_date = '2025-10-05',
--     total_cost = 700.50
-- WHERE id = 2; -- 특정 예약만 수정 (Bob)

--  guest_name이 JOHN인 예약 데이터를 삭제
-- DELETE FROM bookings
-- WHERE id = 3;


--  전체 컬럼 조회
-- SELECT * FROM bookings;

--  특정 컬럼만 조회
-- SELECT guest_name, room_type, total_cost FROM bookings;

--  WHERE 절을 통한 행 필터링
-- SELECT * FROM bookings 
-- WHERE total_cost >= 200;

--  날짜는 'YYYY-MM-DD'형태로 문자열로 작성
--  비교 연산자 사용 가능하다.
-- SELECT * FROM bookings
-- WHERE checkin_date > '2025-03-01';

--  범위 내 값(포함) 조회회
-- SELECT * FROM bookings
-- WHERE checkin_date BETWEEN '2025-02-01' AND '2025-02-28';

--  선결제(is_prepaid = TRUE)이면서 동시에 비용이 300 초과
-- SELECT *
-- FROM bookings
-- WHERE is_prepaid = TRUE AND total_cost > 300;

--  취소(is_canceled = TRUE)이거나 혹은 total_cost가 300 미만
-- SELECT * FROM bookings
-- WHERE is_canceled = TRUE OR total_cost < 300;

--  NULL 처리
-- SELECT *
-- FROM bookings
-- WHERE checkin_date IS NULL;

--  BOOLEAN 컬럼 필터링
-- SELECT * FROM bookings
-- WHERE is_prepaid = TRUE;

--  AS <별칭>: 결과에 표시될 컬럼명을 임시 변경 가능
--  상수나 수식(계산식)을 컬럼처럼 조회 가능능
-- SELECT
-- guest_name,
-- room_type,
-- total_cost * 1.1 AS tax_applied_cost,
-- is_prepaid
-- FROM bookings;

-- ORDER BY: 기본 오름차순(ASC), DESC 지정 시 내림차순
-- LIMIT n: 최대 n행만 결과 표시시
-- SELECT *
-- FROM bookings
-- ORDER BY total_cost DESC
-- LIMIT 1;

-- DISTINCT: 방 유형(room_type) 목록을 중복 없이 확인인
-- 결과에서 중복 행(값)을 제거
-- 다른 컬럼과 함께 사용시, 컬럼 조합이 완전히 동일한 행이 중복처리리
-- 문자열은 ORDER BY를 사용하면 알파벳 순으로 정렬된다.
-- SELECT DISTINCT room_type
-- FROM bookings
-- ORDER BY room_type; 

-- total_cost가 200 이하인 예약들을 '하위 비용' 테이블처럼 간주
-- 서브쿼리: 쿼리 결과(임시 테이블)를 다른 쿼리에서 FROM 뒤에 참조조
-- SELECT guest_name, room_type
-- FROM (
--     SELECT *
--     FROM bookings
--     WHERE total_cost < 200
-- ) AS cheap_bookings;

-- VIEW: 특정 쿼리를 저장해두고, 테이블처럼 참조
-- 조회 시 원본 쿼리를 재실행 -> 결과를 항상 최신 상태로 유지지
CREATE VIEW high_cost_view AS
SELECT *
FROM bookings
WHERE total_cost >= 500;

SELECT * FROM high_cost_view




