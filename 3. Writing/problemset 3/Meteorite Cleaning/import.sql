.import --csv meteorites.csv "meteorites_temp"

CREATE TABLE IF NOT EXISTS "meteorites" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" NUMERIC,
    "discovery" TEXT NOT NULL,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY ("id")
);

UPDATE "meteorites_temp"
SET
    "mass" = COALESCE(NULLIF("mass", ''), NULL),
    "year" = COALESCE(NULLIF("year",''),NULL),
    "lat" = COALESCE(NULLIF("lat",''),NULL),
    "long" = COALESCE(NULLIF("long",''),NULL);

UPDATE "meteorites_temp"
SET
    "mass" = ROUND("mass", 2),
    "lat"  = ROUND("lat", 2),
    "long" = ROUND("long", 2);

DELETE FROM "meteorites_temp"
WHERE "nametype" = 'Relict';

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "meteorites_temp"
ORDER BY "year", "name";

DROP TABLE "meteorites_temp";
