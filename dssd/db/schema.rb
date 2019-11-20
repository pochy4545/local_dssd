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

ActiveRecord::Schema.define(version: 2019_11_20_000242) do

  create_table "estado_videoconferencia", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "estado", limit: 100, null: false
  end

  create_table "interno_unidads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT", force: :cascade do |t|
    t.string "apellido", limit: 100, null: false
    t.string "nombre", limit: 100, null: false
    t.bigint "unidad", null: false
    t.string "email_representante", limit: 100, null: false
    t.index ["unidad"], name: "interno_unidad_FK"
  end

  create_table "participante_videoconferencia", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tipo_participante", null: false
    t.string "apellido", limit: 100, null: false
    t.string "nombres", limit: 100, null: false
    t.string "email", limit: 100, null: false
    t.index ["tipo_participante"], name: "participante_videoconferencia_FK"
  end

  create_table "registro_videoconferencia", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "estado", null: false
    t.date "fecha", null: false
    t.time "hora", null: false
    t.string "descripcion", limit: 250, null: false
    t.bigint "videoconferencia", null: false
    t.time "horaFin"
    t.index ["estado"], name: "registro_videoconferencia_FK"
    t.index ["videoconferencia"], name: "registro_videoconferencia_FK_1"
  end

  create_table "relations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "videoconferencia_id"
    t.bigint "participante_videoconferencia_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participante_videoconferencia_id"], name: "index_relations_on_participante_videoconferencia_id"
    t.index ["videoconferencia_id"], name: "index_relations_on_videoconferencia_id"
  end

  create_table "tipo_participantes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT", force: :cascade do |t|
    t.string "tipo", limit: 100, null: false
  end

  create_table "tipo_videoconferencia", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tipo", limit: 100, null: false
  end

  create_table "unidades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT", force: :cascade do |t|
    t.string "nombre", limit: 100, null: false
    t.bigint "numeroUnidad", null: false
    t.string "coordenadas", limit: 100, null: false
    t.string "email", limit: 100, null: false
  end

  create_table "videoconferencia", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT", force: :cascade do |t|
    t.date "fecha", null: false
    t.time "hora", null: false
    t.bigint "unidad", null: false
    t.bigint "estado", null: false
    t.bigint "tipo", null: false
    t.string "nro_causa", limit: 100, null: false
    t.string "motivo", limit: 100
    t.bigint "solicitante", null: false
    t.index ["estado"], name: "videoconferencias_FK_2"
    t.index ["solicitante"], name: "videoconferencias_FK_3"
    t.index ["tipo"], name: "videoconferencias_FK"
    t.index ["unidad"], name: "videoconferencias_FK_1"
  end

  add_foreign_key "interno_unidads", "unidades", column: "unidad", name: "interno_unidad_FK"
  add_foreign_key "participante_videoconferencia", "tipo_participantes", column: "tipo_participante", name: "participante_videoconferencia_FK"
  add_foreign_key "registro_videoconferencia", "estado_videoconferencia", column: "estado", name: "registro_videoconferencia_FK"
  add_foreign_key "registro_videoconferencia", "videoconferencia", column: "videoconferencia", name: "registro_videoconferencia_FK_1"
  add_foreign_key "relations", "participante_videoconferencia", column: "participante_videoconferencia_id"
  add_foreign_key "relations", "videoconferencia", column: "videoconferencia_id"
  add_foreign_key "videoconferencia", "estado_videoconferencia", column: "estado", name: "videoconferencias_FK_2"
  add_foreign_key "videoconferencia", "participante_videoconferencia", column: "solicitante", name: "videoconferencias_FK_3"
  add_foreign_key "videoconferencia", "tipo_videoconferencia", column: "tipo", name: "videoconferencias_FK"
  add_foreign_key "videoconferencia", "unidades", column: "unidad", name: "videoconferencias_FK_1"
end
