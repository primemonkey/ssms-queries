WITH FamilyEarnings AS (
    SELECT
        p1.PersonID AS ParentID,
        p2.PersonID AS ChildID,
        p3.PersonID AS GrandchildID,
        (ISNULL(p1.Earnings, 0) + ISNULL(p2.Earnings, 0) + ISNULL(p3.Earnings, 0)) AS TotalFamilyEarnings
    FROM Person p1
    LEFT JOIN Person p2 ON p1.PersonID = p2.MotherID OR p1.PersonID = p2.FatherID
    LEFT JOIN Person p3 ON p2.PersonID = p3.MotherID OR p2.PersonID = p3.FatherID
    GROUP BY p1.PersonID, p2.PersonID, p3.PersonID, p1.Earnings, p2.Earnings, p3.Earnings
),
LeastEarningFamily AS (
    SELECT TOP 1 TotalFamilyEarnings
    FROM FamilyEarnings
    ORDER BY TotalFamilyEarnings ASC
)
SELECT TOP 1 p.FirstName, p.LastName
FROM Person p
JOIN FamilyEarnings fe ON p.PersonID = fe.ParentID OR p.PersonID = fe.ChildID OR p.PersonID = fe.GrandchildID
WHERE fe.TotalFamilyEarnings = (SELECT TotalFamilyEarnings FROM LeastEarningFamily)
ORDER BY p.PersonID;
