class AddHorafinToRegistroVideoconferencium < ActiveRecord::Migration[5.2]
  def change
    add_column :registro_videoconferencia, :horaFin, :time
  end
end
