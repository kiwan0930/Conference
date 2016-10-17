Create Table RaspberryPiMessage(
	message varchar,
	raspberrypimac Varchar  ,
	hostname Varchar ,
	ipaddress Varchar , 
	updatetime Timestamp default now()
);