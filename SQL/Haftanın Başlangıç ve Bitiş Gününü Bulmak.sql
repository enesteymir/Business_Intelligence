SELECT DATEADD(d, 0 - DATEPART(dw, GETDATE()), CONVERT(DATE, GETDATE())) AS HaftaBaslangicGunu,
       DATEADD(d, 6 - DATEPART(dw, GETDATE()), CONVERT(DATE, GETDATE())) AS HaftaBitisGunu;

