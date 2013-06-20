delete from test_table;

insert into test_table values ('Polygon1', 'Polygon((0 0, 1 0, 1 1, 0 1, 0 0))');
insert into test_table values ('Polygon2', 'Polygon((0.5 0, 1.5 0, 1.5 1, 0.5 1, 0.5 0))');
/*shoud give  POLYGON((1 0,0.5 0,0.5 1,1 1,1 0))*/

select ST_AsText(ST_Intersects(geom)) from test_table;

delete from test_table;

insert into test_table values ('Polygon1', 'Polygon((0 0, 1 0, 1 1, 0 1, 0 0))');
insert into test_table values ('Polygon2', 'Polygon((0.5 0, 1.5 0, 1.5 1, 0.5 1, 0.5 0))');
insert into test_table values ('Polygon3', 'Polygon((0.5 0.5, 1 0.5, 1 1.5, 0.5 1.5, 0.5 0.5))');

select ST_AsText(ST_Intersects(geom)) from test_table;
/*shoud give POLYGON((0.5 0.5,0.5 1,1 1,1 0.5,0.5 0.5))*/

delete from test_table;

insert into test_table values ('Polygon1', 'Polygon((0 0, 1 0, 1 1, 0 1, 0 0))');
insert into test_table values ('Polygon2', 'Polygon((2 2, 3 2, 3 3, 2 3, 2 2))');

select ST_AsText(ST_Intersects(geom)) from test_table;
/*should give GEOMETRYCOLLECTION EMPTY*/