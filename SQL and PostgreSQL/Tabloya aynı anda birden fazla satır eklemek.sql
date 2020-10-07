
--Tablo oluþturulmasý
 
CREATE TABLE Sehirler
(
    Id INT IDENTITY(1, 1) PRIMARY KEY,
    SehirAd NVARCHAR(100)
);
 
--Tabloya veri eklenmesi
 
INSERT INTO Sehirler
(
    SehirAd
)
VALUES
(N'Konya'),
(N'Ýstanbul'),
(N'Artvin'),
(N'Bolu'),
(N'Bursa');
 
--Tablonun kontrol edilmesi
 
SELECT * FROM Sehirler s