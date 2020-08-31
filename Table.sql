Create Database Food;

use Food;

create table Vegetable
(
  VegetNu int not null,
  VegetName char(10),
  vegetPrice int,
  primary key(VegetNu)
);
 Insert Into Vegetable Values(2321123,'배추',2500)
 Insert Into Vegetable Values(2321124,'상추',2000)
 Insert Into Vegetable Values(2321125,'양배추',3500)
 Insert Into Vegetable Values(2321126,'양상추',3000)

 Select *
 From Vegetable
