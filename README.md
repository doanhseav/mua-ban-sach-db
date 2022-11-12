# Thiết kế database cho bài toán mua bán sách

## Thiết kế database

- Đầu tiên em tạo bảng `book_info` để lưu trữ các thông tin của cuốn sách bao gồm:
  + `id`: mã của cuốn sách
  + `name`: tên cuốn sách
  + `genre`: thể loại
  + `qty`: số lượng sách trong kho
  + `publisher`: nhà xuất bản
  + `pub_year`: năm xuất bản
  + `author_id`: mã tác giả
- Tiếp theo em tạo bảng `transaction` để lưu thông tin giao dịch gồm các cột:
  + `id`: mã giao dịch
  + `act`: loại giao dịch (mua/bán)
  + `customer_id`: mã khách hàng
  + `_date`: thời gian diễn ra giao dịch
- Thông tin chi tiết giao dịch được lưu vào bảng `orders`:
  + `id`: dùng để phân biệt các đơn hàng trong cùng 1 giao dịch cũng như với các giao dịch khác
  + `transaction_id`: mã giao dịch
  + `book_id`: mã sách
  + `qty`: số lượng
  + `price`: giá của 1 cuốn sách trong giao dịch
  + `amount`: số tiền của đơn hàng
 - Ngoài ra em còn thiết kế các bảng `customer_info` và `author` để lưu thông tin của khách hàng và các tác giả.
 
 Kết quả sau khi tạo bảng:
 [![mua-ban-sach.png](https://i.postimg.cc/pXspV7nm/mua-ban-sach.png)](https://postimg.cc/3dDKnt1h)
 
 ## Các câu truy vấn MySQL
 
**Liệt kê danh sách mặt hàng sách:**
```objectivec
SELECT name, genre, qty FROM book_info;
```
Kết quả:

 <p align="center">
  <img src="https://i.postimg.cc/Y9c1f9kG/image.png"/>
</p>

**Liệt kê các giao dịch trong một ngày nhất định:**
```objectivec
select * from transaction where _date = '2022-11-10';
```
Kết quả:
<p align="center">
  <img src="https://i.postimg.cc/qqJQyRXc/image.png"/>
</p>

**Liệt kê các khách hàng mua sách trong khoảng thời gian:**
```objectivec
select customer_info.name, transaction._date 
from transaction 
inner join customer_info on transaction.customer_id = customer_info.id
where _date >= '2022-11-08' and _date <= '2022-11-11' and act = 'mua';
```
Kết quả:
<p align="center">
  <img src="https://i.postimg.cc/Mps1n5vG/image.png"/>
</p>

**Đưa ra tổng số tiền bán sách trong một ngày:**
```objectivec
select SUM(orders.amount) 
from orders 
inner join transaction on orders.transaction_id = transaction.id  and transaction._date = '2022-11-10' and transaction.act = 'mua';
```
Kết quả:
<p align="center">
  <img src="https://i.postimg.cc/63jv3LzX/image.png"/>
</p>

**Lịch sử giao dịch của một người dùng:**
```objectivec
SELECT customer_info.name, transaction.act, book_info.name, orders.qty, orders.amount, transaction._date
FROM (((transaction
INNER JOIN orders ON transaction.id = orders.transaction_id)
INNER JOIN customer_info ON transaction.customer_id = customer_info.id)
INNER JOIN book_info ON orders.book_id = book_info.id)
WHERE transaction.customer_id = 'KH1'
ORDER BY _date
```
Kết quả:
<p align="center">
  <img src="https://i.postimg.cc/Ss7gt5yG/image.png"/>
</p>
