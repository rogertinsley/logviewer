# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "Activities", primary_key: "ActivityOrder", force: :cascade do |t|
    t.uuid        "MessageID",                    null: false
    t.varchar_max "Title",     limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.datetime    "StartTime"
    t.datetime    "EndTime"
    t.index ["MessageID"], name: "IX_MessageID"
  end

  create_table "ConfigurationRules", id: false, force: :cascade do |t|
    t.varchar "UserName",    limit: 100,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar "Machine",     limit: 100,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar "Application", limit: 100,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar "Logger",      limit: 100,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.boolean "Enabled",                 null: false
    t.varchar "LogLevel",    limit: 20,  null: false, collation: "SQL_Latin1_General_CP1_CI_AS"
    t.index ["UserName", "Machine", "Application", "Logger"], name: "UQ_ConfigurationRules", unique: true
  end

  create_table "Messages", primary_key: "MessageOrder", force: :cascade do |t|
    t.uuid        "MessageID",                               null: false
    t.varchar_max "MessageContextID",     limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "MessageType",          limit: 2147483647, null: false, collation: "SQL_Latin1_General_CP1_CI_AS"
    t.datetime    "MessageTimestamp",                        null: false
    t.varchar     "MessageLevel",         limit: 20,         null: false, collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "SourceUser",           limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "SourceMachine",        limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "SourceApplication",    limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "SourceLogger",         limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "Title",                limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "Message",              limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "Comments",             limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "UserName",             limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "ExceptionType",        limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "ExceptionSource",      limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "ExceptionTargetSite",  limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "ExceptionStackTrace",  limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "ExceptionDetail",      limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.string      "XmlMessage"
    t.varchar_max "SecurityAction",       limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "AuditOperation",       limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.datetime    "TransactionStartTime"
    t.datetime    "TransactionEndTime"
    t.varchar     "TransactionStatus",    limit: 20,                      collation: "SQL_Latin1_General_CP1_CI_AS"
    t.index ["MessageID"], name: "UQ__Messages__C87C037D3498E7E2", unique: true
  end

  create_table "Parameters", primary_key: "ParameterOrder", force: :cascade do |t|
    t.uuid        "MessageID",                    null: false
    t.varchar_max "Name",      limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.varchar_max "Value",     limit: 2147483647,              collation: "SQL_Latin1_General_CP1_CI_AS"
    t.index ["MessageID"], name: "IX_MessageID"
  end

  create_table "SystemParameters", primary_key: "Name", id: :varchar, limit: 100, collation: "SQL_Latin1_General_CP1_CI_AS", force: :cascade do |t|
    t.varchar "Value", limit: 100, collation: "SQL_Latin1_General_CP1_CI_AS"
  end

  add_foreign_key "Activities", "Messages", column: "MessageID", primary_key: "MessageID", name: "FK__Activitie__Messa__3F466844", on_delete: :cascade
  add_foreign_key "Parameters", "Messages", column: "MessageID", primary_key: "MessageID", name: "FK__Parameter__Messa__403A8C7D", on_delete: :cascade
end
