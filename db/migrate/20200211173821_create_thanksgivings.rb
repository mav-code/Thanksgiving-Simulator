class CreateThanksgivings < ActiveRecord::Migration[5.2]
  def change
    create_table :thanksgivings do |t|
      t.string :type
      t.integer :strife
      t.string :location
    end
  end
end
