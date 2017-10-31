class AddSlugToForumThreads < ActiveRecord::Migration[5.1]
  def change
    add_column :forum_threads, :slug, :string
  end
end
