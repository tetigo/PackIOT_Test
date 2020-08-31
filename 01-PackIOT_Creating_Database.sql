/* --------------------------------------------------------------------------- */
/* Add tables removing them first if exists                                    */
/* --------------------------------------------------------------------------- */

ALTER TABLE IF EXISTS machines DROP CONSTRAINT machines_counters;
ALTER TABLE IF EXISTS "values" DROP CONSTRAINT values_counters;
ALTER TABLE IF EXISTS shifts DROP CONSTRAINT shifts_machines;

DROP TABLE IF EXISTS "values";
DROP TABLE IF EXISTS shifts;
DROP TABLE IF EXISTS machines;
DROP TABLE IF EXISTS counters;

/* ---------------------------------------------------------------------- */
/* Setting Local Time Zone                                                */
/* ---------------------------------------------------------------------- */

SET timezone = 'America/Sao_Paulo';

/* ---------------------------------------------------------------------- */
/* Add table "machines"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE machines (
    id SERIAL PRIMARY KEY,
    code VARCHAR(255) UNIQUE NOT NULL,
    counter INTEGER  NOT NULL
);

/* ---------------------------------------------------------------------- */
/* Add table "shifts"                                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE shifts (
    id SERIAL PRIMARY KEY,
    code VARCHAR(255) UNIQUE NOT NULL,
    machine INTEGER  NOT NULL,
    hour_start TIME  NOT NULL,
    hour_end TIME  NOT NULL
);

/* ---------------------------------------------------------------------- */
/* Add table "counters"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE counters (
    id SERIAL PRIMARY KEY,
    code VARCHAR(255) UNIQUE NOT NULL
);

/* ---------------------------------------------------------------------- */
/* Add table "values"                                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE values (
    timestamp_value TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    value INTEGER NOT NULL,
    id SERIAL,
    PRIMARY KEY (timestamp_value, id)
);

/* ---------------------------------------------------------------------- */
/* Add foreign key constraints                                            */
/* ---------------------------------------------------------------------- */

ALTER TABLE machines ADD CONSTRAINT machines_counters 
    FOREIGN KEY (counter) REFERENCES counters (id);

ALTER TABLE values ADD CONSTRAINT values_counters 
    FOREIGN KEY (id) REFERENCES counters (id);

ALTER TABLE shifts ADD CONSTRAINT shifts_machines 
    FOREIGN KEY (machine) REFERENCES machines (id);


