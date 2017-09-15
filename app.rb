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
  word_being_define = {'define_word' => define_word, 'word_meaning' => word_meaning}
  define = WordDefiner.new(word_being_define)
  define.save()
  @list = WordDefiner.sort()
  erb(:list)
end

get('/define/:id') do
  @define = WordDefiner.find(params[:id])
  erb(:define)
end

post('/delete/:id') do
  @define = WordDefiner.find(params[:id])
  WordDefiner.remove_word(@define.id)
  erb(:define)
  redirect '/'
end
