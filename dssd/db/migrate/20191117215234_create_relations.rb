class CreateRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
      t.references :videoconferencia, foreign_key: true
      t.references :participante_videoconferencia, foreign_key: true

      t.timestamps
    end
  end
end
