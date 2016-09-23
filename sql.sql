//テーブル作成
//測定ログ
Create Table DetectiveLog(
	id Integer,
	raspberrypimac Varchar ,
	hostname Varchar ,
	beaconmac Varchar ,
	ipaddress Varchar,
	uuid Varchar ,
	major Integer ,
	minor Integer ,
	crssi Integer ,
	rssi Integer ,
	detectivetime Timestamp 
);

drop table detectivelog 

update configVal set loop_interval= 10;


//ラズベリーパイメッセージ
Create Table RaspberryPiMessage(
	id Integer ,
	raspberrypimac Varchar  ,
	hostname Varchar ,
	ipaddress Varchar , 
	updatetime Timestamp 
);

drop table raspberrypimessage 
select * from RaspberryPiMessage;

//ビーコン情報
Create Table BeaconInfo (
	id Integer,
	beaconmac Varchar ,
	name Varchar,
	uuid Varchar,
	major Integer,
	minor Integer
);

drop table beaconinfo

//会議室ラズベリーパイ情報
create table RaspberryPiInfo (
	id integer,
	raspberrypimac varchar,
	name varchar,
	hostname varchar,
	ipaddress varchar
);
drop table raspberrypiinfo 

//会議室ラズベリーパイの状態（会議室のラズベリーの1対1）
create table RaspberryPiStatus(
	id integer,
	raspberrypimac varchar,
	status boolean,
	starttime timestamp,
	endtime timestamp,
	updatetime timestamp
);
drop table raspberrypistatus 

//鍵管理ラズベリーパイ情報
Create Table RaspberryPiManager(
	id Integer,
	raspberrypimac Varchar,
	name Varchar,
	hostname Varchar,
	ipaddress Varchar
);

drop table raspberrypimanager 

//会議室ラズベリーと鍵のマッチングテーブル
create table KeyMatch(
	id integer,
	beaconmac Varchar,
	raspberrypimac Varchar 
);

drop table keymatch

//鍵管理ラズベリーと管理鍵のマッチングテーブル
Create Table KeyManage(
	id Integer,
	beaconmac Varchar,
	raspberrypimac Varchar
);

drop table keymanage;


create table configval
(
	uuid varchar,
	confrssi integer,
	managerssi integer,
	rasp_id varchar,
	rasp_pass varchar,
	loop_interval integer,
	no_detected_min integer
);

drop table configval
insert into configval values('481ceb282bdd42d39c7cd94e39c59d64',-40,-80,'pi','raspberry',10);
Update configval Set confrssi = -40, managerssi= -80, rasp_id =  'pi' , rasp_pass =  'raspberry', no_detected_min = 10;
select * from configval  


create table users
(
	id Varchar not null,
	password varchar not null,
	enabled integer NOT NULL DEFAULT 1
);


CREATE TABLE USER_AUTH
(
id Varchar not null,
authority varchar(30) not null
)


insert into users values('kiwan','rldhk');
insert into users values('guest','guest');


drop table USER_AUTH;

insert into USER_AUTH values('guest','ROLE_USER');
insert into USER_AUTH values('kiwan','ROLE_ADMIN');






//テスト情報注入
//鍵情報
Delete From BeaconInfo
Insert into BeaconInfo(beaconmac, name, uuid, major, minor) values('11:22:33:10:00:00', 'Meeting Room 1 Key', '481ceb28-2bdd-42d3-9c7c-d94e39c59d64', 1, 3001);
Insert into BeaconInfo(beaconmac, name, uuid, major, minor) values('11:22:33:20:00:00', 'Meeting Room 2 Key', '481ceb28-2bdd-42d3-9c7c-d94e39c59d64', 1, 3002);
Insert into BeaconInfo(beaconmac, name, uuid, major, minor) values('11:22:33:30:00:00', 'Meeting Room 3 Key', '481ceb28-2bdd-42d3-9c7c-d94e39c59d64', 1, 3003);
Insert into BeaconInfo(beaconmac, name, uuid, major, minor) values('11:22:33:40:00:00', 'Meeting Room 4 Key', '481ceb28-2bdd-42d3-9c7c-d94e39c59d64', 1, 3001);
Insert into BeaconInfo(beaconmac, name, uuid, major, minor) values('11:22:33:50:00:00', 'Meeting Room 5 Key', '481ceb28-2bdd-42d3-9c7c-d94e39c59d64', 1, 3002);
Insert into BeaconInfo(beaconmac, name, uuid, major, minor) values('11:22:33:60:00:00', 'Meeting Room 6 Key', '481ceb28-2bdd-42d3-9c7c-d94e39c59d64', 1, 3003);

//会議室ラズベリー情報と状態
Insert Into RaspberryPiInfo(raspberrypimac, name, hostname, ipaddress) values('11:22:33:00:00:01', 'Meeting Room 1', 'MeetingRoom-pi1', '192.168.XXX.XXX');
Insert into RaspberryPiStatus(raspberrypimac, status) values('11:22:33:00:00:01', false);
Insert Into RaspberryPiInfo(raspberrypimac, name, hostname, ipaddress) values('11:22:33:00:00:02', 'Meeting Room 2', 'MeetingRoom-pi2', '192.168.XXX.XXX');
Insert into RaspberryPiStatus(raspberrypimac, status) values('11:22:33:00:00:02', false);
Insert Into RaspberryPiInfo(raspberrypimac, name, hostname, ipaddress) values('11:22:33:00:00:03', 'Meeting Room 3', 'MeetingRoom-pi3', '192.168.XXX.XXX');
Insert into RaspberryPiStatus(raspberrypimac, status) values('11:22:33:00:00:03', false);

Insert Into RaspberryPiInfo(raspberrypimac, name, hostname, ipaddress) values('11:22:33:00:00:04', 'Meeting Room 4', 'MeetingRoom-pi4', '192.168.XXX.XXX');
Insert into RaspberryPiStatus(raspberrypimac, status) values('11:22:33:00:00:04', false);

Insert Into RaspberryPiInfo(raspberrypimac, name, hostname, ipaddress) values('11:22:33:00:00:07', 'Meeting Room 7', 'MeetingRoom-pi7', '192.168.XXX.XXX');
Insert into RaspberryPiStatus(raspberrypimac, status) values('11:22:33:00:00:07', false);

Delete From RaspberryPiStatus Where raspberrypimac = '11:22:33:00:00:04'

//会議室と鍵のマッチング
Insert into KeyMatch(raspberrypimac, beaconmac) Values('11:22:33:00:00:01', '11:22:33:10:00:00');
Insert into KeyMatch(raspberrypimac, beaconmac) Values('11:22:33:00:00:02', '11:22:33:20:00:00');
Insert into KeyMatch(raspberrypimac, beaconmac) Values('11:22:33:00:00:03', '11:22:33:30:00:00');
Insert into KeyMatch(raspberrypimac, beaconmac) Values('11:22:33:00:00:04', '11:22:33:40:00:00');

//鍵管理ラズベリー情報
Insert Into RaspberryPiManager(raspberrypimac, name, hostname, ipaddress) values('FF:FF:FF:00:00:01', 'Key Manager 1', 'KeyManager-pi1', '192.168.XXX.XXX');
Insert Into RaspberryPiManager(raspberrypimac, name, hostname, ipaddress) values('FF:FF:FF:00:00:02', 'Key Manager 2', 'KeyManager-pi2', '192.168.XXX.XXX');
Insert Into RaspberryPiManager(raspberrypimac, name, hostname, ipaddress) values('FF:FF:FF:00:00:03', 'Key Manager 3', 'KeyManager-pi3', '192.168.XXX.XXX');

//鍵管理ラズベリーと管理鍵のマッチング
Delete From KeyManage

Insert into KeyManage(raspberrypimac, beaconmac) Values('FF:FF:FF:00:00:01', '11:22:33:10:00:00');
Insert into KeyManage(raspberrypimac, beaconmac) Values('FF:FF:FF:00:00:01', '11:22:33:20:00:00');
Insert into KeyManage(raspberrypimac, beaconmac) Values('FF:FF:FF:00:00:01', '11:22:33:30:00:00');
Insert into KeyManage(raspberrypimac, beaconmac) Values('FF:FF:FF:00:00:01', '11:22:33:40:00:00');
Insert into KeyManage(raspberrypimac, beaconmac) Values('FF:FF:FF:00:00:01', '11:22:33:50:00:00');
Insert into KeyManage(raspberrypimac, beaconmac) Values('FF:FF:FF:00:00:01', '11:22:33:60:00:00');

Insert into KeyManage(raspberrypimac, beaconmac) Values('FF:FF:FF:00:00:02', '11:22:33:20:00:00');
Insert into KeyManage(raspberrypimac, beaconmac) Values('FF:FF:FF:00:00:02', '11:22:33:40:00:00');
Insert into KeyManage(raspberrypimac, beaconmac) Values('FF:FF:FF:00:00:02', '11:22:33:60:00:00');

Insert into KeyManage(raspberrypimac, beaconmac) Values('FF:FF:FF:00:00:03', '11:22:33:60:00:00');

Select * From KeyManage
//測定ログ
Delete From DetectiveLog
Select * From DetectiveLog Where raspberrypimac = 'FF:FF:FF:00:00:02' And beaconmac = '11:22:33:40:00:00'
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('11:22:33:00:00:01', '11:22:33:10:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('11:22:33:00:00:02', '11:22:33:20:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('11:22:33:00:00:03', '11:22:33:30:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('11:22:33:00:00:04', '11:22:33:40:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('11:22:33:00:00:05', '11:22:33:50:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('11:22:33:00:00:06', '11:22:33:60:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('11:22:33:00:00:02', '11:22:33:10:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('11:22:33:00:00:04', '11:22:33:20:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('11:22:33:00:00:06', '11:22:33:30:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('11:22:33:00:00:03', '11:22:33:40:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('11:22:33:00:00:05', '11:22:33:50:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('11:22:33:00:00:01', '11:22:33:60:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());

Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('FF:FF:FF:00:00:01', '11:22:33:10:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('FF:FF:FF:00:00:01', '11:22:33:20:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('FF:FF:FF:00:00:01', '11:22:33:30:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('FF:FF:FF:00:00:01', '11:22:33:40:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('FF:FF:FF:00:00:01', '11:22:33:50:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('FF:FF:FF:00:00:01', '11:22:33:60:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());

Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('FF:FF:FF:00:00:02', '11:22:33:10:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('FF:FF:FF:00:00:02', '11:22:33:20:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('FF:FF:FF:00:00:02', '11:22:33:30:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('FF:FF:FF:00:00:02', '11:22:33:40:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('FF:FF:FF:00:00:02', '11:22:33:50:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());
Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('FF:FF:FF:00:00:02', '11:22:33:60:00:00', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());

//セレクト関連
//鍵管理状況表示
Select KeyManageList.ManagerName, KeyManageList.RaspberryPiMac, KeyManageList.BeaconMac, KeyManageList.BeaconName, DetectiveLog_SortResult.RSSI, DetectiveLog_SortResult.DetectiveTime
From (Select A.name As ManagerName, A.raspberrypimac As RaspberryPiMac, B.beaconmac As BeaconMac, C.name As BeaconName
From RaspberryPiManager As A, KeyManage As B, BeaconInfo As C
Where A.raspberrypimac = B.raspberrypimac And B.beaconmac = C.beaconmac) As KeyManageList
Left Outer Join (Select Distinct ON(RaspberryPiMac, BeaconMac) *
From(Select A.raspberrypimac As RaspberryPiMac, B.beaconmac As BeaconMac, C.rssi As RSSI, C.detectivetime As DetectiveTime
From RaspberryPiManager As A, KeyManage As B, DetectiveLog As C
Where A.raspberrypimac = B.raspberrypimac And A.raspberrypimac = C.raspberrypimac And B.beaconmac = C.beaconmac
Order By RaspberryPiMac, RSSI DESC) As DetectiveLog_Result) As DetectiveLog_SortResult
On KeyManageList.RaspberryPiMac = DetectiveLog_SortResult.RaspberryPiMac And KeyManageList.BeaconMac = DetectiveLog_SortResult.BeaconMac

select * from keymanage 
select * from raspberrypimanager 


Select * From KeyMatch
Select * From BeaconInfo
select * from raspberrypiinfo;

//会議室状況表示
Select A.raspberrypimac, A.ipaddress , A.name, B.status, B.starttime, B.endtime, B.updatetime 
from RaspberryPiInfo As A, RaspberryPiStatus As B 
Where A.raspberrypimac = B.raspberrypimac
Order By A.name

//更新プログラム
//DetectiveLogテーブルから一定周期に、ラズベリーパイの状態をアップデートする
//比較元
Select *
From RaspberryPiStatus 

//比較先
Select Distinct ON(RaspberryPiMac, BeaconMac) *
From(Select A.raspberrypimac As RaspberryPiMac, B.beaconmac As BeaconMac, C.rssi As RSSI, C.detectivetime As DetectiveTime
From RaspberryPiInfo As A, KeyMatch As B, DetectiveLog As C
Where A.raspberrypimac = B.raspberrypimac And A.raspberrypimac = C.raspberrypimac And B.beaconmac = C.beaconmac
Order By RaspberryPiMac, RSSI DESC) As DetectiveLog_Result

select * from raspberrypimanager 

select * from keymatch 

select * from beaconinfo 


Insert into DetectiveLog(raspberrypimac, beaconmac, ipaddress, rssi, detectivetime) values('5', '55', '192.168.XXX.XXX', ((Random() * 100)::Integer * (-1)) , now());



//アップデートSQL文（実起動のときはここでnow()ではなく、最新のDetectiveTimeを用いる。また、指定のラズベリーパイのMACはサンプルである）
//RSSIが一定数値以上の場合、ステータスとスタートタイム、更新時間を同時にアップデートする

Update RaspberryPiStatus Set status = True, starttime = now(), endtime = null, updatetime = now() Where raspberrypimac = '11:22:33:00:00:04'

//会議室の使用中が続くのであれば、更新時間のみアップデートする
Update RaspberryPiStatus Set updatetime = now() Where raspberrypimac = '11:22:33:00:00:04'

//会議質の使用中から使用可に変更する場合とDetectiveLog内から履歴が見つからない場合、ステータス、終了時間、更新時間をアップデートする
Update RaspberryPiStatus Set status = False, endtime = now(), updatetime = now() Where raspberrypimac = '11:22:33:00:00:04'

//-----------------------------------------
//検証用（SQL実行しなくても良い）
//-----------------------------------------
Select Distinct ON(RaspberryPiMac, BeaconMac) *
From(Select A.raspberrypimac As RaspberryPiMac, B.beaconmac As BeaconMac, C.rssi As RSSI, C.detectivetime As DetectiveTime
From RaspberryPiManager As A, KeyManage As B, DetectiveLog As C
Where A.raspberrypimac = B.raspberrypimac And A.raspberrypimac = C.raspberrypimac And B.beaconmac = C.beaconmac
Order By RaspberryPiMac, RSSI DESC) As DetectiveLogResult;

Delete From DetectiveLog Where raspberrypimac = 'FF:FF:FF:00:00:02' And beaconmac = '11:22:33:40:00:00'

Select A.name As ManagerName, A.raspberrypimac As RaspberryPiMac, B.beaconmac As BeaconMac, C.name As BeaconName
From RaspberryPiManager As A, KeyManage As B, BeaconInfo As C
Where(A.raspberrypimac = B.raspberrypimac And B.beaconmac = C.beaconmac) 

Select Distinct ON(RaspberryPiMac, BeaconMac) *
From(Select A.raspberrypimac As RaspberryPiMac, B.beaconmac As BeaconMac, C.rssi As RSSI, C.detectivetime As DetectiveTime
From RaspberryPiInfo As A, KeyMatch As B, DetectiveLog As C
Where A.raspberrypimac = B.raspberrypimac And A.raspberrypimac = C.raspberrypimac And B.beaconmac = C.beaconmac
Order By RaspberryPiMac, RSSI DESC) As DetectiveLog_Result

-- conf room
Select A.name As RaspberryPiName, A.raspberrypimac As RaspberryPiMac, B.beaconmac As BeaconMac
From RaspberryPiInfo As A, KeyMatch As B
Where A.raspberrypimac = B.raspberrypimac
Order By RaspberryPiName;

Select *
From RaspberryPiInfo


-- manager
Select KeyManageList.ManagerName, KeyManageList.RaspberryPiMac, KeyManageList.BeaconMac, KeyManageList.BeaconName, DetectiveLog_SortResult.RSSI, DetectiveLog_SortResult.DetectiveTime
From (Select A.name As ManagerName, A.raspberrypimac As RaspberryPiMac, B.beaconmac As BeaconMac, C.name As BeaconName
From RaspberryPiManager As A, KeyManage As B, BeaconInfo As C
Where A.raspberrypimac = B.raspberrypimac And B.beaconmac = C.beaconmac) As KeyManageList
Left Outer Join (Select Distinct ON(RaspberryPiMac, BeaconMac) *
From(Select A.raspberrypimac As RaspberryPiMac, B.beaconmac As BeaconMac, C.rssi As RSSI, C.detectivetime As DetectiveTime
From RaspberryPiManager As A, KeyManage As B, DetectiveLog As C
Where A.raspberrypimac = B.raspberrypimac And A.raspberrypimac = C.raspberrypimac And B.beaconmac = C.beaconmac
Order By RaspberryPiMac, RSSI DESC) As DetectiveLog_Result) As DetectiveLog_SortResult
On KeyManageList.RaspberryPiMac = DetectiveLog_SortResult.RaspberryPiMac And KeyManageList.BeaconMac = DetectiveLog_SortResult.BeaconMac


Select * 
From KeyMatch

select * from detectivelog

