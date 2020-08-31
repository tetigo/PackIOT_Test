/* ---------------------------------------------------------------------- */
/* Setting Local Time Zone                                                */
/* ---------------------------------------------------------------------- */

SET timezone = 'America/Sao_Paulo';

/* ---------------------------------------------------------------------- */
/* Reseting Primary Keys                                                  */
/* ---------------------------------------------------------------------- */

ALTER SEQUENCE values_id_seq RESTART WITH 1;
ALTER SEQUENCE shifts_id_seq RESTART WITH 1;
ALTER SEQUENCE machines_id_seq RESTART WITH 1;
ALTER SEQUENCE counters_id_seq RESTART WITH 1;

/* ---------------------------------------------------------------------- */
/* Creating Counters                                                      */
/* ---------------------------------------------------------------------- */

INSERT INTO counters(code) VALUES ('COUNTER123');
INSERT INTO counters(code) VALUES ('COUNTERFFF');
INSERT INTO counters(code) VALUES ('COUNTERABC');

/* ---------------------------------------------------------------------- */
/* Creating Machines                                                      */
/* ---------------------------------------------------------------------- */
INSERT INTO machines(code, counter) VALUES ('PRESS', 1);
INSERT INTO machines(code, counter) VALUES ('XPTO', 2);
INSERT INTO machines(code, counter) VALUES ('BOZO', 3);

/* ---------------------------------------------------------------------- */
/* Creating Shifts                                                        */
/* ---------------------------------------------------------------------- */

INSERT INTO shifts(code, machine, hour_start, hour_end) VALUES ('MORNING1', 1, '07:00:00', '15:00:00');
INSERT INTO shifts(code, machine, hour_start, hour_end) VALUES ('AFTERNOON1', 1, '15:00:00', '23:00:00');
INSERT INTO shifts(code, machine, hour_start, hour_end) VALUES ('NIGHT1', 1, '23:00:00', '07:00:00');

INSERT INTO shifts(code, machine, hour_start, hour_end) VALUES ('MORNING2', 2, '07:00:00', '15:00:00');
INSERT INTO shifts(code, machine, hour_start, hour_end) VALUES ('AFTERNOON2', 2, '15:00:00', '23:00:00');
INSERT INTO shifts(code, machine, hour_start, hour_end) VALUES ('NIGHT2', 2, '23:00:00', '07:00:00');

INSERT INTO shifts(code, machine, hour_start, hour_end) VALUES ('MORNING3', 3, '07:00:00', '15:00:00');
INSERT INTO shifts(code, machine, hour_start, hour_end) VALUES ('AFTERNOON3', 3, '15:00:00', '23:00:00');
INSERT INTO shifts(code, machine, hour_start, hour_end) VALUES ('NIGHT3', 3, '23:00:00', '07:00:00');


/* ---------------------------------------------------------------------- */
/* Creating Values                                                        */
/* ---------------------------------------------------------------------- */

/* 5 ENTRIES AT MORNING ON PRESS MACHINE SAME DAY = INTERVAL 1*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-30 07:10:25', 1, 1500);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-30 07:11:25', 1, 1490);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-30 07:12:25', 1, 1540);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-30 07:13:25', 1, 1503);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-30 07:14:25', 1, 1551);

/* 5 ENTRIES AT AFTERNOON ON PRESS MACHINE SAME DAY = INTERVAL 1*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-30 19:10:25', 1, 1500);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-30 19:11:25', 1, 1490);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-30 19:12:25', 1, 1540);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-30 19:13:25', 1, 1503);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-30 19:14:25', 1, 1551);

/* 3 ENTRIES AT MORNING ON PRESS MACHINE 1 DAY BEFORE = INTERVAL 2*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-29 08:14:25', 1, 1254);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-29 08:15:25', 1, 1354);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-29 08:16:25', 1, 1454);

/* 3 ENTRIES AT NIGHT ON PRESS MACHINE 2 DAYS BEFORE = INTERVAL 3*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-28 23:14:25', 1, 2152);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-28 23:15:25', 1, 2153);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-28 01:16:25', 1, 2154);

/* 1 ENTRY AT MORNING ON PRESS MACHINE 2 DAY BEFORE = INTERVAL 3*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-28 08:14:25', 1, 1254);

/* 2 ENTRIES AT NIGHT ON PRESS MACHINE 3 DAYS BEFORE = INTERVAL 4*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-27 23:14:25', 1, 2152);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-27 23:15:25', 1, 2153);

/* 2 ENTRIES AT MORNING ON PRESS MACHINE 3 DAYS BEFORE = INTERVAL 4*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-27 09:14:25', 1, 2152);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-27 09:15:25', 1, 2153);

/* 2 ENTRIES AT AFTERNOON ON PRESS MACHINE 4 DAYS BEFORE = INTERVAL 5*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-26 18:14:25', 1, 21752);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-26 18:15:25', 1, 21753);

/* 2 ENTRIES AT MORNING ON PRESS MACHINE 4 DAYS BEFORE = INTERVAL 5*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-26 08:14:25', 1, 21752);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-26 08:15:25', 1, 21753);

/* 2 ENTRIES AT MORNING ON PRESS MACHINE 5 DAYS BEFORE = INTERVAL 6*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-25 09:14:25', 1, 2752);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-25 09:15:25', 1, 2753);

/* 2 ENTRIES AT MORNING ON PRESS MACHINE 6 DAYS BEFORE = INTERVAL 7*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-24 09:14:25', 1, 752);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-24 09:15:25', 1, 753);

/* 1 ENTRY AT NIGHT ON PRESS MACHINE 6 DAYS BEFORE = INTERVAL 7*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-24 23:14:25', 1, 752);

/* 2 ENTRIES AT MORNING ON PRESS MACHINE 7 DAYS BEFORE = INTERVAL 8*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-23 09:14:25', 1, 1557);
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-23 10:14:25', 1, 1557);

/* 1 ENTRY AT AFTERNOON ON PRESS MACHINE 7 DAYS BEFORE = INTERVAL 8*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-23 17:15:25', 1, 1558);

/* 1 ENTRY AT MORNING ON PRESS MACHINE 8 DAYS BEFORE = INTERVAL 9*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-22 07:15:25', 1, 1559);

/* 1 ENTRY AT AFTERNOON ON PRESS MACHINE 8 DAYS BEFORE = INTERVAL 9*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-22 18:15:25', 1, 1578);

/* 1 ENTRY AT MORNING ON BOZO MACHINE 20 DAYS BEFORE = INTERVAL 21*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-10 10:30:25', 3, 1577);

/* 1 ENTRY AT MORNING ON XPTO MACHINE SAME DAY = INTERVAL 1*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-30 10:30:25', 2, 1444);

/* 1 ENTRY AT NIGHT ON XPTO MACHINE SAME DAY = INTERVAL 1*/
INSERT INTO "values"(timestamp_value, id, value) VALUES('2020-08-30 23:30:25', 2, 1456);


