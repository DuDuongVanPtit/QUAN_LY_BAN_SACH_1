USE QUANLYBANSACH;
GO

-- Drop the database if it already exists (be cautious)
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'QUANLYBANSACH')
    DROP DATABASE QUANLYBANSACH;
GO

-- Create the database
CREATE DATABASE QUANLYBANSACH;
GO

-- Switch to the newly created database
USE QUANLYBANSACH;
GO

-- Create THELOAI table
CREATE TABLE THELOAI
(
    MaTheLoai INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    TenTheLoai NVARCHAR(50) NOT NULL
);
GO

-- Create TACGIA table
CREATE TABLE TACGIA
(
    MaTacGia INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    TenTacGia NVARCHAR(50) NOT NULL
);
GO

-- Create NHAXUATBAN table
CREATE TABLE NHAXUATBAN
(
    MaNXB INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    TenNXB NVARCHAR(50) NOT NULL
);
GO

-- Create SACH table
CREATE TABLE SACH
(
    MaSach INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    TenSach NVARCHAR(50),
    MaTheLoai INT,
    MaNXB INT,
    MaTacGia INT,
    NamXuatBan BIGINT,
    SoLuongTon INT NOT NULL,
    SoTrang INT,
    KhoiLuong NVARCHAR(15),
    NgonNgu NVARCHAR(50),
    TomTat NVARCHAR(2000),
    GiaBia BIGINT NOT NULL,
    KhuyenMai BIGINT,
    GiaBan BIGINT NOT NULL,
    Diem INT,
    LinkAnh NVARCHAR(50)
);
GO

-- Create KHACHHANG table
CREATE TABLE KHACHHANG
(
    MaKH INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    TenKH NVARCHAR(50) NOT NULL,
    DiaChi NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50),
    SDT CHAR(15),
    MatKhau NVARCHAR(50) NOT NULL
);
GO

-- Create NHANXET table
CREATE TABLE NHANXET
(
    MaNS INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    MaSach INT,
    MaKH INT,
    Ten NVARCHAR(500),
    Email NVARCHAR(500),
    Diem INT,
    NoiDung NVARCHAR(500)
);
GO

-- Create SACHYEUTHICH table
CREATE TABLE SACHYEUTHICH
(
    MaSach INT,
    MaKH INT,
    PRIMARY KEY (MaSach, MaKH)
);
GO

-- Create THANHTOAN table
CREATE TABLE THANHTOAN
(
    MaTT INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    KieuTT NVARCHAR(30)
);
GO

-- Create DONHANG table
CREATE TABLE DONHANG
(
    SoDH INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    NgHD NVARCHAR(50) NOT NULL,
    MaKH INT NOT NULL,
    TenNN NVARCHAR(50),
    SDTNN NVARCHAR(15),
    DiaChiNN NVARCHAR(50),
    GhiChu NVARCHAR(500),
    TongTien BIGINT NOT NULL,
    MaTT INT NOT NULL,
    TrangThaiTT INT,
    TrangThaiGiaoHang INT
);
GO

-- Create CT_DONHANG table
CREATE TABLE CT_DONHANG
(
    SoDH INT NOT NULL,
    MaSach INT NOT NULL,
    SoLuong INT NOT NULL,
    DonGiaBan BIGINT NOT NULL,
    ThanhTien BIGINT NOT NULL,
    PRIMARY KEY (SoDH, MaSach)
);
GO

-- Create BAOCAODOANHSO table
CREATE TABLE BAOCAODOANHSO
(
    Thang INT,
    Nam INT,
    TongDoanhThu BIGINT,
    SLB INT,
    PRIMARY KEY (Thang, Nam)
);
GO

-- Create CT_BAOCAODOANHSO table
CREATE TABLE CT_BAOCAODOANHSO
(
    Thang INT,
    Nam INT,
    MaSach INT,
    SLB INT,
    ThanhTien BIGINT,
    TyLe FLOAT,
    PRIMARY KEY (Thang, Nam, MaSach)
);
GO
-- Đặt lại trường tự tăng về giá trị đầu tiên (thường là 1)
-- Thay thế 'TenBang' bằng tên bảng và 'TenTruongTuTang' bằng tên trường tự tăng.
Insert into THELOAI(TenTheLoai) values 
		(N'Âm nhạc'),
        (N'Hành chính'),
        (N'Lịch sử'),
        (N'Văn học'),
        (N'Truyện tranh'),
        (N'Xã hội'),
        (N'Khoa học'),
        (N'Tự nhiên'),
        (N'Thiên văn'),
        (N'Tôn giáo'),
        (N'Nước ngoài');


Insert into TACGIA(TenTacGia)values 
		(N'Charlize Theron'),
		(N'Sienna Miller'),
		(N'Nguyễn Nhật Nam'),
		(N'Cao Thị Mỹ Vân'),
        (N'Trần Nhật Nam'),
		(N'Aí Vân Nguyễn'),
        (N'Lê Thanh Huyền'),
		(N'Hoài Ai Phạm');
      
 
Insert into NHAXUATBAN(TenNXB)values 
		(N'Nhà xuất bản Hà Nội'),
        (N'Cục báo chí'),
        (N'Nhà xuất bản Đồng Nai'),
        (N'Nhà xuất bản Kim Đồng'),
        (N'Đại học quốc gia'),
        (N'Nhà xuất bản Kim Đồng'),
		(N'Nhà xuất bản Văn Minh');
        
Insert into SACH (MaTheLoai,TenSach,MaNXB,MaTacGia,NamXuatBan,SoLuongTon,SoTrang,KhoiLuong,NgonNgu,TomTat,GiaBia,KhuyenMai,GiaBan,Diem,LinkAnh) values
				(1,N'Snmi Tti',1,1,2012,0,170,'15gr',N'Tiếng Nhật',N' Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',26000,0,26000,0,'images/sach/c50.jpg'),
                (2,N'Mùa thu',2,2,2012,0,170,'15gr',N'Tiếng Nhật',N' Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',50000,20,35000,0,'images/sach/c49.jpg'),	
                (3,N'Vượt lên',3,3,2012,0,170,'15gr',N'Tiếng Nhật',N' Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',126000,5,120000,0,'images/sach/c48.jpg'),	
                (4,N'Snmi Tti',4,4,2012,0,170,'15gr',N'Tiếng Nhật',N' Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',53000,10,47000,0,'images/sach/c46.jpg'),	
                (6,N'Mèo Tti',5,5,2012,0,170,'15gr',N'Tiếng Nhật',N' Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',13000,6,11000,0,'images/sach/c45.jpg'),
                (7,N'Snmi Tti',6,7,2012,0,170,'15gr',N'Tiếng Nhật',N' Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',30000,10,20000,0,'images/sach/c43.jpg'),
                (8,N'Buông đôi',7,8,2012,0,170,'15gr',N'Tiếng Nhật',N' Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',25000,15,17000,0,'images/sach/c42.jpg'),
                
                
                (1,N'Cuộc phiêu lưu',1,1,2012,0,170,'15gr',N' Tiếng Việt',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm? Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ và mãi mãi.',15000,0,15000,0,'images/sach/c44.jpg'),	
                (2,N'Ăn và ngủ',2,2,2012,0,170,'15gr',N' Tiếng Việt',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm? Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ và mãi mãi.',19000,2,18000,0,'images/sach/c42.jpg'),
                (3,N'Heo của RATIN',3,3,2012,0,170,'15gr',N' Tiếng Việt',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm? Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ và mãi mãi.',10000,5,8000,0,'images/sach/c40.jpg'),
                (4,N'Ngày hôm qua',4,4,2012,0,170,'15gr',N' Tiếng Việt',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm? Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ và mãi mãi.',23000,8,21000,0,'images/sach/c39.jpg'),
                (5,N'Những chú cừu',5,5,2012,0,170,'15gr',N' Tiếng Việt',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm? Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ và mãi mãi.',9000,1,8500,0,'images/sach/c38.jpg'),
                (6,N'Bạn của tôi',6,6,2012,0,170,'15gr',N' Tiếng Việt',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm? Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ và mãi mãi.',80000,20,65000,0,'images/sach/c37.jpg'),
                (7,N'Người hùng ',7,7,2012,0,170,'15gr',N' Tiếng Việt',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm? Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ và mãi mãi.',78000,13,68000,0,'images/sach/c36.jpg'),
                
                
                (1,N'Haha và bạn',1,8,2012,0,170,'15gr',N'Tiếng Nhật',N'Thế nào nhỉ, cậu phải ngồi xuống bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109, nghe giọng hát và tiếng đàn rất trong vắt của mấy anh guitarist không rõ ở band nào trong ánh đèn vàng mờ của quán, cảm nhận được chân tay những người xung quanh đang chuyển động theo nhịp điệu. Nói thật là mấy người ở Căng tin làm tớ tự ti về bản thân vô cùng, ai cũng giỏi, ai cũng là nghệ sĩ đỉnh, cậu phải ngồi xuống bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109, cậu phải ngồi xuống bên cạnh tớ trong 1 góc bàn.',6000,0,6000,0,'images/sach/c36.jpg'),	
                (2,N'Qúa trình tiêu',2,7,2012,0,170,'15gr',N'Tiếng Nhật',N'Thế nào nhỉ, cậu phải ngồi xuống bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109, nghe giọng hát và tiếng đàn rất trong vắt của mấy anh guitarist không rõ ở band nào trong ánh đèn vàng mờ của quán, cảm nhận được chân tay những người xung quanh đang chuyển động theo nhịp điệu. Nói thật là mấy người ở Căng tin làm tớ tự ti về bản thân vô cùng, ai cũng giỏi, ai cũng là nghệ sĩ đỉnh, ha ha ha ha cậu phải ngồi xuống bên bên bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109.cao trong lĩnh vực của họ. ',15000,12,10000,0,'images/sach/c34.jpg'),	
				(3,N'Cơn mua cuối',3,6,2012,0,170,'15gr',N'Tiếng Nhật',N'Thế nào nhỉ, cậu phải ngồi xuống bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109, nghe giọng hát và tiếng đàn rất trong vắt của mấy anh guitarist không rõ ở band nào trong ánh đèn vàng mờ của quán, cảm nhận được chân tay những người xung quanh đang chuyển động theo nhịp điệu. Nói thật là mấy người ở Căng tin làm tớ tự ti về bản thân vô cùng, ai cũng giỏi, ai cũng là nghệ sĩ đỉnh, ha ha ha ha cậu phải ngồi xuống bên bên bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109.cao trong lĩnh vực của họ. ',8000,10,7000,0,'images/sach/c32.jpg'),	
                (4,N'Mùa thu và em',4,5,2012,0,170,'15gr',N'Tiếng Nhật',N'Thế nào nhỉ, cậu phải ngồi xuống bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109, nghe giọng hát và tiếng đàn rất trong vắt của mấy anh guitarist không rõ ở band nào trong ánh đèn vàng mờ của quán, cảm nhận được chân tay những người xung quanh đang chuyển động theo nhịp điệu. Nói thật là mấy người ở Căng tin làm tớ tự ti về bản thân vô cùng, ai cũng giỏi, ai cũng là nghệ sĩ đỉnh, ha ha ha ha cậu phải ngồi xuống bên bên bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109.cao trong lĩnh vực của họ. ',30000,16,24000,0,'images/sach/c29.jpg'),	
                (5,N'Mèo con',5,4,2012,0,170,'15gr',N'Tiếng Nhật',N'Thế nào nhỉ, cậu phải ngồi xuống bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109, nghe giọng hát và tiếng đàn rất trong vắt của mấy anh guitarist không rõ ở band nào trong ánh đèn vàng mờ của quán, cảm nhận được chân tay những người xung quanh đang chuyển động theo nhịp điệu. Nói thật là mấy người ở Căng tin làm tớ tự ti về bản thân vô cùng, ai cũng giỏi, ai cũng là nghệ sĩ đỉnh, ha ha ha ha cậu phải ngồi xuống bên bên bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109.cao trong lĩnh vực của họ. ',60000,7,53000,0,'images/sach/c28.jpg'),	
                (6,N'Máy tính',6,3,2012,0,170,'15gr',N'Tiếng Nhật',N'Thế nào nhỉ, cậu phải ngồi xuống bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109, nghe giọng hát và tiếng đàn rất trong vắt của mấy anh guitarist không rõ ở band nào trong ánh đèn vàng mờ của quán, cảm nhận được chân tay những người xung quanh đang chuyển động theo nhịp điệu. Nói thật là mấy người ở Căng tin làm tớ tự ti về bản thân vô cùng, ai cũng giỏi, ai cũng là nghệ sĩ đỉnh, ha ha ha ha cậu phải ngồi xuống bên bên bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109.cao trong lĩnh vực của họ. ',23000,5,21000,0,'images/sach/a27.jpg'),	
                (7,N'Người yêu',7,2,2012,0,170,'15gr',N'Tiếng Nhật',N'Thế nào nhỉ, cậu phải ngồi xuống bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109, nghe giọng hát và tiếng đàn rất trong vắt của mấy anh guitarist không rõ ở band nào trong ánh đèn vàng mờ của quán, cảm nhận được chân tay những người xung quanh đang chuyển động theo nhịp điệu. Nói thật là mấy người ở Căng tin làm tớ tự ti về bản thân vô cùng, ai cũng giỏi, ai cũng là nghệ sĩ đỉnh, ha ha ha ha cậu phải ngồi xuống bên bên bên cạnh tớ trong 1 góc bàn nhỏ củaCăng-tin 109.cao trong lĩnh vực của họ. ',24000,17,21000,0,'images/sach/26.jpg'),	
                
              
                (2,N'Bình minh',7,6,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',15000,3,12000,0,'images/sach/c25.jpg'),	
                (3,N'Qúa khứ',6,8,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',50000,8,45000,0,'images/sach/c24.jpg'),	
                (4,N'Cơn mưa',5,7,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',40000,17,32000,0,'images/sach/c23.jpg'),	
                (5,N'Hà nội',4,3,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',23000,0,23000,0,'images/sach/c22.jpg'),	
                (6,N'Mùa đông',3,4,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',63000,8,60000,0,'images/sach/c20.jpg'),	
                (7,N'Mãi mãi',2,1,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',36000,23,20000,0,'images/sach/c19.jpg'),	
                (8,N'Hạnh phúc muộn',1,2,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',25000,12,13000,0,'images/sach/c18.jpg'),	
                
                
				(5,N'Lập trình',1,2,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',80000,20,56000,0,'images/sach/c17.jpg'),	
				(6,N'Sóc con',2,1,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',7000,0,7000,0,'images/sach/c16.jpg'),	
				(7,N'Cố bé khăn đỏ',3,6,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',25000,13,20000,0,'images/sach/bc15.jpg'),	
				(8,N'Cô tấm',4,7,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',14000,1,13500,0,'images/sach/c14.jpg'),	
				(9,N'Người sắt',5,5,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',10000,4,9000,0,'images/sach/c13.jpg'),	
				(10,N'Rừng phương nam',6,4,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',33000,16,30000,0,'images/sach/c12.jpg'),	
				(11,N'Hema kanmi',7,8,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',37000,19,30000,0,'images/sach/c11.jpg'),	
                
                (8,N'Xã hội thế kỉ 12',1,6,2012,0,170,'15gr',N'Việt Nam',N'Dường như là người Hà Nội của thế hệ này tức là bọn mình đang chật vật chắp vá những mảnh vỡ của cũ và mới. Mọi thứ sẽ không dễ dàng. Nhưng tớ yêu tha thiết làm sao những viên đá có nhiều vết xước. Những khe nứt không hoàn hảo ở thành phố này hình như được lấp đầy bởi sự ấm áp, cái ấm tớ cảm nhận được bên cốc cà phê khi ngồi bên những người lạ nghe âm thanh về những đam mê của tuổi trẻ.',35000,0,35000,0,'images/sach/c10.jpg'),	
                (7,N'Công nghệ mới',2,7,2012,0,170,'15gr',N'Việt Nam',N'Dường như là người Hà Nội của thế hệ này tức là bọn mình đang chật vật chắp vá những mảnh vỡ của cũ và mới. Mọi thứ sẽ không dễ dàng. Nhưng tớ yêu tha thiết làm sao những viên đá có nhiều vết xước. Những khe nứt không hoàn hảo ở thành phố này hình như được lấp đầy bởi sự ấm áp, cái ấm tớ cảm nhận được bên cốc cà phê khi ngồi bên những người lạ nghe âm thanh về những đam mê của tuổi trẻ.',25000,4,32000,0,'images/sach/c9.jpg'),	
                (5,N'Sử dụng Laptop',3,4,2012,0,170,'15gr',N'Việt Nam',N'Dường như là người Hà Nội của thế hệ này tức là bọn mình đang chật vật chắp vá những mảnh vỡ của cũ và mới. Mọi thứ sẽ không dễ dàng. Nhưng tớ yêu tha thiết làm sao những viên đá có nhiều vết xước. Những khe nứt không hoàn hảo ở thành phố này hình như được lấp đầy bởi sự ấm áp, cái ấm tớ cảm nhận được bên cốc cà phê khi ngồi bên những người lạ nghe âm thanh về những đam mê của tuổi trẻ.',45000,10,41000,0,'images/sach/c8.jpg'),	
                (4,N'Vào bếp',4,2,2012,0,170,'15gr',N'Việt Nam',N'Dường như là người Hà Nội của thế hệ này tức là bọn mình đang chật vật chắp vá những mảnh vỡ của cũ và mới. Mọi thứ sẽ không dễ dàng. Nhưng tớ yêu tha thiết làm sao những viên đá có nhiều vết xước. Những khe nứt không hoàn hảo ở thành phố này hình như được lấp đầy bởi sự ấm áp, cái ấm tớ cảm nhận được bên cốc cà phê khi ngồi bên những người lạ nghe âm thanh về những đam mê của tuổi trẻ.',60000,20,48000,0,'images/sach/c7.jpg'),	
                (3,N'Anh hùng rơm',5,1,2012,0,170,N'Việt Nam','15gr',N'Dường như là người Hà Nội của thế hệ này tức là bọn mình đang chật vật chắp vá những mảnh vỡ của cũ và mới. Mọi thứ sẽ không dễ dàng. Nhưng tớ yêu tha thiết làm sao những viên đá có nhiều vết xước. Những khe nứt không hoàn hảo ở thành phố này hình như được lấp đầy bởi sự ấm áp, cái ấm tớ cảm nhận được bên cốc cà phê khi ngồi bên những người lạ nghe âm thanh về những đam mê của tuổi trẻ.',70000,9,65000,0,'images/sach/c6.jpg'),	
                (2,N'Mẹ tôi',6,3,2012,0,170,'15gr',N'Việt Nam',N'Dường như là người Hà Nội của thế hệ này tức là bọn mình đang chật vật chắp vá những mảnh vỡ của cũ và mới. Mọi thứ sẽ không dễ dàng. Nhưng tớ yêu tha thiết làm sao những viên đá có nhiều vết xước. Những khe nứt không hoàn hảo ở thành phố này hình như được lấp đầy bởi sự ấm áp, cái ấm tớ cảm nhận được bên cốc cà phê khi ngồi bên những người lạ nghe âm thanh về những đam mê của tuổi trẻ.',17000,13,14000,0,'images/sach/c5.jpg'),	
                (1,N'Cha tôi',7,8,2012,0,170,'15gr',N'Việt Nam',N'Dường như là người Hà Nội của thế hệ này tức là bọn mình đang chật vật chắp vá những mảnh vỡ của cũ và mới. Mọi thứ sẽ không dễ dàng. Nhưng tớ yêu tha thiết làm sao những viên đá có nhiều vết xước. Những khe nứt không hoàn hảo ở thành phố này hình như được lấp đầy bởi sự ấm áp, cái ấm tớ cảm nhận được bên cốc cà phê khi ngồi bên những người lạ nghe âm thanh về những đam mê của tuổi trẻ.',23000,5,21000,0,'images/sach/c4.jpg'),	
                
				(11,'Sarahuta anmi',1,6,2012,0,170,'15gr',N'Việt Nam',N' Buổi tối, con sẽ phát triển rất tốt nếu có thể thư giãn, thưởng thức một bài hát yêu thích cùng mẹ, xem một tập phim hay thư thả dạo bộ, nhưng mẹ  lại luôn tất bật bên từng trang giáo án, những tập kiểm tra còn chấm dở, những cuộc gọi thắc mắc bài vở từ học sinh của mình. Nhưng tại sao bận như vậy mà mẹ luôn thoải mái, luôn cảm thấy vui vẻ, chỉ cần học sinh mình hiểu bài và học tập được tốt thì có lẽ mẹ sẵn sàng làm tất cả cho họ.',38000,10,350000,0,'images/sach/c3.jpg'),	
				(10,N'Mưa chậm',2,8,2012,0,170,'15gr',N'Việt Nam',N' Buổi tối, con sẽ phát triển rất tốt nếu có thể thư giãn, thưởng thức một bài hát yêu thích cùng mẹ, xem một tập phim hay thư thả dạo bộ, nhưng mẹ  lại luôn tất bật bên từng trang giáo án, những tập kiểm tra còn chấm dở, những cuộc gọi thắc mắc bài vở từ học sinh của mình. Nhưng tại sao bận như vậy mà mẹ luôn thoải mái, luôn cảm thấy vui vẻ, chỉ cần học sinh mình hiểu bài và học tập được tốt thì có lẽ mẹ sẵn sàng làm tất cả cho họ.',22000,5,20000,0,'images/sach/c2.jpg'),	
				(9,N'Khoa học tự nhiên',3,7,2012,0,170,'15gr',N'Việt Nam',N' Buổi tối, con sẽ phát triển rất tốt nếu có thể thư giãn, thưởng thức một bài hát yêu thích cùng mẹ, xem một tập phim hay thư thả dạo bộ, nhưng mẹ  lại luôn tất bật bên từng trang giáo án, những tập kiểm tra còn chấm dở, những cuộc gọi thắc mắc bài vở từ học sinh của mình. Nhưng tại sao bận như vậy mà mẹ luôn thoải mái, luôn cảm thấy vui vẻ, chỉ cần học sinh mình hiểu bài và học tập được tốt thì có lẽ mẹ sẵn sàng làm tất cả cho họ.',50000,13,43000,0,'images/sach/c1.jpg'),
            
            (10,'Argentina',7,5,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',15000,30,12000,0,'images/sach/c51.jpg'),
			(9,'Armenia',6,4,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',50000,10,40000,0,'images/sach/c52.jpg'),
			(8,'Azerbaijan',5,3,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',90000,34,7800,0,'images/sach/c53.jpg'),
			(7,'Bahamas',4,2,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',12000,0,12000,0,'images/sach/c54.jpg'),
			(6,'Bahrain',3,1,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',35000,17,3000,0,'images/sach/c55.jpg'),
			(5,'Bangladesh',2,7,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',60000,34,40000,0,'images/sach/c56.jpg'),
			(4,'Belarus',1,8,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',48000,10,39000,0,'images/sach/c57.jpg'),
			(10,'Vương quốc',4,5,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',15000,22,10000,0,'images/sach/c58.jpg'),
			(11,'Bulgaria',2,4,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',50000,7,45000,0,'images/sach/c59.jpg'),
			(11,'Burkina Faso',1,3,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',9000,4,800,0,'images/sach/c60.jpg'),
			(2,'Cameroon',6,2,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',12000,0,12000,0,'images/sach/c61.jpg'),
			(4,'Campuchia',7,1,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',45000,8,30000,0,'images/sach/c62.jpg'),
			(4,'Comoros',5,7,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',60000,31,42000,0,'images/sach/c63.jpg'),
			(4,'Quần đảo Cook',4,8,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',80000,10,70000,0,'images/sach/c64.jpg'),
			(1,'Dominicana',4,5,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',15000,2,14000,0,'images/sach/c65.jpg'),
			(4,'Đan Mạch',2,5,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',51000,9,42000,0,'images/sach/c66.jpg'),
			(10,'Liên bang Đức',1,3,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',92000,23,6300,0,'images/sach/c67.jpg'),
			(6,'Eritrea',6,4,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',12000,0,12000,0,'images/sach/c68.jpg'),
			(3,'Cộng hòa Gabon',7,2,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',45000,20,30000,0,'images/sach/c69.jpg'),
			(5,'Xích Đạo',5,6,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',23000,31,12000,0,'images/sach/c70.jpg'),
			(4,'Hợp tác Guyana',4,8,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',80000,9,71000,0,'images/sach/c71.jpg'),			
			(9,'Cộng hòa Haiti',4,7,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',19000,0,19000,0,'images/sach/c72.jpg'),
			(1,'Cộng hòa Iceland',6,4,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',55000,13,45000,0,'images/sach/c74.jpg'),
			(11,'Hồi giáo Iran',2,3,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',27000,13,25000,0,'images/sach/c73.jpg'),
			(2,'Cộng hòa Ireland',7,2,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',35000,30,26000,0,'images/sach/c75.jpg'),
			(2,'Cộng hòa Kenya',2,1,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',35000,18,29000,0,'images/sach/c76.jpg'),
			(5,'Cộng hòa Kosovo',6,4,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',70000,21,47000,0,'images/sach/c77.jpg'),
			(4,'Mauritanie',5,8,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',76000,29,55000,0,'images/sach/c78.jpg'),
            			(1,'Mexico',3,5,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',15000,22,10000,0,'images/sach/c79.jpg'),
			(4,'Monaco',2,6,2012,0,170,'15gr',N'Tiếng Nhật',N'Kim Ngưu đủng đỉnh tốt hơn nên bớt đủng đỉnh ngay từ bây giờ, bởi trong năm 2016 tới, bạn sẽ không muốn bỏ lỡ bất cứ cơ hội tận hưởng cuộc sống nào, từ việc vui chơi đến lao động hay hòa nhập vào cộng đồng.Bạn có biết, nếu coi bản đồ sao cá nhân là ngôi nhà của bạn, thì các hành tinh sẽ như những vị khách đến ở trọ những căn phòng khác nhau trong đó, có người chỉ vài ngày, vài tháng, có kẻ sẽ “chai mặt” ở lì cả vài năm?',50000,7,45000,0,'images/sach/c90.jpg');

insert into KHACHHANG  (TenKH,DiaChi,Email,SDT,MatKhau) values ('none','none','none','none','none'),	
																(N'admin','admin','admin','admin','admin'),
                                                                (N'Thụy Sĩ',N'Lộc Hà - Hà Tĩnh - Việt Nam','thuisi@gmail.com','01688 544 200','thuisi'),
                                                                (N'Cộng hòa Togo',N'Lộc Hà - Hà Tĩnh - Việt Nam','conhao@gmail.com','0988 584 800','tago'),
                                                                (N'Grê-na-din',N'Lộc Hà - Hà Tĩnh - Việt Nam','ganere@gmail.com','01688 674 123','ganere');
insert into THANHTOAN  (KieuTT) values (N'Chuyển khoản qua ngân hàng'),(N'Trả trực tiếp khi nhận hàng');

