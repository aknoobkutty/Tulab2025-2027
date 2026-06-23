use dbmslab
create table places (
placeID int
primary key,placename
varchar(100), latitude
decimal(10,6),
longitude decimal(10,6)
);
insert into places(placeID,placename,latitude,longitude)values
(1,'chennai',13.0827,80.2707),
(2,'bangalore',12.9716,77.5946),
(3,'hyderabad',17.3850,78.4867),
(4,'pune',18.5204,73.8567),
(5,'mumbai',19.0760,72.8777);

select placename,latitude,longitude from places where latitude between 12 and 18 and longitude between 75 and 80;

select*from places