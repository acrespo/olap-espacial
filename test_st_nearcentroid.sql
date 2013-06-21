SET client_min_messages TO WARNING;
drop table test_table;
create table test_table (name varchar, geom geometry);
drop table test_results;
create table test_results (test_number int, result boolean);

insert into test_table values ('Polygon1', 'Polygon((0 0, 4 0, 4 1, 0 1, 0 0))');
insert into test_table values ('Polygon2', 'Polygon((0 0, 1 0, 1 5, 0 5 ,0 0))');
insert into test_table values ('Polygon3', 'Polygon((0 4, 4 4, 4 5, 0 5, 0 4))');

insert into test_results values(1, (select ST_Equals(ST_GeomFromText('POINT(1 2.5)'), ST_AsText(ST_NearCentroid(geom))) from test_table));

delete from test_table;

insert into test_table values ('Polygon1', 'Polygon((-1 -1, -1 1, 1 1, 1 -1, -1 -1))');
insert into test_table values ('Polygon2', 'Polygon((2 1, 2 -1, 3.5 -1, 3.5 1, 2 1))');

insert into test_results values(2, (select ST_Equals(ST_GeomFromText('POINT(1 0)'), ST_AsText(ST_NearCentroid(geom))) from test_table));

delete from test_table;

insert into test_table values ('Polygon1', 'Polygon((-1 -1, -1 1, 1 1, 1 -1, -1 -1))');
insert into test_table values ('Polygon2', 'Polygon((2 1, 2 -1, 4.5 -1, 4.5 1, 2 1))');

insert into test_results values(3, (select ST_Equals(ST_GeomFromText('POINT(2 0)'), ST_AsText(ST_NearCentroid(geom))) from test_table));

select * from test_results;
select CONCAT('Run ', (select count(*) from test_results), ' tests, ', (select count(*) from test_results where result), ' where succesful.') as "Results ST_NearCentroid";
