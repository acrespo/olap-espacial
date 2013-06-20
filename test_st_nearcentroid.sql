delete from test_table;

insert into test_table values ('Polygon1', 'Polygon((0 0, 4 0, 4 1, 0 1, 0 0))');
insert into test_table values ('Polygon2', 'Polygon((0 0, 1 0, 1 5, 0 5 ,0 0))');
insert into test_table values ('Polygon3', 'Polygon((0 4, 4 4, 4 5, 0 5, 0 4))');


select ST_AsText(ST_NearCentroid(geom)) from test_table;
/*should give  POINT(1 2.5)*/