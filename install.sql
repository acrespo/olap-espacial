create extension postgis;

drop aggregate if exists ST_Intersects(geometry);

create aggregate ST_Intersects(geometry) (
    sfunc = ST_Intersection,
    stype = geometry 
);

drop aggregate if exists ST_NearCentroid(geometry);
drop function if exists ST_NearCentroid_final(geom geometry);

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

