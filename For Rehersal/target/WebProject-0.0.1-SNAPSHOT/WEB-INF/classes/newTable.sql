USE [WebProject]
GO
SET IDENTITY_INSERT [dbo].[CityInfo] ON 
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (1, N'臺北市')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (2, N'新北市')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (3, N'桃園市')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (4, N'臺中市')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (5, N'臺南市')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (6, N'高雄市')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (7, N'基隆市')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (8, N'新竹市')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (9, N'嘉義市')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (10, N'新竹縣')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (11, N'苗栗縣')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (12, N'彰化縣')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (13, N'南投縣')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (14, N'雲林縣')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (15, N'嘉義縣')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (16, N'屏東縣')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (17, N'宜蘭縣')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (18, N'花蓮縣')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (19, N'臺東縣')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (20, N'澎湖縣')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (21, N'金門縣')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (22, N'連江縣')
INSERT [dbo].[CityInfo] ([cityCode], [cityName]) VALUES (23, N'其他')
SET IDENTITY_INSERT [dbo].[CityInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodFervor] ON 
INSERT [dbo].[FoodFervor] ([fervorCode], [fervorItem]) VALUES (1, N'中式')
INSERT [dbo].[FoodFervor] ([fervorCode], [fervorItem]) VALUES (2, N'快餐')
INSERT [dbo].[FoodFervor] ([fervorCode], [fervorItem]) VALUES (3, N'燒肉')
INSERT [dbo].[FoodFervor] ([fervorCode], [fervorItem]) VALUES (4, N'西式')
INSERT [dbo].[FoodFervor] ([fervorCode], [fervorItem]) VALUES (5, N'下午茶')
INSERT [dbo].[FoodFervor] ([fervorCode], [fervorItem]) VALUES (6, N'日式')
INSERT [dbo].[FoodFervor] ([fervorCode], [fervorItem]) VALUES (7, N'皆可')
SET IDENTITY_INSERT [dbo].[FoodFervor] OFF
GO
INSERT [dbo].[UserGender] ([genderCode], [genderText]) VALUES ('M', N'男性')
INSERT [dbo].[UserGender] ([genderCode], [genderText]) VALUES ('W', N'女性')
INSERT [dbo].[UserGender] ([genderCode], [genderText]) VALUES ('N', N'不方便提供')
GO
INSERT [dbo].[UserLevel] ([lv], [levelName]) VALUES (-1, N'管理員')
INSERT [dbo].[UserLevel] ([lv], [levelName]) VALUES (0, N'消費者')
INSERT [dbo].[UserLevel] ([lv], [levelName]) VALUES (1, N'店家')
GO
INSERT [dbo].[Willing] ([willingCode], [willingText]) VALUES ('Y', N'願意')
INSERT [dbo].[Willing] ([willingCode], [willingText]) VALUES ('N', N'不願意')
GO 
INSERT [dbo].[WebUserInfo] ([userId], [account], [addr0], [addr1], [addr2], [birth], [email], [fervor], [firstName], [joinDate], [lastName], [nickname], [password], [phone], [status], [version], [zest], [lv], [genderCode], [willingCode], [cityCode], [iconUrl]) VALUES ('0000000', N'WebAdmin', N'桃園市中壢區中大路300號', N'', N'', CAST(N'1990-01-01' AS Date), N'notARealEmail@gmail.com', N'皆可', N'管', CAST(N'2020-11-04' AS Date), N'李元', N'管理員', N'WebAdmin2020', N'0955779933', N'active', 0, CAST(0.00 AS Decimal(19, 2)), -1, N'N', N'N', 3, N'')
INSERT [dbo].[WebUserInfo] ([userId], [account], [addr0], [addr1], [addr2], [birth], [email], [fervor], [firstname], [joinDate], [lastName], [nickname], [password], [phone], [status], [version], [zest], [lv], [genderCode], [willingCode], [cityCode], [iconUrl]) VALUES ('1000000', N'TestUser', N'桃園市中壢區中大路300號', N'', N'', CAST(N'2000-10-10' AS Date), N'notARealEmail@yahoo.com', N'中式,快餐,燒肉,西式,下午茶,日式,皆可', N'吳', CAST(N'2020-11-04' AS Date), N'此仁', N'無此人', N'TestUser1256', N'0911223344', N'active', 0, CAST(0.00 AS Decimal(19, 2)), 0, N'M', N'N', 3, N'')
INSERT [dbo].[WebUserInfo] ([userId], [account], [addr0], [addr1], [addr2], [birth], [email], [fervor], [firstName], [joinDate], [lastName], [nickname], [password], [phone], [status], [version], [zest], [lv], [genderCode], [willingCode], [cityCode], [iconUrl]) VALUES ('2000000', N'TestBoss', N'桃園市中壢區中大路300號', N'', N'', CAST(N'1980-12-31' AS Date), N'notARealEmail@outlook.com', N'中式,快餐,燒肉', N'郝', CAST(N'2020-11-04' AS Date), N'頭家', N'好頭家', N'TestBossZest1104', N'0933441122', N'active', 0, CAST(0.00 AS Decimal(19, 2)), 1, N'W', N'N', 3, N'')
GO


