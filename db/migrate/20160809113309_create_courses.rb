class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
    	t.string :name
    	t.string :description
    	t.string :thumbnail
    	
      t.timestamps
    end
  end
end
