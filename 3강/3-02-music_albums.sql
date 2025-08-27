
-- 실습 
-- 음악 앨범 정보를 저장하는 문제

-- 요구사항명세
-- 음악 앨범을 저장할 albums 테이블을 만드세요.
-- 저장할 정보:
--     1. 앨범 제목(title)
--     2. 가수/밴드 이름(artist)
--     3. 발매 연도 (release_year)
--     4. 재고 수량(stock)
--     5. 가격(price)
-- CREATE DATABASE IF NOT EXISTS music_albums;

-- USE music_albums;

-- CREATE TABLE IF NOT EXISTS albums(
--     albums_id INT AUTO_INCREMENT PRIMARY KEY,
--     title VARCHAR(200) NOT NULL,
--     artist VARCHAR(100) NOT NULL,
--     release_year INT,
--     stock INT DEFAULT 0 CHECK (stock >= 0),
--     price DECIMAL(6,2) CHECK (price >=0) NOT NULL
-- );

-- INSERT INTO albums(title,artist,release_year,stock,price)
-- VALUES
-- ('WAIT','DAY6',2018,2,35.55),
-- ('아주 슬픈 앨범','BBBB',2020,5,37.62);

SELECT * FROM albums; 
-- albums 테이블의 전체 항목을 보여준다.(*가 전체를 의미)

-- 변경 사항
-- albums의 release_year가 1960년도 이상인 경우만 담도록 제한하세요(TABLE)

DROP TABLE albums;

USE music_albums;

CREATE TABLE IF NOT EXISTS albums(
    albums_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    artist VARCHAR(100) NOT NULL,
    release_year INT CHECK (release_year > 1960),
    stock INT DEFAULT 0 CHECK (stock >= 0),
    price DECIMAL(6,2) CHECK (price >=0) NOT NULL
);



