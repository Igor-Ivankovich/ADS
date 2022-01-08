namespace :batch2 do
  desc "TODO"
  task archive: :environment do
    ApplicationRecord.connection.execute <<~END_OF_SQL
      UPDATE posts SET post_type = 'AR' WHERE post_type='P' and DateTime('now', '-3 day') >= updated_at;
    END_OF_SQL
  end

end
