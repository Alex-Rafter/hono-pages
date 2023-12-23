CREATE TABLE employees (

	id integer primary key autoincrement,

	fullname text not null,

	position text,

	birthdate date,

	phone text,

	email text,

	comment	text

);
INSERT INTO employees VALUES(1,'Kolin McGregor','administrator','1976-12-11','555-56-65','kolin.mcgregor@bestbuy.com','Founder');
INSERT INTO employees VALUES(2,'Suzzi Rebba','manager','1987-04-25','555-11-02','suzzi.rebba@bestbuy.com',NULL);
INSERT INTO employees VALUES(3,'Mel Braun','manager','1955-07-01','555-09-25','mel.braun@bestbuy.com','CoFounder');
INSERT INTO employees VALUES(4,'Tommy Lee','helper','1992-07-01','555-03-01',NULL,NULL);
INSERT INTO employees VALUES(5,'Amma Honk','accountant','1974-02-22','555-55-05','amma.honk@bestbuy.com',NULL);
CREATE TABLE customers (

	id integer primary key autoincrement,

	fullname text not null,

	address text,

	phone text,

	email text

);
INSERT INTO customers VALUES(1,'Bran Oldy','567 College Lane Warren, MI 48089','555-12-13','oldy@supreme.org');
INSERT INTO customers VALUES(2,'Tomas Krave','488 West Cobblestone St. Waxhaw, NC 28173','555-01-34','tomas@mydoggy.com');
INSERT INTO customers VALUES(3,'Kate Broom','87 Old Glen Ridge St. Feasterville Trevose, PA 19053','555-99-03','kitty87@mail.com');
INSERT INTO customers VALUES(4,'Harry Port','83 Valley Lane Clayton, NC 27520','555-11-11','h.port@gmail.com');
INSERT INTO customers VALUES(5,'Sam Jackson','446 Clinton Rd. Bayonne, NJ 07002','555-00-87','samjack@topdone.org');
INSERT INTO customers VALUES(6,'Alex Brown','4 Rockaway St. Wellington, FL 33414','555-87-55','brown@bookshop.en');
INSERT INTO customers VALUES(7,'Elle Noika','670 Santa Clara Road Sheboygan, WI 53081','555-99-44','elle@camp56.org');
INSERT INTO customers VALUES(8,'Mitchel Holt','26 Lower River Dr. Romeoville, IL 60446','555-76-76','mitchel@camp56.org');
INSERT INTO customers VALUES(9,'Drew Watson','44 Old Buckingham Lane Drexel Hill, PA 19026','555-43-43','watson@bing.to');
CREATE TABLE orders (

	id integer primary key autoincrement,

	customer_id integer,

	employee_id integer,

	sale_date date,

	comment text,

	foreign key(customer_id) references customers(id),

	foreign key(employee_id) references employees(id)

);
INSERT INTO orders VALUES(1,1,2,'2020-09-11',NULL);
INSERT INTO orders VALUES(2,2,2,'2020-09-11',NULL);
INSERT INTO orders VALUES(3,3,3,'2020-09-12',NULL);
INSERT INTO orders VALUES(4,4,3,'2020-09-12',NULL);
INSERT INTO orders VALUES(5,8,4,'2020-09-13',NULL);
INSERT INTO orders VALUES(6,1,2,'2020-09-13',NULL);
INSERT INTO orders VALUES(7,8,4,'2020-09-13',NULL);
INSERT INTO orders VALUES(8,7,2,'2020-09-20',NULL);
INSERT INTO orders VALUES(9,6,2,'2020-09-21',NULL);
INSERT INTO orders VALUES(10,6,2,'2020-09-21','Awaiting payment');
INSERT INTO orders VALUES(11,5,1,'2020-09-22',NULL);
INSERT INTO orders VALUES(12,1,2,'2020-09-22',NULL);
INSERT INTO orders VALUES(13,3,3,'2020-09-23',NULL);
INSERT INTO orders VALUES(14,8,3,'2020-09-23',NULL);
INSERT INTO orders VALUES(15,1,3,'2020-09-24',NULL);
INSERT INTO orders VALUES(16,8,2,'2020-09-27',NULL);
INSERT INTO orders VALUES(17,7,2,'2020-09-27',NULL);
INSERT INTO orders VALUES(18,6,1,'2020-09-28',NULL);
INSERT INTO orders VALUES(19,6,2,'2020-10-01','Delivery problem');
CREATE TABLE order_books (

	id integer primary key autoincrement,

	order_id integer,

	book_id integer,

	quantity integer,

	discount real,

	foreign key(order_id) references orders(id),

	foreign key(book_id) references books(id)

);
INSERT INTO order_books VALUES(1,1,10,2,0.0);
INSERT INTO order_books VALUES(2,1,11,1,0.0);
INSERT INTO order_books VALUES(3,2,33,1,0.0);
INSERT INTO order_books VALUES(4,3,2,1,0.0);
INSERT INTO order_books VALUES(5,3,3,1,0.0);
INSERT INTO order_books VALUES(6,4,3,2,0.0);
INSERT INTO order_books VALUES(7,4,10,3,2.0);
INSERT INTO order_books VALUES(8,4,5,1,0.0);
INSERT INTO order_books VALUES(9,5,10,1,0.0);
INSERT INTO order_books VALUES(10,6,17,1,0.0);
INSERT INTO order_books VALUES(11,6,16,1,0.0);
INSERT INTO order_books VALUES(12,7,1,1,0.0);
INSERT INTO order_books VALUES(13,8,2,2,0.0);
INSERT INTO order_books VALUES(14,9,10,3,2.0);
INSERT INTO order_books VALUES(15,10,27,2,0.0);
INSERT INTO order_books VALUES(16,11,32,1,0.0);
INSERT INTO order_books VALUES(17,11,10,1,0.0);
INSERT INTO order_books VALUES(18,11,17,1,0.0);
INSERT INTO order_books VALUES(19,12,11,2,0.0);
INSERT INTO order_books VALUES(20,12,1,1,0.0);
INSERT INTO order_books VALUES(21,13,1,2,0.0);
INSERT INTO order_books VALUES(22,14,1,1,0.0);
INSERT INTO order_books VALUES(23,15,1,1,0.0);
INSERT INTO order_books VALUES(24,16,1,1,0.0);
INSERT INTO order_books VALUES(25,16,19,4,4.0);
INSERT INTO order_books VALUES(26,17,12,2,0.0);
INSERT INTO order_books VALUES(27,17,10,1,0.0);
INSERT INTO order_books VALUES(28,18,11,1,0.0);
INSERT INTO order_books VALUES(29,19,7,1,0.0);
CREATE TABLE reviews (

	id integer primary key autoincrement,

	customer_id int not null,

	book_id int not null,

	rating int,

	review text,

	check(rating is not null and rating >= 1 and rating <= 5 or rating is null and review is not null),

	unique(customer_id, book_id),

	foreign key(customer_id) references customers(id),

	foreign key(book_id) references books(id)

);
INSERT INTO reviews VALUES(1,6,7,5,NULL);
INSERT INTO reviews VALUES(2,2,5,5,NULL);
INSERT INTO reviews VALUES(3,3,11,5,'Best book ever, OMG.');
INSERT INTO reviews VALUES(4,2,33,2,NULL);
INSERT INTO reviews VALUES(5,1,11,5,'Love it');
INSERT INTO reviews VALUES(6,7,7,3,'Not very interesting.');
INSERT INTO reviews VALUES(7,8,10,5,NULL);
INSERT INTO reviews VALUES(8,8,11,5,'fascinating');
INSERT INTO reviews VALUES(9,9,10,4,'Interesting subject');
INSERT INTO reviews VALUES(10,1,5,1,NULL);
INSERT INTO reviews VALUES(11,3,19,5,'so good');
INSERT INTO reviews VALUES(12,3,15,5,NULL);
INSERT INTO reviews VALUES(13,2,17,2,'bored');
INSERT INTO reviews VALUES(14,5,11,3,'too confusing');
INSERT INTO reviews VALUES(15,5,5,5,NULL);
INSERT INTO reviews VALUES(16,7,8,4,NULL);
INSERT INTO reviews VALUES(17,8,23,5,'very good');
INSERT INTO reviews VALUES(18,8,7,5,NULL);
INSERT INTO reviews VALUES(19,8,4,1,'I do not like it at all');
INSERT INTO reviews VALUES(20,9,11,5,NULL);
INSERT INTO reviews VALUES(21,7,18,3,'not very interesting');
INSERT INTO reviews VALUES(22,7,32,5,NULL);
INSERT INTO reviews VALUES(23,6,6,5,'the best book ever');
INSERT INTO reviews VALUES(24,5,4,5,'nice book');
INSERT INTO reviews VALUES(25,2,25,5,NULL);
INSERT INTO reviews VALUES(26,2,8,1,'worst book ever');
INSERT INTO reviews VALUES(27,3,7,5,'amazing book');
INSERT INTO reviews VALUES(28,3,4,5,'it is the best book I have ever read');
INSERT INTO reviews VALUES(29,4,33,5,NULL);
INSERT INTO reviews VALUES(30,5,18,2,'so boring');
INSERT INTO reviews VALUES(31,4,24,2,NULL);
INSERT INTO reviews VALUES(32,4,12,2,NULL);
INSERT INTO reviews VALUES(33,9,2,3,'too long to read');
INSERT INTO reviews VALUES(34,9,1,4,NULL);
INSERT INTO reviews VALUES(35,8,1,5,'interesting story');
CREATE TABLE order_log (

	sale_date real,

	manager text,

	customer text

);
INSERT INTO order_log VALUES('2020-09-11','Suzzi Rebba','Bran Oldy');
INSERT INTO order_log VALUES('2020-09-11','Suzzi Rebba','Tomas Krave');
INSERT INTO order_log VALUES('2020-09-12','Mel Braun','Kate Broom');
INSERT INTO order_log VALUES('2020-09-12','Mel Braun','Harry Port');
INSERT INTO order_log VALUES('2020-09-13','Tommy Lee','Mitchel Holt');
INSERT INTO order_log VALUES('2020-09-13','Suzzi Rebba','Bran Oldy');
INSERT INTO order_log VALUES('2020-09-13','Tommy Lee','Mitchel Holt');
INSERT INTO order_log VALUES('2020-09-20','Suzzi Rebba','Elle Noika');
INSERT INTO order_log VALUES('2020-09-21','Suzzi Rebba','Alex Brown');
INSERT INTO order_log VALUES('2020-09-21','Suzzi Rebba','Alex Brown');
INSERT INTO order_log VALUES('2020-09-22','Kolin McGregor','Sam Jackson');
INSERT INTO order_log VALUES('2020-09-22','Suzzi Rebba','Bran Oldy');
INSERT INTO order_log VALUES('2020-09-23','Mel Braun','Kate Broom');
INSERT INTO order_log VALUES('2020-09-23','Mel Braun','Mitchel Holt');
INSERT INTO order_log VALUES('2020-09-24','Mel Braun','Bran Oldy');
INSERT INTO order_log VALUES('2020-09-27','Suzzi Rebba','Mitchel Holt');
INSERT INTO order_log VALUES('2020-09-27','Suzzi Rebba','Elle Noika');
INSERT INTO order_log VALUES('2020-09-28','Kolin McGregor','Alex Brown');
INSERT INTO order_log VALUES('2020-10-01','Suzzi Rebba','Alex Brown');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('books',33);
INSERT INTO sqlite_sequence VALUES('employees',5);
INSERT INTO sqlite_sequence VALUES('customers',9);
INSERT INTO sqlite_sequence VALUES('orders',19);
INSERT INTO sqlite_sequence VALUES('order_books',29);
INSERT INTO sqlite_sequence VALUES('reviews',35);