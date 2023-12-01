-- Part 1 (Nested Queries)

SELECT
    iris.*,
    joined1.Murder,
    joined1.Assault,
    joined1.UrbanPop,
    joined1.Theft,
    joined1.len,
    joined2.Name,
    joined2.mpg,
    joined2.drat,
    joined2.gear,
    joined2.weight,
    CASE
        WHEN joined2.NAME IS NOT NULL THEN joined2.NAME
        WHEN joined2.NAME IS NULL THEN CASE
            WHEN IRIS.STATE LIKE 'C%' THEN IRIS.SPECIES
            WHEN IRIS.STATE LIKE 'A%' THEN IRIS.STATE
            WHEN IRIS.STATE LIKE 'N%' THEN 2000
            ELSE 'Aint no party like a west coast party cause a west coast party don`t stop'
        END
    END AS LookHere,
    IRIS.`SEPAL.WIDTH` + IRIS.`PETAL.WIDTH` AS WidthSum
FROM
    IRIS
    LEFT JOIN (
        SELECT
            *
        FROM
            USArrests
            INNER JOIN TOOTHGROWTH ON USArrests.ID = ToothGrowth.ID
        WHERE
            TOOTHGROWTH.LEN < 25
    ) AS joined1 ON IRIS.ID = joined1.ID
    LEFT JOIN (
        SELECT
            *
        FROM
            MTCARS
            INNER JOIN PLANTGROWTH ON MTCARS.COLOR_ID = PLANTGROWTH.ID
        WHERE
            MTCARS.NAME not LIKE 'Merc%'
    ) AS joined2 ON IRIS.ID = joined2.ID
WHERE
    IRIS.`PETAL.LENGTH` > 1.5
ORDER BY
    Name DESC;



-- Part 2 (WITH Queries)

WITH
    joined1 AS (
        SELECT
            *
        FROM
            USARRESTS
            INNER JOIN TOOTHGROWTH ON USArrests.ID = ToothGrowth.ID
        WHERE
            TOOTHGROWTH.LEN < 25
    ),
    joined2 AS (
        SELECT
            *
        FROM
            MTCARS
            INNER JOIN PLANTGROWTH ON MTCARS.COLOR_ID = PLANTGROWTH.ID
        WHERE
            MTCARS.NAME not LIKE "Merc%"
    )
SELECT
    iris.*,
    joined1.Murder,
    joined1.Assault,
    joined1.UrbanPop,
    joined1.Theft,
    joined1.len,
    joined2.Name,
    joined2.mpg,
    joined2.drat,
    joined2.gear,
    joined2.weight,
    CASE
        WHEN joined2.NAME IS NOT NULL THEN joined2.NAME
        WHEN joined2.NAME IS NULL THEN CASE
            WHEN IRIS.STATE LIKE `C%` THEN IRIS.SPECIES
            WHEN IRIS.STATE LIKE `A%` THEN IRIS.STATE
            WHEN IRIS.STATE LIKE `N%` THEN 2000
            ELSE `Aint no party like a west coast party cause a
west coast party don’t stop`
        END
    END AS LookHere,
    IRIS.`SEPAL.WIDTH` + IRIS.`PETAL.WIDTH` AS WidthSum
FROM
    IRIS
    LEFT JOIN joined1 ON IRIS.ID = joined1.ID
    LEFT JOIN joined2 ON IRIS.ID = joined2.ID
WHERE
    IRIS.`PETAL.LENGTH` > 1.5
ORDER BY
    Name DESC;

