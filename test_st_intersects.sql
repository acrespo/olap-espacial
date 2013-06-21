SET client_min_messages TO WARNING;
drop table test_table;
create table test_table (name varchar, geom geometry);
drop table test_results;
create table test_results (test_number int, result boolean);

insert into test_table values ('Polygon1', 'Polygon((0 0, 1 0, 1 1, 0 1, 0 0))');
insert into test_table values ('Polygon2', 'Polygon((0.5 0, 1.5 0, 1.5 1, 0.5 1, 0.5 0))');
/*shoud give  */

insert into test_results values (1, (select ST_Equals(ST_Intersects(geom), ST_GeomFromText('POLYGON((1 0,0.5 0,0.5 1,1 1,1 0))')) from test_table));

delete from test_table;

insert into test_table values ('Polygon1', 'Polygon((0 0, 1 0, 1 1, 0 1, 0 0))');
insert into test_table values ('Polygon2', 'Polygon((0.5 0, 1.5 0, 1.5 1, 0.5 1, 0.5 0))');
insert into test_table values ('Polygon3', 'Polygon((0.5 0.5, 1 0.5, 1 1.5, 0.5 1.5, 0.5 0.5))');

insert into test_results values (2, (select ST_Equals(ST_Intersects(geom), ST_GeomFromText('POLYGON((0.5 0.5,0.5 1,1 1,1 0.5,0.5 0.5))')) from test_table));

delete from test_table;

insert into test_table values ('Polygon1', 'Polygon((0 0, 1 0, 1 1, 0 1, 0 0))');
insert into test_table values ('Polygon2', 'Polygon((2 2, 3 2, 3 3, 2 3, 2 2))');

insert into test_results values (3, (select ST_IsEmpty(ST_Intersects(geom)) from test_table));

select * from test_results;
