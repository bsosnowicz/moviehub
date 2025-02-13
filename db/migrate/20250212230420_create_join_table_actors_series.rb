class CreateJoinTableActorsSeries < ActiveRecord::Migration[8.0]
  def change
    create_join_table :actors, :series do |t|
      t.index [:actor_id, :series_id]
      t.index [:series_id, :actor_id]
    end
  end
end
