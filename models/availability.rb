class Availability < ActiveRecord::Base

    validates :client_name, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true 

    def self.call(date, days, name)   
        begin
            validar_data(date,days)
        rescue 
        end          
        availability = Availability.new 
        availability.start_date = @start_day
        availability.end_date =  @end_day
        availability.client_name = name             
        
        if(!verificar_agendamento.blank?)
            false
        elsif(availability.save) 
            true
        else
            availability.errors.messages 
        end     
    end
    def self.verificar_agendamento 
        return nil if(@start_day.blank?)
        return nil if(@end_day.blank?)
        return Availability.all.select{|x| 
            (x.start_date <=  @start_day || @end_day <= x.end_date) &&
            (@end_day >= x.start_date && x.end_date >=  @start_day) || 
            ( @start_day < x.start_date && x.end_date < @end_day)}   
    end
    def self.validar_data(date,days)
        return nil if(date.blank?)
        return nil if(days.blank?)
        @start_day = DateTime.parse("#{date} 10:00")   
        @end_day = DateTime.parse("#{date} 08:00").next_day(days) 
    end
end
 