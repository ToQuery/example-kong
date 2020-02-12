/*
 Navicat Premium Data Transfer

 Source Server         : localhost_5432
 Source Server Type    : PostgreSQL
 Source Server Version : 90616
 Source Host           : localhost:5432
 Source Catalog        : konga
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90616
 File Encoding         : 65001

 Date: 12/02/2020 20:59:17
*/


-- ----------------------------
-- Table structure for konga_api_health_checks
-- ----------------------------
DROP TABLE IF EXISTS "public"."konga_api_health_checks";
CREATE TABLE "public"."konga_api_health_checks" (
  "id" int4 NOT NULL DEFAULT nextval('konga_api_health_checks_id_seq'::regclass),
  "api_id" text COLLATE "pg_catalog"."default",
  "api" json,
  "health_check_endpoint" text COLLATE "pg_catalog"."default",
  "notification_endpoint" text COLLATE "pg_catalog"."default",
  "active" bool,
  "data" json,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6),
  "createdUserId" int4,
  "updatedUserId" int4
)
;
ALTER TABLE "public"."konga_api_health_checks" OWNER TO "kong";

-- ----------------------------
-- Table structure for konga_email_transports
-- ----------------------------
DROP TABLE IF EXISTS "public"."konga_email_transports";
CREATE TABLE "public"."konga_email_transports" (
  "id" int4 NOT NULL DEFAULT nextval('konga_email_transports_id_seq'::regclass),
  "name" text COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "schema" json,
  "settings" json,
  "active" bool,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6),
  "createdUserId" int4,
  "updatedUserId" int4
)
;
ALTER TABLE "public"."konga_email_transports" OWNER TO "kong";

-- ----------------------------
-- Table structure for konga_kong_nodes
-- ----------------------------
DROP TABLE IF EXISTS "public"."konga_kong_nodes";
CREATE TABLE "public"."konga_kong_nodes" (
  "id" int4 NOT NULL DEFAULT nextval('konga_kong_nodes_id_seq'::regclass),
  "name" text COLLATE "pg_catalog"."default",
  "type" text COLLATE "pg_catalog"."default",
  "kong_admin_url" text COLLATE "pg_catalog"."default",
  "netdata_url" text COLLATE "pg_catalog"."default",
  "kong_api_key" text COLLATE "pg_catalog"."default",
  "jwt_algorithm" text COLLATE "pg_catalog"."default",
  "jwt_key" text COLLATE "pg_catalog"."default",
  "jwt_secret" text COLLATE "pg_catalog"."default",
  "kong_version" text COLLATE "pg_catalog"."default",
  "health_checks" bool,
  "health_check_details" json,
  "active" bool,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6),
  "createdUserId" int4,
  "updatedUserId" int4
)
;
ALTER TABLE "public"."konga_kong_nodes" OWNER TO "kong";

-- ----------------------------
-- Table structure for konga_kong_services
-- ----------------------------
DROP TABLE IF EXISTS "public"."konga_kong_services";
CREATE TABLE "public"."konga_kong_services" (
  "id" int4 NOT NULL DEFAULT nextval('konga_kong_services_id_seq'::regclass),
  "service_id" text COLLATE "pg_catalog"."default",
  "kong_node_id" text COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "tags" json,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6),
  "createdUserId" int4,
  "updatedUserId" int4
)
;
ALTER TABLE "public"."konga_kong_services" OWNER TO "kong";

-- ----------------------------
-- Table structure for konga_kong_snapshot_schedules
-- ----------------------------
DROP TABLE IF EXISTS "public"."konga_kong_snapshot_schedules";
CREATE TABLE "public"."konga_kong_snapshot_schedules" (
  "id" int4 NOT NULL DEFAULT nextval('konga_kong_snapshot_schedules_id_seq'::regclass),
  "connection" int4,
  "active" bool,
  "cron" text COLLATE "pg_catalog"."default",
  "lastRunAt" date,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6),
  "createdUserId" int4,
  "updatedUserId" int4
)
;
ALTER TABLE "public"."konga_kong_snapshot_schedules" OWNER TO "kong";

-- ----------------------------
-- Table structure for konga_kong_snapshots
-- ----------------------------
DROP TABLE IF EXISTS "public"."konga_kong_snapshots";
CREATE TABLE "public"."konga_kong_snapshots" (
  "id" int4 NOT NULL DEFAULT nextval('konga_kong_snapshots_id_seq'::regclass),
  "name" text COLLATE "pg_catalog"."default",
  "kong_node_name" text COLLATE "pg_catalog"."default",
  "kong_node_url" text COLLATE "pg_catalog"."default",
  "kong_version" text COLLATE "pg_catalog"."default",
  "data" json,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6),
  "createdUserId" int4,
  "updatedUserId" int4
)
;
ALTER TABLE "public"."konga_kong_snapshots" OWNER TO "kong";

-- ----------------------------
-- Table structure for konga_kong_upstream_alerts
-- ----------------------------
DROP TABLE IF EXISTS "public"."konga_kong_upstream_alerts";
CREATE TABLE "public"."konga_kong_upstream_alerts" (
  "id" int4 NOT NULL DEFAULT nextval('konga_kong_upstream_alerts_id_seq'::regclass),
  "upstream_id" text COLLATE "pg_catalog"."default",
  "connection" int4,
  "email" bool,
  "slack" bool,
  "cron" text COLLATE "pg_catalog"."default",
  "active" bool,
  "data" json,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6),
  "createdUserId" int4,
  "updatedUserId" int4
)
;
ALTER TABLE "public"."konga_kong_upstream_alerts" OWNER TO "kong";

-- ----------------------------
-- Table structure for konga_netdata_connections
-- ----------------------------
DROP TABLE IF EXISTS "public"."konga_netdata_connections";
CREATE TABLE "public"."konga_netdata_connections" (
  "id" int4 NOT NULL DEFAULT nextval('konga_netdata_connections_id_seq'::regclass),
  "apiId" text COLLATE "pg_catalog"."default",
  "url" text COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6),
  "createdUserId" int4,
  "updatedUserId" int4
)
;
ALTER TABLE "public"."konga_netdata_connections" OWNER TO "kong";

-- ----------------------------
-- Table structure for konga_passports
-- ----------------------------
DROP TABLE IF EXISTS "public"."konga_passports";
CREATE TABLE "public"."konga_passports" (
  "id" int4 NOT NULL DEFAULT nextval('konga_passports_id_seq'::regclass),
  "protocol" text COLLATE "pg_catalog"."default",
  "password" text COLLATE "pg_catalog"."default",
  "provider" text COLLATE "pg_catalog"."default",
  "identifier" text COLLATE "pg_catalog"."default",
  "tokens" json,
  "user" int4,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6)
)
;
ALTER TABLE "public"."konga_passports" OWNER TO "kong";

-- ----------------------------
-- Table structure for konga_settings
-- ----------------------------
DROP TABLE IF EXISTS "public"."konga_settings";
CREATE TABLE "public"."konga_settings" (
  "id" int4 NOT NULL DEFAULT nextval('konga_settings_id_seq'::regclass),
  "data" json,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6),
  "createdUserId" int4,
  "updatedUserId" int4
)
;
ALTER TABLE "public"."konga_settings" OWNER TO "kong";

-- ----------------------------
-- Table structure for konga_users
-- ----------------------------
DROP TABLE IF EXISTS "public"."konga_users";
CREATE TABLE "public"."konga_users" (
  "id" int4 NOT NULL DEFAULT nextval('konga_users_id_seq'::regclass),
  "username" text COLLATE "pg_catalog"."default",
  "email" text COLLATE "pg_catalog"."default",
  "firstName" text COLLATE "pg_catalog"."default",
  "lastName" text COLLATE "pg_catalog"."default",
  "admin" bool,
  "node_id" text COLLATE "pg_catalog"."default",
  "active" bool,
  "activationToken" text COLLATE "pg_catalog"."default",
  "node" int4,
  "createdAt" timestamptz(6),
  "updatedAt" timestamptz(6),
  "createdUserId" int4,
  "updatedUserId" int4
)
;
ALTER TABLE "public"."konga_users" OWNER TO "kong";

-- ----------------------------
-- Uniques structure for table konga_api_health_checks
-- ----------------------------
ALTER TABLE "public"."konga_api_health_checks" ADD CONSTRAINT "konga_api_health_checks_api_id_key" UNIQUE ("api_id");

-- ----------------------------
-- Primary Key structure for table konga_api_health_checks
-- ----------------------------
ALTER TABLE "public"."konga_api_health_checks" ADD CONSTRAINT "konga_api_health_checks_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table konga_email_transports
-- ----------------------------
ALTER TABLE "public"."konga_email_transports" ADD CONSTRAINT "konga_email_transports_name_key" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table konga_email_transports
-- ----------------------------
ALTER TABLE "public"."konga_email_transports" ADD CONSTRAINT "konga_email_transports_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table konga_kong_nodes
-- ----------------------------
ALTER TABLE "public"."konga_kong_nodes" ADD CONSTRAINT "konga_kong_nodes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table konga_kong_services
-- ----------------------------
ALTER TABLE "public"."konga_kong_services" ADD CONSTRAINT "konga_kong_services_service_id_key" UNIQUE ("service_id");

-- ----------------------------
-- Primary Key structure for table konga_kong_services
-- ----------------------------
ALTER TABLE "public"."konga_kong_services" ADD CONSTRAINT "konga_kong_services_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table konga_kong_snapshot_schedules
-- ----------------------------
ALTER TABLE "public"."konga_kong_snapshot_schedules" ADD CONSTRAINT "konga_kong_snapshot_schedules_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table konga_kong_snapshots
-- ----------------------------
ALTER TABLE "public"."konga_kong_snapshots" ADD CONSTRAINT "konga_kong_snapshots_name_key" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table konga_kong_snapshots
-- ----------------------------
ALTER TABLE "public"."konga_kong_snapshots" ADD CONSTRAINT "konga_kong_snapshots_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table konga_kong_upstream_alerts
-- ----------------------------
ALTER TABLE "public"."konga_kong_upstream_alerts" ADD CONSTRAINT "konga_kong_upstream_alerts_upstream_id_key" UNIQUE ("upstream_id");

-- ----------------------------
-- Primary Key structure for table konga_kong_upstream_alerts
-- ----------------------------
ALTER TABLE "public"."konga_kong_upstream_alerts" ADD CONSTRAINT "konga_kong_upstream_alerts_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table konga_netdata_connections
-- ----------------------------
ALTER TABLE "public"."konga_netdata_connections" ADD CONSTRAINT "konga_netdata_connections_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table konga_passports
-- ----------------------------
ALTER TABLE "public"."konga_passports" ADD CONSTRAINT "konga_passports_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table konga_settings
-- ----------------------------
ALTER TABLE "public"."konga_settings" ADD CONSTRAINT "konga_settings_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table konga_users
-- ----------------------------
ALTER TABLE "public"."konga_users" ADD CONSTRAINT "konga_users_username_key" UNIQUE ("username");
ALTER TABLE "public"."konga_users" ADD CONSTRAINT "konga_users_email_key" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table konga_users
-- ----------------------------
ALTER TABLE "public"."konga_users" ADD CONSTRAINT "konga_users_pkey" PRIMARY KEY ("id");
