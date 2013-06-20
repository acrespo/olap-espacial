drop aggregate ST_Intersects(geometry);

create aggregate ST_Intersects(geometry) (
    sfunc = ST_Intersection,
    stype = geometry 
);