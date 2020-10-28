require_relative '../config/initializer'
RSpec.describe Availability do
  begin
    last_data = Availability.all.order(end_date: :desc).first.end_date.next_day
  rescue
    last_data = Date.today  
  end
  
  it 'faltando nome' do  
    expect(Availability.call((last_data.next_day(1)).strftime('%Y-%m-%d'),2, nil)).to have_key(:client_name)
  end
 
  it 'primeiro teste' do 
    expect(Availability.call(last_data.strftime('%Y-%m-%d'),1, "xxx")).to eq(true)
  end
  it 'agendar para o mesmo dia do primeiro teste' do 
    expect(Availability.call(last_data.strftime('%Y-%m-%d'),1, "xxx")).to eq(false)
  end

  it 'segundo teste' do 
    expect(Availability.call((last_data.next_day(4)).strftime('%Y-%m-%d'),4, "xxx")).to eq(true)
  end
  it 'agendar nos primeiros dias do segundo teste' do 
    expect(Availability.call((last_data.next_day(4)).strftime('%Y-%m-%d'),2, "xxx")).to eq(false)
  end
  it 'agendar nos ultimos dias do segundo teste' do 
    expect(Availability.call((last_data.next_day(6)).strftime('%Y-%m-%d'),2, "xxx")).to eq(false)
  end

end

