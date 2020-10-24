#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'



get '/' do
	erb :barber
end

post '/' do
	
	@login = params[:login]
	@password = params[:password]
	@a = "Неправильный login или password"

	if @login == "admin" && @password == "321654qw"

		erb :barber1     		       	
	else					
		erb :barber
	end
end	


get '/about' do
	erb :about
end

get '/something' do
	erb :something
end


get '/visit' do
	erb :visit
end	

get '/contacts' do
	erb :contacts
end

get '/guests' do
	erb :guests
end	

post "/visit" do
	@imy = params[:username]
	@telefon = params[:phone]
	@vremy = params[:time]
	@barb = params[:barber]
	@color = params[:colorpicker]

	# делаем хеш
	hh = {  :username => "Введите имя",
			:phone => 'Введите телефон',
			:time => 'Введите дату и время'}	

	@error = hh.select {|key,_| params[key] == ""}.values.join(", ")		

	if @error != ''
		return erb :visit			
	end	


	@title = "Спасибо!"
	@message = "Дорогой #{@imy}, будем вас ждать #{@vremy}, парикмахер #{@barb}, окрашивание в цвет #{@color}"

	File.open "./public/Users.txt", "a" do |q| 
		q.puts "Имя клиента: #{@imy}"  
		q.puts "Телефон: #{@telefon}"
		q.puts "Дата и время визита: #{@vremy}"
		q.puts "Парикмахер: #{@barb}"
		q.puts "Цвет окрашивания: #{@color}"
		q.close
	end

	erb :visit

end




post "/contacts" do
	@mail = params[:email]
	@text = params[:message]
	

	kont = {  :email => "Введите email",
			:message => 'Введите сообщение'}	

	@error = kont.select {|key,_| params[key] == ""}.values.join(", ")		

	if @error != ''
		return erb :contacts			
	end	

	File.open "./public/contacts.txt", "a" do |w| 
		w.puts "Email: #{@mail}"  
		w.puts "Mess: #{@text}"
		w.close
	end

	erb :contacts

end

post "/guests" do
	
	@login = params[:login]
	@password = params[:password]
	@a = "Неправильный login или password"

	if @login == "aaa" && @password == "123"

        
        	File.open "./public/Users.txt" do |f|
 
				f.each do |r|
					puts r
				end
			end
	else
		erb :guests		
	end




end