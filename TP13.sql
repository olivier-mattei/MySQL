SHOW DATABASES;
USE ws_meteo;
SHOW TABLES ;
SELECT * FROM ws_station;
SELECT ws_id FROM ws_aprs; 
SELECT SPD FROM ws_aprs WHERE SPD BETWEEN 30 AND 40 ;
SELECT MAX(T) FROM ws_aprs ;
SELECT * FROM ws_aprs ;
SELECT * from ws_aprs WHERE RIGHT(date_aprs,4) BETWEEN 0800 AND 0900;
SELECT ws_id, ROUND( AVG(SPD*1.609), 1) AS 'Km/h' FROM ws_aprs GROUP BY ws_id;
SELECT ws_id, ROUND (AVG(SPD*1.609),1) AS 'Km/h' FROM ws_aprs  WHERE RIGHT(date_aprs,4) BETWEEN 0800 AND 1200 GROUP BY ws_id ;
SELECT * FROM ws_aprs WHERE ws_id = (SELECT ws_id FROM ws_station WHERE nom='AIX2');
SELECT wa.ws_id,date_aprs,T,nom FROM ws_aprs wa,ws_station wst WHERE wa.ws_id=wst.ws_id AND T = (SELECT MAX(T) FROM ws_aprs);
DELETE FROM ws_station WHERE ws_id = 'GT7955TS';
INSERT INTO ws_station(ws_id,ws_lat, ws_long, nom) VALUES("GT7955TS","43.395161", "5.594659", "La Bouilladisse");
INSERT INTO ws_aprs (ws_id,date_aprs,dir,spd,g,t,r,p,pm,h,b) VALUES ("GT7955TS", "140815", "280" , "43,4", "55,8", "41,6", "0", "0", "0", "70", "1010");
SELECT T, date_aprs, nom FROM ws_aprs wa, ws_station wst WHERE wa.ws_id=wst.ws_id AND T = (SELECT MAX(T) FROM ws_aprs );