/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.3.16-MariaDB : Database - db_sparepart
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_sparepart` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_sparepart`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `user` text DEFAULT NULL,
  `pass` text DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`id_admin`,`user`,`pass`) values (1,'admin','admin');

/*Table structure for table `bank` */

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `id_bank` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bank` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_bank`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `bank` */

insert  into `bank`(`id_bank`,`nama_bank`) values (1,'BRI'),(2,'BCA'),(3,'Bank Panin'),(4,'Mandiri'),(5,'Bukopin'),(6,'BNI');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id_keranjang` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang` int(11) DEFAULT NULL,
  `id_pembeli` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_keranjang`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

/*Data for the table `cart` */

/*Table structure for table `pembayaran` */

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `bank` varchar(15) DEFAULT NULL,
  `jumlah` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `foto` text DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `pembayaran` */

insert  into `pembayaran`(`id_pembayaran`,`nama`,`bank`,`jumlah`,`tanggal`,`foto`) values (23,'Gema fajar','BRI ','4910000','2019-08-13',NULL);

/*Table structure for table `pembeli` */

DROP TABLE IF EXISTS `pembeli`;

CREATE TABLE `pembeli` (
  `id_pembeli` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `telpon` varchar(30) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_pembeli`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `pembeli` */

insert  into `pembeli`(`id_pembeli`,`nama`,`email`,`password`,`telpon`,`alamat`) values (1,'gema fajar','gemafajar09@gmail.com','admin','082122855458','Jalan Raya lubuk minturun'),(2,'Egova','egova123@gmail.com','admin','0987654321','parak karakah'),(3,'fanderio','fanderio@gmail.com','admin','08995489505','jalan raya lubuk minturun Rt.0');

/*Table structure for table `pembelian` */

DROP TABLE IF EXISTS `pembelian`;

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL AUTO_INCREMENT,
  `id_pembeli` int(11) DEFAULT NULL,
  `tanggal_pembelian` date DEFAULT NULL,
  PRIMARY KEY (`id_pembelian`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

/*Data for the table `pembelian` */

/*Table structure for table `pembelian_barang` */

DROP TABLE IF EXISTS `pembelian_barang`;

CREATE TABLE `pembelian_barang` (
  `id_cart` int(11) NOT NULL AUTO_INCREMENT,
  `id_pembeli` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` varchar(100) DEFAULT 'pending',
  PRIMARY KEY (`id_cart`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

/*Data for the table `pembelian_barang` */

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `status` */

insert  into `status`(`id_status`,`status`) values (1,'Pending'),(2,'Sedang Diproses'),(3,'Sedang Dikirim');

/*Table structure for table `tbl_alamat` */

DROP TABLE IF EXISTS `tbl_alamat`;

CREATE TABLE `tbl_alamat` (
  `id_alamat` int(11) NOT NULL AUTO_INCREMENT,
  `id_pembeli` int(11) DEFAULT NULL,
  `tanggal_peng` date DEFAULT NULL,
  `kode_pos` varchar(11) DEFAULT NULL,
  `total_belanja` varchar(30) DEFAULT NULL,
  `ongkos` varchar(30) DEFAULT NULL,
  `kurir` varchar(30) DEFAULT NULL,
  `total_kes` varchar(30) DEFAULT NULL,
  `status` varchar(15) DEFAULT 'Pending',
  PRIMARY KEY (`id_alamat`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_alamat` */

insert  into `tbl_alamat`(`id_alamat`,`id_pembeli`,`tanggal_peng`,`kode_pos`,`total_belanja`,`ongkos`,`kurir`,`total_kes`,`status`) values (17,1,'2019-08-13','25175','4870000','40000','jne','4910000','Sedang Dikirim');

/*Table structure for table `tbl_kategori` */

DROP TABLE IF EXISTS `tbl_kategori`;

CREATE TABLE `tbl_kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_kategori` */

insert  into `tbl_kategori`(`id_kategori`,`kategori`) values (1,'handphone'),(2,'audio'),(3,'komputer'),(4,'Sparepart Hp'),(5,'Sparepart Audio'),(6,'Sparepart kom');

/*Table structure for table `tbl_komen` */

DROP TABLE IF EXISTS `tbl_komen`;

CREATE TABLE `tbl_komen` (
  `id_komen` int(11) NOT NULL AUTO_INCREMENT,
  `id_pembeli` int(11) DEFAULT NULL,
  `komentar` varchar(250) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`id_komen`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_komen` */

insert  into `tbl_komen`(`id_komen`,`id_pembeli`,`komentar`,`tanggal`) values (1,1,'Mantul gan','2019-08-13');

/*Table structure for table `tbl_product` */

DROP TABLE IF EXISTS `tbl_product`;

CREATE TABLE `tbl_product` (
  `id_barang` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(11) DEFAULT NULL,
  `kd_barang` varchar(30) DEFAULT NULL,
  `nama_barang` varchar(30) DEFAULT NULL,
  `harga` varchar(30) DEFAULT NULL,
  `garansi` varchar(30) DEFAULT NULL,
  `jumlah` varbinary(30) DEFAULT NULL,
  `berat` int(11) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `ket` text DEFAULT NULL,
  `foto` text DEFAULT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_product` */

insert  into `tbl_product`(`id_barang`,`id_kategori`,`kd_barang`,`nama_barang`,`harga`,`garansi`,`jumlah`,`berat`,`tgl`,`ket`,`foto`) values (15,1,'HP-01','SAMSUNG A6','2800000','1 tahun','41',1,'2019-07-18','Galaxy A6 dibekali layar 5.6 inci berasio 18.5:9, dengan ditenagai Exynos 7870 octa-core dipadukan RAM 3GB/4GB, ROM 32GB/64GB, IP68 water-resistant, kamera belakang 16MP dan kamera depan 16MP, baterai berkapasitas 3000 mAh','3.jpg'),(17,1,'Hp-02','SAMSUNG A8','4800000','2 Tahun','4',1,'2019-07-30','OS 	Android 7.1.1 (Nougat), upgradable to Android 9.0 (Pie); One UI\r\nChipset 	Exynos 7885 (14 nm)\r\nCPU 	Octa-core (2x2.2 GHz Cortex-A73 & 6x1.6 GHz Cortex-A53)\r\nGPU 	Mali-G71','4.jpg'),(18,4,'Sp-01','Fleksibel','70000','1 bulan','15',1,'2019-08-20','Fleksibel samsung Semua tipe','p1.jpg');

/*Table structure for table `tbl_transaksi` */

DROP TABLE IF EXISTS `tbl_transaksi`;

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang` int(11) DEFAULT NULL,
  `id_pembeli` int(11) DEFAULT NULL,
  `tanggal_b` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_transaksi` */

insert  into `tbl_transaksi`(`id_transaksi`,`id_barang`,`id_pembeli`,`tanggal_b`,`status`) values (45,17,1,'2019-08-13','Pending'),(46,18,1,'2019-08-13','Pending');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
