
get '/:birthdate' do
   setup_index_view
end



def setup_index_view
    birthdate = params[:birthdate]
    coded_number = Person.birth_number(birthdate)
    @message = Person.correct_message(coded_number)
    erb :index
end



get '/' do
 erb :form
end


get '/message/:birth_number' do
    birth_number = params[:birth_number].to_i
	@message = Person.correct_message(birth_number)
	erb :index
end
	
post '/' do
   birthdate = params[:birthdate].gsub("-", "")
   if Person.valid_birthdate(birthdate)
     birth_number = Person.birth_number(birthdate)
     redirect "/message/#{birth_number}"
   else
     @error = "You should enter a valid birthdate in the form of mmddyyyy."
	 erb:form
   end
end



