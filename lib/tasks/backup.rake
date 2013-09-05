desc "PG Backup"
namespace :pg do
  task :backup => [:environment] do
    #stamp the filename
    datestamp = Time.now.strftime("%Y-%m-%d_%H-%M-%S")

    #drop it in the db/backups directory temporarily
    backup_file = "# {RAILS_ROOT}/db/backups/db_name_# {datestamp}_dump.sql.gz"

    #dump the backup and zip it up
    sh "pg_dump -h localhost -U tom rpasswrd | gzip -c > # {backup_file}"

    #send_to_amazon backup_file
    #remove the file on completion so we don't clog up our app
    #File.delete backup_file
  end
end