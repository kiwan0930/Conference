Create Table DetectiveLog(
	raspberrypimac Varchar ,
	hostname Varchar ,
	beaconmac Varchar ,
	ipaddress Varchar,
	uuid Varchar ,
	major Integer ,
	minor Integer ,
	crssi Integer ,
	rssi Integer ,
	detectivetime Timestamp default now()
);