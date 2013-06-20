create table test_table (name varchar, geom geometry);

drop aggregate ST_Intersects(geometry);

create aggregate ST_Intersects(geometry) (
    sfunc = ST_Intersection,
    stype = geometry 
);

drop aggregate ST_NearCentroid1(geometry);

create aggregate ST_NearCentroid1(geometry) (
    sfunc = ST_Union,
    stype = geometry,
    finalfunc = ST_PointOnSurface
);

drop aggregate ST_MyCentroid(geometry);

create aggregate ST_MyCentroid(geometry) (
    sfunc = ST_Union,
    stype = geometry,
    finalfunc = ST_Centroid
);

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


delete from test_table;

insert into test_table values ('Polygon1', 'Polygon((0 0, 4 0, 4 1, 0 1, 0 0))');
insert into test_table values ('Polygon2', 'Polygon((0 0, 1 0, 1 5, 0 5 ,0 0))');
insert into test_table values ('Polygon3', 'Polygon((0 4, 4 4, 4 5, 0 5, 0 4))');

select ST_AsText(geom) from test_table;

select ST_AsText(ST_NearCentroid1(geom)) from test_table;
select ST_AsText(ST_ClosestPoint(ST_union(geom), ST_MyCentroid(geom))) from test_table;
/*should give  POINT(1 2.5)*/

drop aggregate ST_NearCentroid(geometry);
drop function ST_NearCentroid_final(geom geometry);

create or replace function ST_NearCentroid_final(geom geometry)
returns geometry as 
$$
begin
    return ST_ClosestPoint(geom, ST_Centroid(geom));
end
$$ language plpgsql;

create aggregate ST_NearCentroid(geometry) (
    sfunc = ST_Union,
    stype = geometry,
    finalfunc = ST_NearCentroid_final
);

select ST_AsText(ST_NearCentroid(geom)) from test_table;
/*should give  POINT(1 2.5)*/

