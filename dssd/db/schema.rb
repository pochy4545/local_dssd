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

  create_table "estado_videoconferencia", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "estado", limit: 100, null: false
  end

  create_table "interno_unidad", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.index ["estado"], name: "registro_videoconferencia_FK"
    t.index ["videoconferencia"], name: "registro_videoconferencia_FK_1"
  end

  create_table "tipo_participante", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tipo", limit: 100, null: false
  end

  create_table "tipo_videoconferencia", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tipo", limit: 100, null: false
  end

  create_table "unidades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100, null: false
    t.bigint "numeroUnidad", null: false
    t.string "coordenadas", limit: 100, null: false
    t.string "email", limit: 100, null: false
  end

  create_table "videoconferencias", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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

  add_foreign_key "interno_unidad", "unidades", column: "unidad", name: "interno_unidad_FK"
  add_foreign_key "participante_videoconferencia", "tipo_participante", column: "tipo_participante", name: "participante_videoconferencia_FK"
  add_foreign_key "registro_videoconferencia", "estado_videoconferencia", column: "estado", name: "registro_videoconferencia_FK"
  add_foreign_key "registro_videoconferencia", "videoconferencias", column: "videoconferencia", name: "registro_videoconferencia_FK_1"
  add_foreign_key "videoconferencias", "estado_videoconferencia", column: "estado", name: "videoconferencias_FK_2"
  add_foreign_key "videoconferencias", "participante_videoconferencia", column: "solicitante", name: "videoconferencias_FK_3"
  add_foreign_key "videoconferencias", "tipo_videoconferencia", column: "tipo", name: "videoconferencias_FK"
  add_foreign_key "videoconferencias", "unidades", column: "unidad", name: "videoconferencias_FK_1"
end
