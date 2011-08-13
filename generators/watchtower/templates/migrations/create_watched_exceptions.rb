class CreateWatchedExceptions < ActiveRecord::Migration
  def self.up
    create_table :watched_exceptions do |t|
      t.string :controller_action, :exception_class, :message, :key
      t.text :backtrace, :request, :parameters, :environment, :session
      t.datetime :created_at
      t.column :looked, 'TINYINT(4)', :null => false, :default => 0
    end
    
    change_table :watched_exceptions do |t|
      [:controller_action, :exception_class, :key, :created_at, :message].each do |col|
        t.index col
      end
    end
  end

  def self.down
    drop_table :watched_exceptions
  end
end
