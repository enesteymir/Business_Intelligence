declare @thisyear as char(4)
set @thisyear = (select SUR_YEAR_ID from [DWH_BTS]..[PLY__DIM_DATE] (nolock) where SUR_DATE_ID = convert(char(8),getdate()-1,112))

declare @lastyear as char(4)
set @lastyear = (select SUR_YEAR_ID from [DWH_BTS]..[PLY__DIM_DATE] (nolock) where SUR_DATE_ID = convert(char(8),getdate()-366,112))

declare @ThisMonth as char(4)
set @ThisMonth = (select SUR_MONTH_ID from [DWH_BTS]..[PLY__DIM_DATE] (nolock) where SUR_DATE_ID = convert(char(8),getdate()-1,112))

declare @LastMonthYear as char(4)
set @LastMonthYear = (select SUR_YEAR_ID from [DWH_BTS]..[PLY__DIM_DATE] (nolock) where SUR_DATE_ID = convert(char(8),getdate()-30,112))

declare @LastWeek as char(8)
set @LastWeek = (select SUR_WEEKISO_ID from [DWH_BTS]..[PLY__DIM_DATE] (nolock) where SUR_DATE_ID = convert(char(8),getdate()-7,112))

declare @ThisWeek as char(8)
set @ThisWeek = (select SUR_WEEKISO_ID from [DWH_BTS]..[PLY__DIM_DATE] (nolock) where SUR_DATE_ID = convert(char(8),getdate()-1,112))

declare @LastDay as char(8)
set @LastDay = (select DIM_DATEFORMATTED from [DWH_BTS]..[PLY__DIM_DATE] (nolock) where SUR_DATE_ID = convert(char(8),getdate()-1,112) )

declare @Today as char(8)
set @Today = (select DIM_DATEFORMATTED from [DWH_BTS]..[PLY__DIM_DATE] (nolock) where SUR_DATE_ID = convert(char(8),getdate(),112) )

declare @LastDayYTD as char(8)
set @LastDayYTD = (select DIM_DATEFORMATTED from [DWH_BTS]..[PLY__DIM_DATE] (nolock) where SUR_DATE_ID = convert(char(8),getdate()-366,112) )

declare @DunHaftan�nGunu as char(3)
set @DunHaftan�nGunu =(select DIM_DAYOFWEEK from [DWH_BTS]..[PLY__DIM_DATE] (nolock) where SUR_DATE_ID = convert(char(8),getdate()-1,112) )

select 
a.DIM_DATEFORMATTED AS Y�lAyG�n,
a.SUR_PERIOD_ID as Y�lAy,
a.SUR_WEEKAPODP_ID as Y�lHafta,
a.SUR_YEAR_ID as Y�l,
a.DIM_DAYOFWEEK as Haftan�nG�n�No,
a.DIM_DAYOFMONTH as Ay�nG�n�No,
a.DIM_DAYOFYEAR as Y�l�nG�n�No,
a.SUR_WEEKISO_ID as HaftaNo,
a.SUR_MONTH_ID as AyNo,
a.SUR_QUARTER_ID as �eyrekNo,
a.DIM_ISWEEKEND as HaftaSonuMu,
EOMONTH(DIM_ACTUALDATE) as Ay�nSonG�n�,
DATEPART(day,EOMONTH(DIM_ACTUALDATE)) as AyKa�G�n,

case when DIM_DAYOFWEEK=1 then 'Pazartesi'
     when DIM_DAYOFWEEK=2 then 'Sal�'
	 when DIM_DAYOFWEEK=3 then '�ar�amba'
	 when DIM_DAYOFWEEK=4 then 'Per�embe'
	 when DIM_DAYOFWEEK=5 then 'Cuma'
	 when DIM_DAYOFWEEK=6 then 'Cumartesi'
	 when DIM_DAYOFWEEK=7 then 'Pazar' end as [G�nAd�_TR],

case when DIM_DAYOFWEEK=1 then 'Monday'
     when DIM_DAYOFWEEK=2 then 'Tuesday'
	 when DIM_DAYOFWEEK=3 then 'Wednesday'
	 when DIM_DAYOFWEEK=4 then 'Thursday'
	 when DIM_DAYOFWEEK=5 then 'Friday'
	 when DIM_DAYOFWEEK=6 then 'Saturday'
	 when DIM_DAYOFWEEK=7 then 'Sunday' end as [G�nAd�_Ing],

case when SUR_MONTH_ID=1 then 'Ocak' 
     when SUR_MONTH_ID=2 then '�ubat' 
	 when SUR_MONTH_ID=3 then 'Mart' 
	 when SUR_MONTH_ID=4 then 'Nisan' 
	 when SUR_MONTH_ID=5 then 'May�s' 
	 when SUR_MONTH_ID=6 then 'Haziran' 
	 when SUR_MONTH_ID=7 then 'Temmuz' 
	 when SUR_MONTH_ID=8 then 'A�ustos' 
	 when SUR_MONTH_ID=9 then 'Eyl�l' 
	 when SUR_MONTH_ID=10 then 'Ekim' 
	 when SUR_MONTH_ID=11 then 'Kas�m' 
	 when SUR_MONTH_ID=12 then 'Aral�k' end as [AyAd�_TR],

case when SUR_MONTH_ID=1 then 'January' 
     when SUR_MONTH_ID=2 then 'February' 
	 when SUR_MONTH_ID=3 then 'March' 
	 when SUR_MONTH_ID=4 then 'April' 
	 when SUR_MONTH_ID=5 then 'May' 
	 when SUR_MONTH_ID=6 then 'June' 
	 when SUR_MONTH_ID=7 then 'July' 
	 when SUR_MONTH_ID=8 then 'August' 
	 when SUR_MONTH_ID=9 then 'September' 
	 when SUR_MONTH_ID=10 then 'October' 
	 when SUR_MONTH_ID=11 then 'November' 
	 when SUR_MONTH_ID=12 then 'December' end as [AyAd�_Ing],


case when SUR_YEAR_ID =@thisyear then 'EVET' ELSE 'HAYIR' END AS BuY�l,
case when SUR_YEAR_ID =@lastyear then 'EVET' ELSE 'HAYIR' END AS GecenY�l,
case when SUR_YEAR_ID=@thisyear and SUR_MONTH_ID=@ThisMonth then 'EVET' ELSE 'HAYIR' END AS BuAy,
case when (SUR_YEAR_ID=@thisyear or SUR_YEAR_ID=@lastyear) and SUR_MONTH_ID=@ThisMonth AND DIM_MTDFLAG=1 then 'EVET' ELSE 'HAYIR' END AS BuAyYTD,
case when SUR_YEAR_ID=@LastMonthYear and SUR_MONTH_ID= (CASE WHEN @ThisMonth=1 THEN 12 ELSE @ThisMonth-1 END) then 'EVET' ELSE 'HAYIR' END AS GecenAy,
case when (SUR_YEAR_ID=@thisyear or SUR_YEAR_ID=@thisyear-1) and SUR_MONTH_ID=@ThisMonth AND DIM_MTDFLAG=1  THEN 'EVET' ELSE 'HAYIR' END AS MTD,
case when (SUR_YEAR_ID=@thisyear or SUR_YEAR_ID=@thisyear-1) AND DIM_YTDFLAG=1  THEN 'EVET' ELSE 'HAYIR' END AS YTD,
case when SUR_WEEKISO_ID = @LastWeek then 'EVET' else 'HAYIR' end as GecenHafta,
case when SUR_WEEKISO_ID = @ThisWeek then 'EVET' else 'HAYIR' end as BuHafta,
case when DIM_DATEFORMATTED=@LastDay then 'EVET' else 'HAYIR' end as D�n,
case when DIM_DATEFORMATTED=@LastDay or DIM_DATEFORMATTED=@LastDayYTD then 'EVET' else 'HAYIR' end as D�nYTD,
case when DIM_DATEFORMATTED=@Today then 'EVET' else 'HAYIR' end as Bug�n,
case when DIM_DATEFORMATTED in (select DIM_DATEFORMATTED from [DWH_BTS]..[PLY__DIM_DATE] (nolock)
          where DIM_DATEFORMATTED between convert(char(8),getdate()-7,112) and convert(char(8),getdate()-1,112))
          then 'EVET' else 'HAYIR' end as Son7G�n,
case when DIM_DATEFORMATTED in (select DIM_DATEFORMATTED from [DWH_BTS]..[PLY__DIM_DATE] (nolock) 
          where DIM_DATEFORMATTED between convert(char(8),getdate()-30,112) and convert(char(8),getdate()-1,112))
          then 'EVET' else 'HAYIR' end as Son30G�n,

case when DIM_DATEFORMATTED in (select DIM_DATEFORMATTED from [DWH_BTS]..[PLY__DIM_DATE] (nolock)
          where DIM_DAYOFWEEK = @DunHaftan�nGunu and SUR_YEAR_ID=@thisyear
		  and SUR_WEEKISO_ID in (select distinct top 6 SUR_WEEKISO_ID from [DWH_BTS]..[PLY__DIM_DATE] (nolock) 
                                 where DIM_DATEFORMATTED < convert(char(8),getdate(),112) and SUR_YEAR_ID=@thisyear
                                 order by SUR_WEEKISO_ID desc))
		  then 'EVET' else 'HAYIR' end as Son6HaftaD�n,

case when DIM_DATEFORMATTED in (select DIM_DATEFORMATTED from [DWH_BTS]..[PLY__DIM_DATE] (nolock)
          where DIM_DAYOFWEEK = @DunHaftan�nGunu 
		  and SUR_WEEKISO_ID in (select distinct top 6 SUR_WEEKISO_ID from [DWH_BTS]..[PLY__DIM_DATE] (nolock) 
                                 where DIM_DATEFORMATTED < convert(char(8),getdate(),112) and SUR_YEAR_ID=@thisyear
                                 order by SUR_WEEKISO_ID desc))
		  then 'EVET' else 'HAYIR' end as Son6HaftaD�nYTD

		 
--into #kontrol
from [DWH_BTS]..[PLY__DIM_DATE] (nolock) a
where DIM_DATEFORMATTED>=20180101 and
DIM_DATEFORMATTED <= convert(char(8),getdate(),112)
order by 1 desc

--select * FROM #kontrol where Son6HaftaD�n='EVET'
--ORDER BY 1