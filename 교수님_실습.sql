SELECT * FROM yhdb.books;

-- 문자열을 합치는 함수 concat() 
-- author_fname 과 author_lname 컬럼의 문자열을 
-- 하나로 합해서, full_name 으로 보여주고 싶다. 
select concat(author_fname , ' ' , author_lname) as full_name  
from books;

-- concat_ws() 함수를 사용하는 방법 
-- 첫번째 파라미터가, 문자열을 붙일때 사용할 문자열이다.
select concat_ws(' ', author_fname, author_lname)  as full_name
from books;

-- 이름 두개를 붙여서, full_name 을 만들고, 
-- 책 제목과 출간년도도 같이 보여달라.
select concat(author_fname, ' ', author_lname) as full_name , title, released_year
from books;

-- 문자열의 일부분만 가져오는 함수 substring()

-- 책 제목을, 첫글자부터 10번째 글자까지만 가져오시오.
-- 서브스트링 함수의 시작위치는 1부터!!!
select substring( title , 1, 10 ) as title
from books;

-- 제목을, 맨 뒤에서 5번째 글자부터, 끝까지 나오도록 
-- 데이터를 가져오시오.
select substring(title , -5)
from books;

-- 제목을, 앞에서 3번째 글자부터, 끝까지 나오도록
-- 데이터를 가져오시오.
select substring(title , 3)
from books;

-- 문자열의 내용을 바꾸는 함수 replace() 
-- 책 제목에, The 가 있으면, Hello 로 바꾸고 싶다.
select replace( title , 'The' , 'Hello')
from books;

-- 문자열의 내용을 바꾸는 함수 replace() 
-- 책 제목에, The 가 있으면, 제거하고 싶다.
select replace( title , 'The' , '')
from books;

-- 문자열의 순서를, 역순으로 바꿔주는 함수 reverse()
-- 작가 author_lname 을 역순으로 가져오시오. 
select reverse( author_lname ) as author
from books;

-- 문자열의 갯수를 구하는 함수 char_length()
-- 책 제목의 글자 갯수를 구하세요.
select char_length( title ) as length, title, pages
from books;

-- 대소문자 처리하는 함수 upper()  lower() 
-- author_fname은 대문자로, author_lname은 소문자로 가져오시오.

select upper(author_fname) as author_fname , lower(author_lname) as author_lname
from books;

-- 여러 함수의 조합 

-- 책 제목을, 맨 앞부터 10글자 까지만 가져오고, 뒤에 ... 을 붙인다.
select concat( substr(title, 1, 10) , '...' ) as title
from books;


select replace(title, ' ', '->') as title
from books;

select author_lname as forwards,  
		reverse(author_lname) as backwards
from books;



select  upper( concat( author_fname, ' ', author_lname) ) as 'full name in caps'
from books;


select  concat( title, ' was released in ', released_year ) as blurb
from books;


select title ,  char_length(title) as 'character count'
from books;


select concat( substr( title, 1, 10) , '...') as 'short title' , 
		concat( author_lname, ',' , author_fname) as 'author' , 
        concat( stock_quantity , ' in stock' ) as 'quantity'
from books;



select * 
from books;

-- 데이터를 중복제거해서 유니크 하게 가져오는 키워드(함수 아님!)
-- author_lname 은 카테고리컬 데이터다.(중복데이터가있음)
-- 이 컬럼의 데이터를 유니크 하게 가져오자.
select distinct  author_lname
from books;

-- full name 으로, 중복제거해서 유니크하게 이름 가져오자.
select distinct concat( author_fname, ' ', author_lname ) as author
from books;

-- 정렬 (오름차순정렬 / 내림차순정렬)
-- order by 키워드를 사용.
-- 이 키워드의 위치가 중요하다! => 항상 from 아래에 위치해야함.

-- author_lname 으로 정렬하시오.
select *
from books
order by author_lname;

select *
from books
order by author_lname asc ;

-- 내림차순 정렬
select *
from books
order by author_lname desc;

-- full name 으로 정렬하세요.
select id, title, author_fname, author_lname, released_year, stock_quantity, pages,  concat(author_fname, ' ', author_lname) as 'full name'
from books
order by `full name` asc;

-- 출판년도 내림차순으로 정렬하되, 
-- 책 제목, 출판년도, 페이지수를 가져오시오.
select title, released_year, pages
from books
order by released_year desc;


-- 테이블의 원래 컬럼을 모두 표시하고, 추가로 다른 컬럼을 
-- 표시하고 싶을때
select * , concat(author_fname,' ',author_lname) as full_name
from books;

-- author_lname 으로 오름차순 정렬하고, 
-- lname이 같으면, author_fname으로 내림차순 정렬하시오.
select *
from books
order by author_lname asc, author_fname desc;

-- 데이터를 끊어서 가져오는 방법 
-- limit 키워드! (오프셋과 갯수)

-- books 테이블의 데이터를 5개만 가져오시오.
select *
from books
limit 0, 5;

-- 그리고 나서 위의 5개 이후의데이터를 또 5개만 가져오시오.
select *
from books
limit 5, 5;

select *
from books
limit 10, 5;

select *
from books
limit 15, 5;

-- 출판년도를 내림차순으로 정렬한후,
-- 처음부터 7개의 데이터를 가져오시오. 
select *
from books
order by released_year desc
limit 0, 7;

-- 문자열 안에,  원하는 문자열이 들어있는지 검색
-- like 키워드 

-- 책 제목에 the 가 들어있는 데이터를 가져오시오
select *
from books
where title like '%the%';

-- 책 제목이 the 로 시작하는 책을 찾으시오. 
select *
from books
where title like 'the%';

-- 책 제목이 the 로 끝나는 책을 찾으시오. 
select *
from books
where title like '%the';

-- stock_quantity 의 숫자가, 2자리수인 데이터를 찾으시오.
select *
from books
where stock_quantity like '__';

-- 1. 
select *
from books
where title like '%stories%';

-- 2. 
select title, pages
from books
order by pages desc
limit 0, 1;

-- 3.
select concat( title, ' - ', released_year ) as summary
from books
order by released_year desc
limit 0, 3;

-- 4.
select title, author_lname
from books
where author_lname like '% %' ;

select title, released_year, stock_quantity
from books
order by stock_quantity
limit 0, 3;


select title, author_lname
from books
order by author_lname asc, title asc;

select upper(concat('my favorite author is ', author_fname, author_lname, '!'))  as yell
from books
order by author_lname;

-- 데이터의 갯수를 세는 함수 count() 

-- books 테이블의 전체 데이터는 몇개???
select count(*)
from books;

-- author_lname 컬럼의 전체 데이터갯수는 몇개?? 
select count( author_lname )
from books;

-- author_lname은 중복데이터가 있다. 
-- 따라서, 중복데이터 제거한 유니크한 데이터의 갯수는 몇개??
select count( distinct author_lname )
from books;

-- 책 제목에 the 가 들어있는 책은, 몇권입니까?
select count(*)
from books
where title like '%the%';

-- 카테고리컬 데이터의 경우
-- ~ 별로 묶어서 처리할 수 있다. => group by 키워드!!

-- author_lname 별로, 몇권의 책을 썼는지 권수를 보여주세요.

select author_lname, count(author_lname) as book_count
from books
group by author_lname ;

-- 년도별로 각각 몇권의 책이 출간되었는지
-- 년도와 책의갯수를 보여주세요.

select released_year,  count(released_year) as cnt
from books
group by released_year
order by cnt desc;

-- 최대값 구하는 함수  max()
-- 페이지수가 가장 많은 책은, 몇페이지 입니까?
select max(pages)  
from books;


-- 최소값 구하는 함수 min()
-- 출판년도가 가장 빠른 책은 몇년도 인가??
select min( released_year )
from books;

-- 페이지의 최소값과 최대값을 함께 보여주시오. 
select min(pages) as min , max(pages) as max
from books;

-- 페이지수가 가장 긴 책의,
-- 제목과 페이지수를 보여주세요. 
-- 방법 2 :  Sub Query 서브 쿼리 
select max(pages)
from books;
-- 634 

select *
from books
where pages = 634;

select title, pages
from books
where pages = ( select max(pages) from books ) ;


-- 방법 1
select title, pages
from books
order by pages desc
limit 0,1;

-- stock_quantity 가 가장 적은 책의 
-- 책 제목, 작가 fname, 페이지수를 보여주세요.
select min(stock_quantity)
from books;
-- 12 

select title, author_fname, pages
from books
where stock_quantity = (select min(stock_quantity) from books);

-- 각 작가의 full_name 별로,
-- 해당 작가의 최초 책 발간한 년도는 언제인지
-- 작가의 full_name과 발간년도를 보여주세요. 
select concat(author_fname, ' ',author_lname) as full_name, min(released_year)
from books
group by full_name;

-- 각 작가별(풀 네임별) 자신이 쓴 책중에서 가장 긴 책의 
-- 페이지수를 보여주세요. (작가 풀네임, 페이지수)

use yhdb;

select concat(author_fname,' ', author_lname) as full_name , max(pages) as max
from books
group by author_fname, author_lname ;

-- 값을 더해주는 sum() 함수
-- books 테이블의 모든 책의 페이지수를 다 더하면 ? 
select sum(pages)
from books;

-- 평균 구하는 avg() 함수
-- books 테이블의 페이지수 평균??
select avg(pages)
from books;

-- 년도별로 stock_quantity 의 평균을 구하세요. 
select  released_year  , avg(stock_quantity) as avg
from books
group by released_year
order by avg desc;

-- 조건에 맞는 데이터를 가져오는 방법, 여러 조건이 섞여 있을때 

-- 출판년도가 2017년도인 책 데이터를 가져오시오. 
select *
from books
where released_year = 2017 ;

-- 출판년도가 2017이 아닌 책 데이터를 가져오시오. 
select *
from books
where released_year != 2017 ;

-- author_lname 이 Harris 가 아닌 데이터를 가져오되,
-- 책 제목과 페이지수 만 가져오시오. 
select title, pages
from books
where author_lname != 'Harris';

-- 책 제목에 w 가 포함된 책을 가져오시오. 
select *
from books
where title like '%w%';

-- 책 제목에 w 가 없는 책을 가져오시오. 
select *
from books
where title not like '%w%';

-- 책의 재고가 100개 이상인 데이터의 책 제목과 제고수량만 보여주세요.
select title, stock_quantity
from books
where stock_quantity >= 100;

-- 출판년도가 1990년에서 2015년 사이의 책 데이터를 가져오시오. 
-- released_year >= 1990 이고 released_year <= 2015

select * 
from books
where released_year >= 1990 and released_year <= 2015;

select *
from books
where released_year between 1990 and 2015;

-- 책 제고가, 100권이상이거나 30권 이하인 책들만 가져오시오. 
select *
from books
where stock_quantity >= 100 or stock_quantity <= 30;

-- author_lname 이 Eggers 이거나, 출판년도가 2010년 이상인 책만 가져오시오.
select *
from books
where author_lname = 'Eggers' or released_year >= 2010;

select *
from books;

-- 테이블에 존재하지 않는 컬럼에 대한 조건일 경우!! 
-- 특히, group by 일때!!!!!! 조건을 처리하는 방법

-- 년도별 재고의 평균값이 70보다 큰 책들의, 년도와 평균값을 보여주세요.
select released_year , avg(stock_quantity) as avg_stock
from books
group by released_year
having avg_stock >= 70;

-- 출판년도가 2000년 이상인 데이터에서, 년도별 재고수량의 평균값이 70보다 큰
-- 책들의,  년도와 평균값을 보여주세요. 
select * , avg(stock_quantity) as avg
from books
where released_year >= 2000
group by released_year
having avg >= 70 ;

-- 출판년도가 2000년 이상인 책들은 '최근책' 이라고 하고,
-- 그렇지 않은 책들은, '예전책' 이라고 하여,
-- type 이라는 컬럼을 추가하여 가져오시오. 

select * , 
		case 
			when released_year >= 2000 then '최근책'
            else '예전책'
        end as type
from books;

-- 재고가 0부터 50까지이면 '*' 
-- 재고가 51부터 100까지이면 '**'
-- 그렇지 않으면, '***' 으로 하여, stock 이라는 컬럼을 추가하시오.
select * ,  
		case 
			when stock_quantity between 0 and 50 then '*'
            when stock_quantity between 51 and 100  then '**'
            else '***'
        end as stock
from books;

-- 조건이 2개인경우에는, 
-- case  end 를 사용해도 되고,
-- if()함수를 사용해도 된다! => 조건이 2개일때는 if()가 더 편하다.

-- 출판년도가 2000년 이상인 책들은 '최근책' 이라고 하고,
-- 그렇지 않은 책들은, '예전책' 이라고 하여,
-- type 이라는 컬럼을 추가하여 가져오시오. 
select * , if(released_year >= 2000, '최근책','예전책') as type
from books;

-- 재고 컬럼에 NULL(null) 이 있으면, 0으로 셋팅하세요. 

select * , ifnull(stock_quantity, 0) as new_data
from books;



insert into books
(title, author_fname, author_lname, released_year, pages)
values
('좋은책', 'Harry','Mike', 2022, 200);


-- 재고가 null 인 데이터만 가져오시오. 
select *
from books
where stock_quantity is null;

-- 재고가 null 이 아닌 데이터만 가져오시오.
select *
from books
where stock_quantity is not null;


select *
from books
where released_year < 1980;

select *
from books
where author_lname = 'Eggers' or author_lname = 'Chabon' ;

select *
from books
where author_lname in ('Eggers', 'Chabon' );

select *
from books
where author_lname = 'Lahiri' and released_year > 2000;


select *
from books
where pages between 100 and 200;

select *
from books
where author_lname like 'c%' or author_lname like 's%' ;


select title, author_lname , 
	case 
		when title like '%stories%' then 'Short Stories'
        when title = 'Just Kids' then 'Memoir'
        when title like '%heartbreaking%' then 'Memoir'
        else 'Novel'
    end as TYPE
from books;



select title, author_lname , if( count(*) = 1 ,  concat(count(*) , ' book' ) , concat(count(*), ' books' ) ) as COUNT
from books
group by author_fname, author_lname
order by author_lname asc;

select released_year as year, 
		count(*) as '# books' , 
        avg( pages) as 'avg pages'
from books
group by released_year
order by year ;


-- 시간 관련된 처리 방법
insert into people
(name, birthdate, birthtime, birthdt)
values
('김나나','1990-11-11','10:07:35','1990-11-11 10:07:35'),
('홍길동','1980-12-25','04:10:42','1980-12-25 04:10:42');

select *
from people;

-- 날짜 정보만 가져오기
select * , day(birthdate)
from people;

select * , dayname(birthdate)
from people;

select * , dayofweek(birthdate)
from people;

select * , dayofyear(birthdate)
from people;

select * , month(birthdate)
from people;

select * , hour(birthdt), minute(birthdt), second(birthdt)
from people;

-- db 에 저장된 시간형식을!
-- 사람이 다루기 쉬운 문자열로 바꾸는 방법 

-- '1990년 11월 11일, 10시 07분 입니다.'

select * , date_format(birthdt, '%Y년 %m월 %d일, %H시 %i분 입니다.' )
from people;

-- 현재시간을 가져오고 싶을때, now() 함수 이용
select now();

-- 현재 년월일만 가져오고 싶을때,  
select curdate();

-- 현재 시분초만 가져오고 싶을때, 
select curtime();

-- 시간의 차이를 구하는 함수.  datediff() 함수 
select * , datediff(now(), birthdt)
from people;

-- date_add() 함수
select * , date_add(birthdt, interval 100 day)
from people;

select * , date_add(birthdt, interval 100 hour)
from people;

select * , date_sub(birthdt, interval 100 day)
from people;

select * , date_sub(birthdt, interval 100 hour)
from people;

select *, birthdt + interval 100 day
from people;

select *, birthdt - interval 50 hour
from people;

select *, birthdt + interval 100 day - interval 13 hour + interval 2 month
from people;


-- 유저가 리뷰를 남긴다.
insert into comments
(content, createdAt)
values
('맛있었어요', now() );

select * 
from comments;


insert into comments
(content, createdAt)
values
('저는 별로 맛이 없습니다.', now() );

select *
from comments;


insert into comments
(content)
values
('줄서서라도 먹습니다.');

-- 수정 
update comments
set content = '별로네요', updatedAt = now()
where id = 1;

update comments
set content = '별로네요'
where id = 2;

select *
from comments;

insert into comments
(content)
values
('겨울엔 호떡이 최고');

update comments
set content = '호떡 맛있음'
where id = 5;


-- 테이블 여러개를 합쳐서 가져오는 방법!  => join 

select * 
from customers;

select *
from orders;

-- 두개 테이블을 하나로 합쳐서 가져오시오.
select *
from orders
join customers
on orders.customer_id = customers.id ;

-- 테이블 이름을 줄여서 사용하는 방법 
select *
from orders as o
join customers as c
on o.customer_id = c.id ;

select *
from orders o
join customers c
on o.customer_id = c.id ;

-- 컬럼 이름이 중복이 되면, 중복되지 않도록 변경해준다. 
select o.id as order_id, o.order_date, o.amount, o.customer_id, 
		c.id, c.first_name, c.last_name, c.email
from orders o
join customers c
on o.customer_id = c.id ;

-- 위의 조인은, 어느 데이터를 위주로 합친것인가??
-- 주문 데이터를 위주로 하여, 주문자가 누구인지 오른쪽에 붙인것이다.

-- 예를 들어서, 회원가입은 했는데, 주문을 한번도 안한 사람은,
-- 위의 데이터에서 확인가능한가?? 

-- 모든 회원 정보를 가져오되, 
-- 오른쪽에 주문 정보를 붙여서, 주문 안한 사람은 null 이 나오도록
-- 나타내고 싶다. => left join (right join) 이라고 한다.

select *
from customers c
left join orders o 
on c.id = o.customer_id ;

-- 주문 금액이 600달러보다 큰 사람의 데이터를 가져오시오.
-- 그사람의 이메일 주소와 이름을 확인할 수 있어야 합니다. 
select *
from orders o
join customers c
on o.customer_id = c.id
where o.amount > 600;

-- 위에서, 이 사람들의 이메일과 주문금액, 주문날짜를 가져오시오.
select c.email, o.amount, o.order_date
from orders o
join customers c
on o.customer_id = c.id
where o.amount > 600;

-- 위의 결과를, 주문날짜 내림차순으로 가져오세요.
select c.email, o.amount, o.order_date
from orders o
join customers c
on o.customer_id = c.id
where o.amount > 600
order by order_date desc;

-- 고객 아이디가 36인 사람의 주문 내역(모든 정보)를 가져오시오.
select *
from customers c
left join orders o
on c.id = o.customer_id
where c.id = 36;

-- first_name이 'Cobby' 인 사람의 주문내역을 가져오시오.
select *
from customers c
join orders o
on c.id = o.customer_id
where c.first_name = 'Cobby';


-- first_name에 ty 가 들어가는 사람의 주문내역을 가져오시오.
select *
from customers c
join orders o
on c.id = o.customer_id
where c.first_name like '%ty%' ;

-- 주문금액이 300이상이고 500이하인 주문내역을 가져오시오.
-- 단, 주문한 사람의 이메일 정보도 같이 나와야 합니다. 
select o.* , c.email
from orders o 
join customers c 
on o.customer_id = c.id
where o.amount between 300 and 500;

-- 각 고객별로, 주문 수를 나타내시오. 
-- (고객의 이름과 이메일이 함께 나와야 합니다.)
select c.first_name, c.last_name, c.email , count(o.customer_id) as order_cnt
from orders o 
join customers c
on o.customer_id = c.id
group by o.customer_id;

-- 모든 회원정보를 다 나타내고, 주문안한사람은 주문횟수가 0으로 나타나도록
-- 하고 싶을때 
select c.first_name, c.last_name, c.email , count(o.customer_id) as order_cnt
from orders o 
right join customers c
on o.customer_id = c.id
group by o.customer_id;

-- 각 고객별로, 주문 금액 평균이 300달러 이상인 
-- 데이터만 가져오시오. (사람의 이메일과 이름이 함께 나와야 함)
select c.first_name, c.last_name, c.email , 
		avg( o.amount ) as avg
from orders o 
join customers c
on o.customer_id = c.id
group by o.customer_id
having avg >= 300;

use yhdb;
select *
from customers;

select *
from orders;

-- 각 고객별로 주문 금액의 최대값을 구하고, 
-- 이 값이 600달러 이상인 데이터만 가져와서, 
-- 내림차순으로 정렬하세요. (이름과 이메일 주소도 함께 나와야합니다.)
select o.* , max(o.amount) as max_amount, c.first_name, c.last_name, c.email
from orders o
join customers c 
on o.customer_id = c.id
group by o.customer_id
having max_amount >= 600
order by max_amount desc;

-- order 테이블의, 주문날짜의 최소값과 최대값을 구하세요. 
select min(order_date) min_date , max(order_date) max_date
from orders;

-- 2019년 12월 20일부터 2020년 1월 10일 사이에 주문한 사람은
-- 몇명입니까?
select count( distinct customer_id ) as customer_count
from orders
where order_date >= '2019-12-20' and order_date <= '2020-01-10';

select count( distinct customer_id ) as customer_count
from orders
where order_date between '2019-12-20' and '2020-01-10';

-- 2019년 12월 20일 부터 2020년 1월 10일 사이의 주문 데이터에서
-- 고객별 주문금액 평균이 300달러 이상인 사람의 
-- 이름과 평균 금액을 가져오시오. 
select c.first_name, c.last_name , avg(o.amount) as avg_amount
from orders o
join customers c
on o.customer_id = c.id
where o.order_date between '2019-12-20' and '2020-01-10'
group by o.customer_id
having avg_amount >= 300
order by avg_amount desc;


--

select * 
from students;

select *
from papers;



select s.first_name, p.title, p.grade
from students s
join papers p 
on s.id = p.student_id
order by p.grade desc;


select s.first_name, p.title, p.grade
from students s
left join papers p
on s.id = p.student_id;


select s.first_name, ifnull( p.title ,'MISSING') title , 
		ifnull( p.grade , 0 ) grade
from students s
left join papers p
on s.id = p.student_id;



select s.first_name , ifnull( avg(grade) , 0) average
from students s
left join papers p
on s.id = p.student_id
group by s.id
order by average desc ;


select s.first_name , ifnull( avg(grade) , 0) average, 
		if( ifnull( avg(grade) , 0) >= 75, 'PASSING' , 'FAILING' ) passing_status
from students s
left join papers p
on s.id = p.student_id
group by s.id
order by average desc ;


select * from series;
select * from reviewers;
select * from reviews;

select title, rating
from series s
join reviews r 
on s.id = r.series_id;



select title, avg(rating) avg_rating
from series s
join reviews r 
on s.id = r.series_id
group by s.id
order by avg_rating asc;

select *
from reviewers rv
join reviews r 
on rv.id = r.reviewer_id
order by rv.last_name desc;


select title as unreviewed_series 
from series s
left join reviews r 
on s.id = r.series_id
where r.id is null;


select s.genre , avg(r.rating) as avg_rating
from series s
join reviews r
on s.id = r.series_id
group by s.genre;


select rv.first_name, rv.last_name, 
		count(r.id) COUNT , 
        ifnull( min(rating) , 0  ) MIN , 
		ifnull( max(rating) , 0 ) MAX ,  
        ifnull( avg(rating) , 0 ) AVG, 
        if( r.id is null , 'INACTIVE', 'ACTIVE' ) STATUS
from reviewers rv
left join reviews r 
on rv.id = r.reviewer_id
group by rv.id;




select s.title, r.rating, 
		concat( rv.first_name, ' ', rv.last_name )  reviewers 
from series s
join reviews r 
on s.id = r.series_id
join reviewers rv 
on r.reviewer_id = rv.id
order by s.title ;


-- DB실습문제4
-- 1. 가장 오래된 회원 5명을 찾으세요.

select *
from users
order by created_at asc;

-- 회원가입을 가장 많이 하는 요일은?
select * , dayname( created_at ) day ,
		count(*) as cnt
from users
group by day
order by cnt desc;

-- 회원가입은 했지만, 사진은 한번도 올리지 않은,
-- 유령회원들의 데이터를 가져오시오.
select u.*
from users u
left join photos p
on u.id = p.user_id
where p.id is null;

-- 가장 유명한 사진은 무엇인지 찾아서
-- 유저이름, image_url, 좋아요 수를 나타내시오.
select * , count(l.photo_id) as total
from likes l
join users u
on l.user_id = u.id
join photos p
on l.photo_id = p.id
group by photo_id
order by total desc
limit 1;



select *
from users;

-- ALTER TABLE `ig_clone`.`photos`
-- DROP FOREIGN KEY `photos_ibfk_1`;

-- ALTER TABLE `ig_clone`.`photos`
-- ADD CONSTRAINT `photos_ibfk_1`
-- FOREIGN KEY (`user_id`) REFERENCES `ig_clone`.`users`(`id`)
-- ON DELETE CASCADE
-- ON UPDATE CASCADE;

-- ALTER TABLE `ig_clone`.`comments`
-- DROP FOREIGN KEY `comments_ibfk_2`;

-- ALTER TABLE `ig_clone`.`comments`
-- ADD CONSTRAINT `comments_ibfk_2`
-- FOREIGN KEY (`user_id`) REFERENCES `ig_clone`.`users`(`id`)
-- ON DELETE CASCADE
-- ON UPDATE CASCADE;



select t.tag_name , count(pt.tag_id) as cnt
from photo_tags pt
join tags t
on pt.tag_id = t.id
group by tag_id
order by cnt desc
limit 1;

-- 특정 포스팅 : 포토스 테이블의 아이디 72번의
-- 작성자, 사진 url, 좋아요 수를 가져오시오.
select u.username, p.image_url , count(l.id) like_cnt
from photos p
join users u
on p.user_id = u.id
left join likes l
on p.id = l.photo_id
where p.id= 72;

-- 포트아이디 72번의 해시태그 이름들을 가져오세요.
select *
from photo_tags pt
join tags t
on pt.tag_id = t.id
where pt.photo_id = 72;

-- 포토아이디 72번의 댓글 리스트를 가져오시오.
-- 댓글작성자이름, 댓글내용, 댓글작성 날짜
-- 댓글은 최근순으로.
select *,c.comment_text, c.created_at
from comments c
join users u
on c.user_id = u.id
where c.photo_id = 72
order by c.created_at desc;

-- 유저 아이디 2인 사람이
-- 몇개의 포스팅을 올렸는지 가져오시오.
select count(*) as photo_cnt
from photos
where user_id = 2;

-- 유저 아이디 2인 사람의
-- 팔로워 수와, 팔로윙 수를 가져오시오.
select count(*) as follower_cnt
from follows
where followee_id = 2;

select *
from follows
where followee_id = 2;

-- 유저 아이디 2번이 팔로잉하는 사람들의
-- 포스팅 리스트 가져오기. 25개씩 가져오기.
-- 작성자 이름, 이미지 주소, 좋아요 수 

select u.username,p.image_url, count(l.id)as like_count
from follows f
join photos p
on f.followee_id = p.user_id
join  users u
on p.user_id = u.id
left join likes l
on p.id=l.photo_id
where follower_id = 2
group by p.id
order by p.created_at desc
limit 0,25;

























































































































































