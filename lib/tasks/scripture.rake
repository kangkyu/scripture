namespace :scripture do
  desc "Delete duplicated verses"
  task :dedup => :environment do
    ids = Verse.group('book, chapter, number, edition').pluck('MIN(id)')
    Verse.where.not(id: ids).delete_all
  end
end
