require 'active_record'
require 'sqlite3'
require 'yaml'
require 'active_record'
require 'date'   
require_relative '../models/availability' 

$config = YAML.load(File.read("config/database.yml"))['development'] 

ActiveRecord::Base.establish_connection(
  adapter:  $config['adapter'],
  database: $config['database'], 
  pool:     $config['pool'],
  timeout:  $config['timeout']
)


class Config 
  def self.create_table
    begin
      ActiveRecord::Base.connection.drop_table('availabilities')
    rescue
    end
    ActiveRecord::Base.connection.create_table('availabilities') do |t|  
      t.string :client_name
      t.datetime :start_date
      t.datetime :end_date
    end 
  end  
end
 
argumentos = Hash[*ARGV]
 

if(argumentos['-c'] == 'migrate')  
  Config.create_table   
end


