create database springdb;
use springdb;

drop table if exists users;
create table users(
	id bigint primary key auto_increment,
    userid varchar(20) unique,
    userpasswd varchar(20) not null,
    username varchar(30) not null,
    userage int
);

-- users를 참조하는 boards 테이블 생성
drop table if exists boards; 
create table boards(
	id  bigint primary key auto_increment,
    boardtitle varchar(100) not null,
    userid varchar(20) not null,
    boardcontent text not null,
    hit int default 0,
    createdtime datetime default now(),
    updatedtime datetime,
    foreign key(userid) references users(userid) on delete cascade
);

-- boards를 참조하는 reply 테이블 생성
drop table if exists reply;
create table reply(
	id  bigint primary key auto_increment,
    boardid bigint,
    replyer varchar(20) not null,
    replycontent varchar(4000) not null,
    createdtime datetime default now(),
    updatedtime datetime,
    foreign key(boardid) references boards(id) 
    on delete cascade
);
-- boards 테이블 구조 보기
desc boards;

select * from users;
select * from boards order by id desc;
select * from reply;

select * from reply where id=1;

-- 6번 댓글 삭제
delete from reply where id = 7;

-- 재귀 복사
insert into boards (boardtitle, userid, boardcontent)
(select boardtitle, userid, boardcontent from boards);

-- 전체 게시글 수
select count(id) from boards;

-- limit 시작인덱스, 게시글 개수
select * from boards order by id asc limit 0, 5; -- 1,2,3,4,5 -> 1page
select * from boards order by id asc limit 1, 5; -- 2,3,4,5,6 -> 2page
select * from boards order by id asc limit 2, 5; -- 3,4,5,6,7 -> 3page

-- 1page(0, 5), 2page(5, 5), 3page(10, 5)
select * from boards order by id desc limit 5, 5;

