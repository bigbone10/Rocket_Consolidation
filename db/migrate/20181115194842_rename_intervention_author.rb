class RenameInterventionAuthor < ActiveRecord::Migration[5.2]
  def change
    rename_column :interventions, :author, :author_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
