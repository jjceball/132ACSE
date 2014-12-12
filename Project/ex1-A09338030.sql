/*
Jay Ceballos
A09338030
*/

-- 1

CREATE DATABASE CSE132AProject;

-- Table: band

-- DROP TABLE band;

CREATE TABLE band
(
  "bandID" integer NOT NULL,
  "bandName" character(100),
  genre character(100),
  year integer,
  CONSTRAINT "bandID" PRIMARY KEY ("bandID"),
  CONSTRAINT "> 1900" CHECK (year > 1900)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE band
  OWNER TO postgres;

-- Table: "bandMember"

-- DROP TABLE "bandMember";

CREATE TABLE "bandMember"
(
  "memID" integer NOT NULL,
  "memName" character(100),
  "bandID" integer,
  nationality character(100) NOT NULL,
  CONSTRAINT "memID" PRIMARY KEY ("memID"),
  CONSTRAINT "bandMember to band" FOREIGN KEY ("bandID")
      REFERENCES band ("bandID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "bandMember"
  OWNER TO postgres;

-- Index: "fki_bandMember to band"

-- DROP INDEX "fki_bandMember to band";

CREATE INDEX "fki_bandMember to band"
  ON "bandMember"
  USING btree
  ("bandID");

-- Table: fan

-- DROP TABLE fan;

CREATE TABLE fan
(
  "fanID" integer NOT NULL,
  "fanName" character(100),
  CONSTRAINT "fanID" PRIMARY KEY ("fanID")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE fan
  OWNER TO postgres;

-- Table: likes

-- DROP TABLE likes;

CREATE TABLE likes
(
  "fanID" integer NOT NULL,
  "bandID" integer NOT NULL,
  CONSTRAINT "fan/bandID" PRIMARY KEY ("fanID", "bandID"),
  CONSTRAINT "bandID to bandID" FOREIGN KEY ("bandID")
      REFERENCES band ("bandID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "fanID to fanID" FOREIGN KEY ("fanID")
      REFERENCES fan ("fanID") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE likes
  OWNER TO postgres;

-- Index: "fki_bandID to bandID"

-- DROP INDEX "fki_bandID to bandID";

CREATE INDEX "fki_bandID to bandID"
  ON likes
  USING btree
  ("bandID");


