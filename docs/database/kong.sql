/*
 Navicat Premium Data Transfer

 Source Server         : localhost_5432
 Source Server Type    : PostgreSQL
 Source Server Version : 90616
 Source Host           : localhost:5432
 Source Catalog        : kong
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90616
 File Encoding         : 65001

 Date: 12/02/2020 20:44:13
*/


-- ----------------------------
-- Table structure for acls
-- ----------------------------
DROP TABLE IF EXISTS "public"."acls";
CREATE TABLE "public"."acls" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(0) with time zone),
  "consumer_id" uuid,
  "group" text COLLATE "pg_catalog"."default",
  "cache_key" text COLLATE "pg_catalog"."default",
  "tags" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."acls" OWNER TO "kong";

-- ----------------------------
-- Table structure for basicauth_credentials
-- ----------------------------
DROP TABLE IF EXISTS "public"."basicauth_credentials";
CREATE TABLE "public"."basicauth_credentials" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(0) with time zone),
  "consumer_id" uuid,
  "username" text COLLATE "pg_catalog"."default",
  "password" text COLLATE "pg_catalog"."default",
  "tags" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."basicauth_credentials" OWNER TO "kong";

-- ----------------------------
-- Table structure for ca_certificates
-- ----------------------------
DROP TABLE IF EXISTS "public"."ca_certificates";
CREATE TABLE "public"."ca_certificates" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(0) with time zone),
  "cert" text COLLATE "pg_catalog"."default" NOT NULL,
  "tags" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."ca_certificates" OWNER TO "kong";

-- ----------------------------
-- Table structure for certificates
-- ----------------------------
DROP TABLE IF EXISTS "public"."certificates";
CREATE TABLE "public"."certificates" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(0) with time zone),
  "cert" text COLLATE "pg_catalog"."default",
  "key" text COLLATE "pg_catalog"."default",
  "tags" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."certificates" OWNER TO "kong";

-- ----------------------------
-- Table structure for cluster_events
-- ----------------------------
DROP TABLE IF EXISTS "public"."cluster_events";
CREATE TABLE "public"."cluster_events" (
  "id" uuid NOT NULL,
  "node_id" uuid NOT NULL,
  "at" timestamptz(6) NOT NULL,
  "nbf" timestamptz(6),
  "expire_at" timestamptz(6) NOT NULL,
  "channel" text COLLATE "pg_catalog"."default",
  "data" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."cluster_events" OWNER TO "kong";

-- ----------------------------
-- Table structure for consumers
-- ----------------------------
DROP TABLE IF EXISTS "public"."consumers";
CREATE TABLE "public"."consumers" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(0) with time zone),
  "username" text COLLATE "pg_catalog"."default",
  "custom_id" text COLLATE "pg_catalog"."default",
  "tags" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."consumers" OWNER TO "kong";

-- ----------------------------
-- Table structure for hmacauth_credentials
-- ----------------------------
DROP TABLE IF EXISTS "public"."hmacauth_credentials";
CREATE TABLE "public"."hmacauth_credentials" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(0) with time zone),
  "consumer_id" uuid,
  "username" text COLLATE "pg_catalog"."default",
  "secret" text COLLATE "pg_catalog"."default",
  "tags" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."hmacauth_credentials" OWNER TO "kong";

-- ----------------------------
-- Table structure for jwt_secrets
-- ----------------------------
DROP TABLE IF EXISTS "public"."jwt_secrets";
CREATE TABLE "public"."jwt_secrets" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(0) with time zone),
  "consumer_id" uuid,
  "key" text COLLATE "pg_catalog"."default",
  "secret" text COLLATE "pg_catalog"."default",
  "algorithm" text COLLATE "pg_catalog"."default",
  "rsa_public_key" text COLLATE "pg_catalog"."default",
  "tags" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."jwt_secrets" OWNER TO "kong";

-- ----------------------------
-- Table structure for keyauth_credentials
-- ----------------------------
DROP TABLE IF EXISTS "public"."keyauth_credentials";
CREATE TABLE "public"."keyauth_credentials" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(0) with time zone),
  "consumer_id" uuid,
  "key" text COLLATE "pg_catalog"."default",
  "tags" text[] COLLATE "pg_catalog"."default",
  "ttl" timestamptz(6)
)
;
ALTER TABLE "public"."keyauth_credentials" OWNER TO "kong";

-- ----------------------------
-- Table structure for locks
-- ----------------------------
DROP TABLE IF EXISTS "public"."locks";
CREATE TABLE "public"."locks" (
  "key" text COLLATE "pg_catalog"."default" NOT NULL,
  "owner" text COLLATE "pg_catalog"."default",
  "ttl" timestamptz(6)
)
;
ALTER TABLE "public"."locks" OWNER TO "kong";

-- ----------------------------
-- Table structure for oauth2_authorization_codes
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2_authorization_codes";
CREATE TABLE "public"."oauth2_authorization_codes" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(0) with time zone),
  "credential_id" uuid,
  "service_id" uuid,
  "code" text COLLATE "pg_catalog"."default",
  "authenticated_userid" text COLLATE "pg_catalog"."default",
  "scope" text COLLATE "pg_catalog"."default",
  "ttl" timestamptz(6)
)
;
ALTER TABLE "public"."oauth2_authorization_codes" OWNER TO "kong";

-- ----------------------------
-- Table structure for oauth2_credentials
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2_credentials";
CREATE TABLE "public"."oauth2_credentials" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(0) with time zone),
  "name" text COLLATE "pg_catalog"."default",
  "consumer_id" uuid,
  "client_id" text COLLATE "pg_catalog"."default",
  "client_secret" text COLLATE "pg_catalog"."default",
  "redirect_uris" text[] COLLATE "pg_catalog"."default",
  "tags" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."oauth2_credentials" OWNER TO "kong";

-- ----------------------------
-- Table structure for oauth2_tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2_tokens";
CREATE TABLE "public"."oauth2_tokens" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(0) with time zone),
  "credential_id" uuid,
  "service_id" uuid,
  "access_token" text COLLATE "pg_catalog"."default",
  "refresh_token" text COLLATE "pg_catalog"."default",
  "token_type" text COLLATE "pg_catalog"."default",
  "expires_in" int4,
  "authenticated_userid" text COLLATE "pg_catalog"."default",
  "scope" text COLLATE "pg_catalog"."default",
  "ttl" timestamptz(6)
)
;
ALTER TABLE "public"."oauth2_tokens" OWNER TO "kong";

-- ----------------------------
-- Table structure for plugins
-- ----------------------------
DROP TABLE IF EXISTS "public"."plugins";
CREATE TABLE "public"."plugins" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(0) with time zone),
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "consumer_id" uuid,
  "service_id" uuid,
  "route_id" uuid,
  "config" jsonb NOT NULL,
  "enabled" bool NOT NULL,
  "cache_key" text COLLATE "pg_catalog"."default",
  "protocols" text[] COLLATE "pg_catalog"."default",
  "tags" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."plugins" OWNER TO "kong";

-- ----------------------------
-- Table structure for ratelimiting_metrics
-- ----------------------------
DROP TABLE IF EXISTS "public"."ratelimiting_metrics";
CREATE TABLE "public"."ratelimiting_metrics" (
  "identifier" text COLLATE "pg_catalog"."default" NOT NULL,
  "period" text COLLATE "pg_catalog"."default" NOT NULL,
  "period_date" timestamptz(6) NOT NULL,
  "service_id" uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
  "route_id" uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
  "value" int4
)
;
ALTER TABLE "public"."ratelimiting_metrics" OWNER TO "kong";

-- ----------------------------
-- Table structure for response_ratelimiting_metrics
-- ----------------------------
DROP TABLE IF EXISTS "public"."response_ratelimiting_metrics";
CREATE TABLE "public"."response_ratelimiting_metrics" (
  "identifier" text COLLATE "pg_catalog"."default" NOT NULL,
  "period" text COLLATE "pg_catalog"."default" NOT NULL,
  "period_date" timestamptz(6) NOT NULL,
  "service_id" uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
  "route_id" uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000'::uuid,
  "value" int4
)
;
ALTER TABLE "public"."response_ratelimiting_metrics" OWNER TO "kong";

-- ----------------------------
-- Table structure for routes
-- ----------------------------
DROP TABLE IF EXISTS "public"."routes";
CREATE TABLE "public"."routes" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6),
  "updated_at" timestamptz(6),
  "name" text COLLATE "pg_catalog"."default",
  "service_id" uuid,
  "protocols" text[] COLLATE "pg_catalog"."default",
  "methods" text[] COLLATE "pg_catalog"."default",
  "hosts" text[] COLLATE "pg_catalog"."default",
  "paths" text[] COLLATE "pg_catalog"."default",
  "snis" text[] COLLATE "pg_catalog"."default",
  "sources" jsonb[],
  "destinations" jsonb[],
  "regex_priority" int8,
  "strip_path" bool,
  "preserve_host" bool,
  "tags" text[] COLLATE "pg_catalog"."default",
  "https_redirect_status_code" int4,
  "headers" jsonb,
  "path_handling" text COLLATE "pg_catalog"."default" DEFAULT 'v0'::text
)
;
ALTER TABLE "public"."routes" OWNER TO "kong";

-- ----------------------------
-- Table structure for schema_meta
-- ----------------------------
DROP TABLE IF EXISTS "public"."schema_meta";
CREATE TABLE "public"."schema_meta" (
  "key" text COLLATE "pg_catalog"."default" NOT NULL,
  "subsystem" text COLLATE "pg_catalog"."default" NOT NULL,
  "last_executed" text COLLATE "pg_catalog"."default",
  "executed" text[] COLLATE "pg_catalog"."default",
  "pending" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."schema_meta" OWNER TO "kong";

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS "public"."services";
CREATE TABLE "public"."services" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6),
  "updated_at" timestamptz(6),
  "name" text COLLATE "pg_catalog"."default",
  "retries" int8,
  "protocol" text COLLATE "pg_catalog"."default",
  "host" text COLLATE "pg_catalog"."default",
  "port" int8,
  "path" text COLLATE "pg_catalog"."default",
  "connect_timeout" int8,
  "write_timeout" int8,
  "read_timeout" int8,
  "tags" text[] COLLATE "pg_catalog"."default",
  "client_certificate_id" uuid
)
;
ALTER TABLE "public"."services" OWNER TO "kong";

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS "public"."sessions";
CREATE TABLE "public"."sessions" (
  "id" uuid NOT NULL,
  "session_id" text COLLATE "pg_catalog"."default",
  "expires" int4,
  "data" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6),
  "ttl" timestamptz(6)
)
;
ALTER TABLE "public"."sessions" OWNER TO "kong";

-- ----------------------------
-- Table structure for snis
-- ----------------------------
DROP TABLE IF EXISTS "public"."snis";
CREATE TABLE "public"."snis" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(0) with time zone),
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "certificate_id" uuid,
  "tags" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."snis" OWNER TO "kong";

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS "public"."tags";
CREATE TABLE "public"."tags" (
  "entity_id" uuid NOT NULL,
  "entity_name" text COLLATE "pg_catalog"."default",
  "tags" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."tags" OWNER TO "kong";

-- ----------------------------
-- Table structure for targets
-- ----------------------------
DROP TABLE IF EXISTS "public"."targets";
CREATE TABLE "public"."targets" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(3) with time zone),
  "upstream_id" uuid,
  "target" text COLLATE "pg_catalog"."default" NOT NULL,
  "weight" int4 NOT NULL,
  "tags" text[] COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."targets" OWNER TO "kong";

-- ----------------------------
-- Table structure for ttls
-- ----------------------------
DROP TABLE IF EXISTS "public"."ttls";
CREATE TABLE "public"."ttls" (
  "primary_key_value" text COLLATE "pg_catalog"."default" NOT NULL,
  "primary_uuid_value" uuid,
  "table_name" text COLLATE "pg_catalog"."default" NOT NULL,
  "primary_key_name" text COLLATE "pg_catalog"."default" NOT NULL,
  "expire_at" timestamp(6) NOT NULL
)
;
ALTER TABLE "public"."ttls" OWNER TO "kong";

-- ----------------------------
-- Table structure for upstreams
-- ----------------------------
DROP TABLE IF EXISTS "public"."upstreams";
CREATE TABLE "public"."upstreams" (
  "id" uuid NOT NULL,
  "created_at" timestamptz(6) DEFAULT timezone('UTC'::text, ('now'::text)::timestamp(3) with time zone),
  "name" text COLLATE "pg_catalog"."default",
  "hash_on" text COLLATE "pg_catalog"."default",
  "hash_fallback" text COLLATE "pg_catalog"."default",
  "hash_on_header" text COLLATE "pg_catalog"."default",
  "hash_fallback_header" text COLLATE "pg_catalog"."default",
  "hash_on_cookie" text COLLATE "pg_catalog"."default",
  "hash_on_cookie_path" text COLLATE "pg_catalog"."default",
  "slots" int4 NOT NULL,
  "healthchecks" jsonb,
  "tags" text[] COLLATE "pg_catalog"."default",
  "algorithm" text COLLATE "pg_catalog"."default",
  "host_header" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."upstreams" OWNER TO "kong";

-- ----------------------------
-- Indexes structure for table acls
-- ----------------------------
CREATE INDEX "acls_consumer_id_idx" ON "public"."acls" USING btree (
  "consumer_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "acls_group_idx" ON "public"."acls" USING btree (
  "group" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "acls_tags_idex_tags_idx" ON "public"."acls" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);

-- ----------------------------
-- Triggers structure for table acls
-- ----------------------------
CREATE TRIGGER "acls_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."acls"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Uniques structure for table acls
-- ----------------------------
ALTER TABLE "public"."acls" ADD CONSTRAINT "acls_cache_key_key" UNIQUE ("cache_key");

-- ----------------------------
-- Primary Key structure for table acls
-- ----------------------------
ALTER TABLE "public"."acls" ADD CONSTRAINT "acls_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table acls
-- ----------------------------
ALTER TABLE "public"."acls" ADD CONSTRAINT "acls_consumer_id_fkey" FOREIGN KEY ("consumer_id") REFERENCES "public"."consumers" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Indexes structure for table basicauth_credentials
-- ----------------------------
CREATE INDEX "basicauth_consumer_id_idx" ON "public"."basicauth_credentials" USING btree (
  "consumer_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "basicauth_tags_idex_tags_idx" ON "public"."basicauth_credentials" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);

-- ----------------------------
-- Triggers structure for table basicauth_credentials
-- ----------------------------
CREATE TRIGGER "basicauth_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."basicauth_credentials"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Uniques structure for table basicauth_credentials
-- ----------------------------
ALTER TABLE "public"."basicauth_credentials" ADD CONSTRAINT "basicauth_credentials_username_key" UNIQUE ("username");

-- ----------------------------
-- Primary Key structure for table basicauth_credentials
-- ----------------------------
ALTER TABLE "public"."basicauth_credentials" ADD CONSTRAINT "basicauth_credentials_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table basicauth_credentials
-- ----------------------------
ALTER TABLE "public"."basicauth_credentials" ADD CONSTRAINT "basicauth_credentials_consumer_id_fkey" FOREIGN KEY ("consumer_id") REFERENCES "public"."consumers" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Triggers structure for table ca_certificates
-- ----------------------------
CREATE TRIGGER "ca_certificates_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."ca_certificates"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Uniques structure for table ca_certificates
-- ----------------------------
ALTER TABLE "public"."ca_certificates" ADD CONSTRAINT "ca_certificates_cert_key" UNIQUE ("cert");

-- ----------------------------
-- Primary Key structure for table ca_certificates
-- ----------------------------
ALTER TABLE "public"."ca_certificates" ADD CONSTRAINT "ca_certificates_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table certificates
-- ----------------------------
CREATE INDEX "certificates_tags_idx" ON "public"."certificates" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);

-- ----------------------------
-- Triggers structure for table certificates
-- ----------------------------
CREATE TRIGGER "certificates_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."certificates"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Primary Key structure for table certificates
-- ----------------------------
ALTER TABLE "public"."certificates" ADD CONSTRAINT "certificates_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cluster_events
-- ----------------------------
CREATE INDEX "cluster_events_at_idx" ON "public"."cluster_events" USING btree (
  "at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "cluster_events_channel_idx" ON "public"."cluster_events" USING btree (
  "channel" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "cluster_events_expire_at_idx" ON "public"."cluster_events" USING btree (
  "expire_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cluster_events
-- ----------------------------
ALTER TABLE "public"."cluster_events" ADD CONSTRAINT "cluster_events_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table consumers
-- ----------------------------
CREATE INDEX "consumers_tags_idx" ON "public"."consumers" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);
CREATE INDEX "consumers_username_idx" ON "public"."consumers" USING btree (
  lower(username) COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table consumers
-- ----------------------------
CREATE TRIGGER "consumers_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."consumers"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Uniques structure for table consumers
-- ----------------------------
ALTER TABLE "public"."consumers" ADD CONSTRAINT "consumers_username_key" UNIQUE ("username");
ALTER TABLE "public"."consumers" ADD CONSTRAINT "consumers_custom_id_key" UNIQUE ("custom_id");

-- ----------------------------
-- Primary Key structure for table consumers
-- ----------------------------
ALTER TABLE "public"."consumers" ADD CONSTRAINT "consumers_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table hmacauth_credentials
-- ----------------------------
CREATE INDEX "hmacauth_credentials_consumer_id_idx" ON "public"."hmacauth_credentials" USING btree (
  "consumer_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "hmacauth_tags_idex_tags_idx" ON "public"."hmacauth_credentials" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);

-- ----------------------------
-- Triggers structure for table hmacauth_credentials
-- ----------------------------
CREATE TRIGGER "hmacauth_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."hmacauth_credentials"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Uniques structure for table hmacauth_credentials
-- ----------------------------
ALTER TABLE "public"."hmacauth_credentials" ADD CONSTRAINT "hmacauth_credentials_username_key" UNIQUE ("username");

-- ----------------------------
-- Primary Key structure for table hmacauth_credentials
-- ----------------------------
ALTER TABLE "public"."hmacauth_credentials" ADD CONSTRAINT "hmacauth_credentials_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table hmacauth_credentials
-- ----------------------------
ALTER TABLE "public"."hmacauth_credentials" ADD CONSTRAINT "hmacauth_credentials_consumer_id_fkey" FOREIGN KEY ("consumer_id") REFERENCES "public"."consumers" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Indexes structure for table jwt_secrets
-- ----------------------------
CREATE INDEX "jwt_secrets_consumer_id_idx" ON "public"."jwt_secrets" USING btree (
  "consumer_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "jwt_secrets_secret_idx" ON "public"."jwt_secrets" USING btree (
  "secret" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "jwtsecrets_tags_idex_tags_idx" ON "public"."jwt_secrets" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);

-- ----------------------------
-- Triggers structure for table jwt_secrets
-- ----------------------------
CREATE TRIGGER "jwtsecrets_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."jwt_secrets"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Uniques structure for table jwt_secrets
-- ----------------------------
ALTER TABLE "public"."jwt_secrets" ADD CONSTRAINT "jwt_secrets_key_key" UNIQUE ("key");

-- ----------------------------
-- Primary Key structure for table jwt_secrets
-- ----------------------------
ALTER TABLE "public"."jwt_secrets" ADD CONSTRAINT "jwt_secrets_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table jwt_secrets
-- ----------------------------
ALTER TABLE "public"."jwt_secrets" ADD CONSTRAINT "jwt_secrets_consumer_id_fkey" FOREIGN KEY ("consumer_id") REFERENCES "public"."consumers" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Indexes structure for table keyauth_credentials
-- ----------------------------
CREATE INDEX "keyauth_credentials_consumer_id_idx" ON "public"."keyauth_credentials" USING btree (
  "consumer_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "keyauth_credentials_ttl_idx" ON "public"."keyauth_credentials" USING btree (
  "ttl" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "keyauth_tags_idex_tags_idx" ON "public"."keyauth_credentials" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);

-- ----------------------------
-- Triggers structure for table keyauth_credentials
-- ----------------------------
CREATE TRIGGER "keyauth_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."keyauth_credentials"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Uniques structure for table keyauth_credentials
-- ----------------------------
ALTER TABLE "public"."keyauth_credentials" ADD CONSTRAINT "keyauth_credentials_key_key" UNIQUE ("key");

-- ----------------------------
-- Primary Key structure for table keyauth_credentials
-- ----------------------------
ALTER TABLE "public"."keyauth_credentials" ADD CONSTRAINT "keyauth_credentials_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table keyauth_credentials
-- ----------------------------
ALTER TABLE "public"."keyauth_credentials" ADD CONSTRAINT "keyauth_credentials_consumer_id_fkey" FOREIGN KEY ("consumer_id") REFERENCES "public"."consumers" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Indexes structure for table locks
-- ----------------------------
CREATE INDEX "locks_ttl_idx" ON "public"."locks" USING btree (
  "ttl" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table locks
-- ----------------------------
ALTER TABLE "public"."locks" ADD CONSTRAINT "locks_pkey" PRIMARY KEY ("key");

-- ----------------------------
-- Indexes structure for table oauth2_authorization_codes
-- ----------------------------
CREATE INDEX "oauth2_authorization_codes_authenticated_userid_idx" ON "public"."oauth2_authorization_codes" USING btree (
  "authenticated_userid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "oauth2_authorization_codes_ttl_idx" ON "public"."oauth2_authorization_codes" USING btree (
  "ttl" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "oauth2_authorization_credential_id_idx" ON "public"."oauth2_authorization_codes" USING btree (
  "credential_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "oauth2_authorization_service_id_idx" ON "public"."oauth2_authorization_codes" USING btree (
  "service_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table oauth2_authorization_codes
-- ----------------------------
ALTER TABLE "public"."oauth2_authorization_codes" ADD CONSTRAINT "oauth2_authorization_codes_code_key" UNIQUE ("code");

-- ----------------------------
-- Primary Key structure for table oauth2_authorization_codes
-- ----------------------------
ALTER TABLE "public"."oauth2_authorization_codes" ADD CONSTRAINT "oauth2_authorization_codes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table oauth2_authorization_codes
-- ----------------------------
ALTER TABLE "public"."oauth2_authorization_codes" ADD CONSTRAINT "oauth2_authorization_codes_credential_id_fkey" FOREIGN KEY ("credential_id") REFERENCES "public"."oauth2_credentials" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."oauth2_authorization_codes" ADD CONSTRAINT "oauth2_authorization_codes_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."services" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Indexes structure for table oauth2_credentials
-- ----------------------------
CREATE INDEX "oauth2_credentials_consumer_id_idx" ON "public"."oauth2_credentials" USING btree (
  "consumer_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "oauth2_credentials_secret_idx" ON "public"."oauth2_credentials" USING btree (
  "client_secret" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "oauth2_credentials_tags_idex_tags_idx" ON "public"."oauth2_credentials" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);

-- ----------------------------
-- Triggers structure for table oauth2_credentials
-- ----------------------------
CREATE TRIGGER "oauth2_credentials_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."oauth2_credentials"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Uniques structure for table oauth2_credentials
-- ----------------------------
ALTER TABLE "public"."oauth2_credentials" ADD CONSTRAINT "oauth2_credentials_client_id_key" UNIQUE ("client_id");

-- ----------------------------
-- Primary Key structure for table oauth2_credentials
-- ----------------------------
ALTER TABLE "public"."oauth2_credentials" ADD CONSTRAINT "oauth2_credentials_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table oauth2_credentials
-- ----------------------------
ALTER TABLE "public"."oauth2_credentials" ADD CONSTRAINT "oauth2_credentials_consumer_id_fkey" FOREIGN KEY ("consumer_id") REFERENCES "public"."consumers" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Indexes structure for table oauth2_tokens
-- ----------------------------
CREATE INDEX "oauth2_tokens_authenticated_userid_idx" ON "public"."oauth2_tokens" USING btree (
  "authenticated_userid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "oauth2_tokens_credential_id_idx" ON "public"."oauth2_tokens" USING btree (
  "credential_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "oauth2_tokens_service_id_idx" ON "public"."oauth2_tokens" USING btree (
  "service_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "oauth2_tokens_ttl_idx" ON "public"."oauth2_tokens" USING btree (
  "ttl" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table oauth2_tokens
-- ----------------------------
ALTER TABLE "public"."oauth2_tokens" ADD CONSTRAINT "oauth2_tokens_access_token_key" UNIQUE ("access_token");
ALTER TABLE "public"."oauth2_tokens" ADD CONSTRAINT "oauth2_tokens_refresh_token_key" UNIQUE ("refresh_token");

-- ----------------------------
-- Primary Key structure for table oauth2_tokens
-- ----------------------------
ALTER TABLE "public"."oauth2_tokens" ADD CONSTRAINT "oauth2_tokens_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table oauth2_tokens
-- ----------------------------
ALTER TABLE "public"."oauth2_tokens" ADD CONSTRAINT "oauth2_tokens_credential_id_fkey" FOREIGN KEY ("credential_id") REFERENCES "public"."oauth2_credentials" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."oauth2_tokens" ADD CONSTRAINT "oauth2_tokens_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."services" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Indexes structure for table plugins
-- ----------------------------
CREATE INDEX "plugins_consumer_id_idx" ON "public"."plugins" USING btree (
  "consumer_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "plugins_name_idx" ON "public"."plugins" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "plugins_route_id_idx" ON "public"."plugins" USING btree (
  "route_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "plugins_service_id_idx" ON "public"."plugins" USING btree (
  "service_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "plugins_tags_idx" ON "public"."plugins" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);

-- ----------------------------
-- Triggers structure for table plugins
-- ----------------------------
CREATE TRIGGER "plugins_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."plugins"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Uniques structure for table plugins
-- ----------------------------
ALTER TABLE "public"."plugins" ADD CONSTRAINT "plugins_cache_key_key" UNIQUE ("cache_key");

-- ----------------------------
-- Primary Key structure for table plugins
-- ----------------------------
ALTER TABLE "public"."plugins" ADD CONSTRAINT "plugins_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table plugins
-- ----------------------------
ALTER TABLE "public"."plugins" ADD CONSTRAINT "plugins_consumer_id_fkey" FOREIGN KEY ("consumer_id") REFERENCES "public"."consumers" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."plugins" ADD CONSTRAINT "plugins_route_id_fkey" FOREIGN KEY ("route_id") REFERENCES "public"."routes" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."plugins" ADD CONSTRAINT "plugins_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."services" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Indexes structure for table ratelimiting_metrics
-- ----------------------------
CREATE INDEX "ratelimiting_metrics_idx" ON "public"."ratelimiting_metrics" USING btree (
  "service_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "route_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "period_date" "pg_catalog"."timestamptz_ops" ASC NULLS LAST,
  "period" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ratelimiting_metrics
-- ----------------------------
ALTER TABLE "public"."ratelimiting_metrics" ADD CONSTRAINT "ratelimiting_metrics_pkey" PRIMARY KEY ("identifier", "period", "period_date", "service_id", "route_id");

-- ----------------------------
-- Primary Key structure for table response_ratelimiting_metrics
-- ----------------------------
ALTER TABLE "public"."response_ratelimiting_metrics" ADD CONSTRAINT "response_ratelimiting_metrics_pkey" PRIMARY KEY ("identifier", "period", "period_date", "service_id", "route_id");

-- ----------------------------
-- Indexes structure for table routes
-- ----------------------------
CREATE INDEX "routes_service_id_idx" ON "public"."routes" USING btree (
  "service_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "routes_tags_idx" ON "public"."routes" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);

-- ----------------------------
-- Triggers structure for table routes
-- ----------------------------
CREATE TRIGGER "routes_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."routes"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Uniques structure for table routes
-- ----------------------------
ALTER TABLE "public"."routes" ADD CONSTRAINT "routes_name_key" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table routes
-- ----------------------------
ALTER TABLE "public"."routes" ADD CONSTRAINT "routes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table routes
-- ----------------------------
ALTER TABLE "public"."routes" ADD CONSTRAINT "routes_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."services" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Primary Key structure for table schema_meta
-- ----------------------------
ALTER TABLE "public"."schema_meta" ADD CONSTRAINT "schema_meta_pkey" PRIMARY KEY ("key", "subsystem");

-- ----------------------------
-- Indexes structure for table services
-- ----------------------------
CREATE INDEX "services_fkey_client_certificate" ON "public"."services" USING btree (
  "client_certificate_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "services_tags_idx" ON "public"."services" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);

-- ----------------------------
-- Triggers structure for table services
-- ----------------------------
CREATE TRIGGER "services_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."services"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Uniques structure for table services
-- ----------------------------
ALTER TABLE "public"."services" ADD CONSTRAINT "services_name_key" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table services
-- ----------------------------
ALTER TABLE "public"."services" ADD CONSTRAINT "services_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table services
-- ----------------------------
ALTER TABLE "public"."services" ADD CONSTRAINT "services_client_certificate_id_fkey" FOREIGN KEY ("client_certificate_id") REFERENCES "public"."certificates" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Indexes structure for table sessions
-- ----------------------------
CREATE INDEX "session_sessions_expires_idx" ON "public"."sessions" USING btree (
  "expires" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table sessions
-- ----------------------------
ALTER TABLE "public"."sessions" ADD CONSTRAINT "sessions_session_id_key" UNIQUE ("session_id");

-- ----------------------------
-- Primary Key structure for table sessions
-- ----------------------------
ALTER TABLE "public"."sessions" ADD CONSTRAINT "sessions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table snis
-- ----------------------------
CREATE INDEX "snis_certificate_id_idx" ON "public"."snis" USING btree (
  "certificate_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "snis_tags_idx" ON "public"."snis" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);

-- ----------------------------
-- Triggers structure for table snis
-- ----------------------------
CREATE TRIGGER "snis_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."snis"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Uniques structure for table snis
-- ----------------------------
ALTER TABLE "public"."snis" ADD CONSTRAINT "snis_name_key" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table snis
-- ----------------------------
ALTER TABLE "public"."snis" ADD CONSTRAINT "snis_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table snis
-- ----------------------------
ALTER TABLE "public"."snis" ADD CONSTRAINT "snis_certificate_id_fkey" FOREIGN KEY ("certificate_id") REFERENCES "public"."certificates" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Indexes structure for table tags
-- ----------------------------
CREATE INDEX "tags_entity_name_idx" ON "public"."tags" USING btree (
  "entity_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "tags_tags_idx" ON "public"."tags" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);

-- ----------------------------
-- Primary Key structure for table tags
-- ----------------------------
ALTER TABLE "public"."tags" ADD CONSTRAINT "tags_pkey" PRIMARY KEY ("entity_id");

-- ----------------------------
-- Indexes structure for table targets
-- ----------------------------
CREATE INDEX "targets_tags_idx" ON "public"."targets" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);
CREATE INDEX "targets_target_idx" ON "public"."targets" USING btree (
  "target" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "targets_upstream_id_idx" ON "public"."targets" USING btree (
  "upstream_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table targets
-- ----------------------------
CREATE TRIGGER "targets_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."targets"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Primary Key structure for table targets
-- ----------------------------
ALTER TABLE "public"."targets" ADD CONSTRAINT "targets_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table targets
-- ----------------------------
ALTER TABLE "public"."targets" ADD CONSTRAINT "targets_upstream_id_fkey" FOREIGN KEY ("upstream_id") REFERENCES "public"."upstreams" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Indexes structure for table ttls
-- ----------------------------
CREATE INDEX "ttls_primary_uuid_value_idx" ON "public"."ttls" USING btree (
  "primary_uuid_value" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ttls
-- ----------------------------
ALTER TABLE "public"."ttls" ADD CONSTRAINT "ttls_pkey" PRIMARY KEY ("primary_key_value", "table_name");

-- ----------------------------
-- Indexes structure for table upstreams
-- ----------------------------
CREATE INDEX "upstreams_tags_idx" ON "public"."upstreams" USING gin (
  "tags" COLLATE "pg_catalog"."default" "pg_catalog"."_text_ops"
);

-- ----------------------------
-- Triggers structure for table upstreams
-- ----------------------------
CREATE TRIGGER "upstreams_sync_tags_trigger" AFTER INSERT OR UPDATE OF "tags" OR DELETE ON "public"."upstreams"
FOR EACH ROW
EXECUTE PROCEDURE "public"."sync_tags"();

-- ----------------------------
-- Uniques structure for table upstreams
-- ----------------------------
ALTER TABLE "public"."upstreams" ADD CONSTRAINT "upstreams_name_key" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table upstreams
-- ----------------------------
ALTER TABLE "public"."upstreams" ADD CONSTRAINT "upstreams_pkey" PRIMARY KEY ("id");
