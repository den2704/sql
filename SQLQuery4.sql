--1
SELECT dbo.Client.[Name] AS [Name],
	SUM(dbo.ClientOrder.AmountinRub) AS [Sum]
FROM dbo.Client
LEFT JOIN dbo.ClientOrder 
ON dbo.Client.Id = dbo.ClientOrder.ClientId
AND dbo.ClientOrder.[Datetime] >= DATEADD(month, -1, GETDATE()) --за последний мес€ц
WHERE dbo.ClientOrder.AmountinRub IS NOT NULL
GROUP BY dbo.Client.[Name]
ORDER BY [Sum] DESC

--2
SELECT dbo.Client.[Name] AS [Name],
	SUM(dbo.ClientOrder.AmountinRub) AS [Sum]
FROM dbo.Client
LEFT JOIN dbo.ClientOrder 
ON dbo.Client.Id = dbo.ClientOrder.ClientId
AND dbo.ClientOrder.[Datetime] >= DATEADD(month, -1, GETDATE()) --за последний мес€ц
WHERE dbo.ClientOrder.AmountinRub IS NOT NULL
GROUP BY dbo.Client.[Name], dbo.Client.Id
ORDER BY [Sum] DESC

--3
SELECT dbo.Client.[Name] AS [Name],
	SUM(dbo.ClientOrder.AmountinRub) AS [Sum]
FROM dbo.Client
LEFT JOIN dbo.ClientOrder 
ON dbo.Client.Id = dbo.ClientOrder.ClientId 
AND dbo.ClientOrder.[Datetime] >= DATEADD(month, -1, GETDATE()) --за последний мес€ц
GROUP BY dbo.Client.[Name], dbo.Client.Id
ORDER BY [Sum] DESC

--4
SELECT dbo.Client.[Name] AS [Name],
	SUM(dbo.ClientOrder.AmountinRub) AS [Sum]
FROM dbo.Client
LEFT JOIN dbo.ClientOrder 
ON dbo.Client.Id = dbo.ClientOrder.ClientId 
AND dbo.ClientOrder.[Datetime] >= DATEADD(month, -1, GETDATE()) --за последний мес€ц
GROUP BY dbo.Client.[Name], dbo.Client.Id
HAVING SUM(dbo.ClientOrder.AmountinRub) < 1000.50 OR SUM(dbo.ClientOrder.AmountinRub) IS NULL
ORDER BY [Sum] DESC