require 'sinatra'

get '/people' do
   @people = Person.all
   erb :"/people/index"
end

get '/people/:id' do
   @person = Person.find(params[:id])
   birthdate_string = @person.birthdate.strftime("%m%d%y")
   birth_number = Person.birth_number(birthdate_string)
   @message = Person.correct_message(birth_number)
   erb :"people/show"
end