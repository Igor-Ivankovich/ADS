namespace :batch do
  desc "TODO"
  task publication: :environment do
    ApplicationRecord.connection.execute <<~END_OF_SQL
      UPDATE posts SET post_type = 'P' WHERE post_type = 'A'
    END_OF_SQL

  end

end
