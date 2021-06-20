DROP TABLE IF EXISTS Sehirler


--Tablo oluşturulması
 
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
('Konya'),
('İstanbul'),
('Artvin'),
('Bolu'),
('Bursa');
 
--Tablonun kontrol edilmesi
 
SELECT * FROM Sehirler s

