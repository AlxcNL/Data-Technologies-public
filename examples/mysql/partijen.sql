SELECT partij
FROM partijen_in_rotterdam
WHERE partij NOT IN (
    SELECT partij
    FROM landelijke_partijen
);


