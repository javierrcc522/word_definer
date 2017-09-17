require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word_definer')
require('pry')



get('/') do
  @list = WordDefiner.all()
  erb(:list)
end

post('/') do
  define_word = params['define_word']
  word_meaning = params['word_meaning']
  attributes = {'define_word' => define_word, 'word_meaning' => word_meaning}
  define = WordDefiner.new(attributes)
  define.save()
  @list = WordDefiner.sort()
  erb(:list)
end

get('/define/:id') do
  @word = WordDefiner.find(params[:id])
  erb(:define)
end

post('/delete/:id') do
  @word = WordDefiner.find(params[:id])
  WordDefiner.remove_word(@word.id)
  erb(:define)
  redirect '/'
end

get('/update/:id') do
  @word = WordDefiner.find(params[:id])
  erb(:update)
end

post('/update/:id') do
  word_meaning = params['word_meaning']
  @word = WordDefiner.find(params[:id])
  WordDefiner.update(word_meaning, @word.id)
  erb(:update)

end
