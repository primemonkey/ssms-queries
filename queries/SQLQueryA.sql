WITH Grandchildren AS (
    SELECT
        p1.PersonID AS ParentID,
        p2.PersonID AS ChildID,
        p3.PersonID AS GrandchildID,
        p3.Gender AS GrandchildGender
    FROM Person p1
    JOIN Person p2 ON p1.PersonID = p2.MotherID OR p1.PersonID = p2.FatherID
    JOIN Person p3 ON p2.PersonID = p3.MotherID OR p2.PersonID = p3.FatherID
    WHERE p3.Gender = 'F'
)

, FemaleGrandchildCount AS (
    SELECT
        p1.PersonID,
        p1.FirstName,
        p1.LastName,
        COUNT(g.GrandchildID) AS FemaleGrandchildrenCount
    FROM Person p1
    JOIN Grandchildren g ON p1.PersonID = g.ParentID
    GROUP BY p1.PersonID, p1.FirstName, p1.LastName
)

SELECT TOP 1 FirstName, LastName
FROM FemaleGrandchildCount
ORDER BY FemaleGrandchildrenCount DESC;
