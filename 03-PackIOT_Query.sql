/* ---------------------------------------------------------------------- */
/* HELPER VIEWS                                                           */
/* ---------------------------------------------------------------------- */
DROP VIEW IF EXISTS PRESS_MACHINE_AT_MORNING;
DROP VIEW IF EXISTS PRESS_MACHINE_AT_AFTERNOON;
DROP VIEW IF EXISTS PRESS_MACHINE_AT_NIGHT;

DROP VIEW IF EXISTS SUMS_PRESS_MACHINE_AT_MORNING_LAST_7_DAYS;
DROP VIEW IF EXISTS SUMS_PRESS_MACHINE_AT_AFTERNOON_LAST_7_DAYS;
DROP VIEW IF EXISTS SUMS_PRESS_MACHINE_AT_NIGHT_LAST_7_DAYS;



CREATE VIEW PRESS_MACHINE_AT_MORNING as (
SELECT shifts.id as shifts_id, shifts.code as shifts_code, shifts.machine as shifts_machine, shifts.hour_start as shifts_hour_start, shifts.hour_end as shifts_hour_end,
machines.id as machines_id, machines.code as machines_code, machines.counter as machines_counter, 
counters.id as counters_id, counters.code as counters_code 
FROM shifts
INNER JOIN machines ON machines.id = shifts.machine
INNER JOIN counters ON counters.id = machines.counter
WHERE machines.code = 'PRESS'
AND shifts.code = 'MORNING1' 
);

CREATE VIEW PRESS_MACHINE_AT_AFTERNOON as (
SELECT shifts.id as shifts_id, shifts.code as shifts_code, shifts.machine as shifts_machine, shifts.hour_start as shifts_hour_start, shifts.hour_end as shifts_hour_end,
machines.id as machines_id, machines.code as machines_code, machines.counter as machines_counter, 
counters.id as counters_id, counters.code as counters_code 
FROM shifts
INNER JOIN machines ON machines.id = shifts.machine
INNER JOIN counters ON counters.id = machines.counter
WHERE machines.code = 'PRESS'
AND shifts.code = 'AFTERNOON1' 
);

CREATE VIEW PRESS_MACHINE_AT_NIGHT as (
SELECT shifts.id as shifts_id, shifts.code as shifts_code, shifts.machine as shifts_machine, shifts.hour_start as shifts_hour_start, shifts.hour_end as shifts_hour_end,
machines.id as machines_id, machines.code as machines_code, machines.counter as machines_counter, 
counters.id as counters_id, counters.code as counters_code 
FROM shifts
INNER JOIN machines ON machines.id = shifts.machine
INNER JOIN counters ON counters.id = machines.counter
WHERE machines.code = 'PRESS'
AND shifts.code = 'NIGHT1' 
);


/* ---------------------------------------------------------------------- */
/* VIEWS FOR SUMS PER DAY ON PRESS MACHINE IN THE LAST 7 DAYS             */
/* ---------------------------------------------------------------------- */

CREATE VIEW SUMS_PRESS_MACHINE_AT_MORNING_LAST_7_DAYS as(
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_MORNING
on "values".id = PRESS_MACHINE_AT_MORNING.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '1 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_MORNING
on "values".id = PRESS_MACHINE_AT_MORNING.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '2 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_MORNING
on "values".id = PRESS_MACHINE_AT_MORNING.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '3 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_MORNING
on "values".id = PRESS_MACHINE_AT_MORNING.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '4 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_MORNING
on "values".id = PRESS_MACHINE_AT_MORNING.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '5 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_MORNING
on "values".id = PRESS_MACHINE_AT_MORNING.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '6 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_MORNING
on "values".id = PRESS_MACHINE_AT_MORNING.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '7 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
);


CREATE VIEW SUMS_PRESS_MACHINE_AT_AFTERNOON_LAST_7_DAYS as(
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_AFTERNOON
on "values".id = PRESS_MACHINE_AT_AFTERNOON.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '1 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_AFTERNOON
on "values".id = PRESS_MACHINE_AT_AFTERNOON.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '2 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_AFTERNOON
on "values".id = PRESS_MACHINE_AT_AFTERNOON.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '3 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_AFTERNOON
on "values".id = PRESS_MACHINE_AT_AFTERNOON.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '4 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_AFTERNOON
on "values".id = PRESS_MACHINE_AT_AFTERNOON.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '5 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_AFTERNOON
on "values".id = PRESS_MACHINE_AT_AFTERNOON.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '6 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_AFTERNOON
on "values".id = PRESS_MACHINE_AT_AFTERNOON.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '7 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
);


CREATE VIEW SUMS_PRESS_MACHINE_AT_NIGHT_LAST_7_DAYS as(
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_NIGHT
on "values".id = PRESS_MACHINE_AT_NIGHT.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '1 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + 1 + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_NIGHT
on "values".id = PRESS_MACHINE_AT_NIGHT.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '2 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + 1 + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_NIGHT
on "values".id = PRESS_MACHINE_AT_NIGHT.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '3 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + 1 + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_NIGHT
on "values".id = PRESS_MACHINE_AT_NIGHT.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '4 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + 1 + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_NIGHT
on "values".id = PRESS_MACHINE_AT_NIGHT.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '5 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + 1 + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_NIGHT
on "values".id = PRESS_MACHINE_AT_NIGHT.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '6 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + 1 + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
UNION
select to_char(cast("values".timestamp_value as date), 'YYYY-MM-DD') as date, SUM("values".value), shifts_code, shifts_hour_start, shifts_hour_end
FROM "values"
INNER JOIN PRESS_MACHINE_AT_NIGHT
on "values".id = PRESS_MACHINE_AT_NIGHT.counters_id
where cast("values".timestamp_value as date) = (current_date - interval '7 day') 
and "values".timestamp_value BETWEEN (cast("values".timestamp_value as date) + shifts_hour_start) and (cast("values".timestamp_value as date) + 1 + shifts_hour_end)
GROUP BY (cast("values".timestamp_value as date), shifts_code, shifts_hour_start, shifts_hour_end)
);


/* ---------------------------------------------------------------------------------- */
/* RESULTING SUMS PER DAY OF THE PRESS MACHINE SEPARATED BY SHIFTS IN THE LAST 7 DAYS */
/* ---------------------------------------------------------------------------------- */

SELECT * FROM SUMS_PRESS_MACHINE_AT_MORNING_LAST_7_DAYS
UNION
SELECT * FROM SUMS_PRESS_MACHINE_AT_AFTERNOON_LAST_7_DAYS
UNION
SELECT * FROM SUMS_PRESS_MACHINE_AT_NIGHT_LAST_7_DAYS;




