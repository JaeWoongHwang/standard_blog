require 'sinatra'

get '/' do
  erb :index
end

get '/write' do
 # 글을 저장

# 홈에서 날린 데이터를 파라미터로 받는다
 @title = params["title"]
 @content = params["content"]

  File.open("blog.txt", "a") do |f|
    # 어떻게 쓰는지가 중요
    f.write("title : #{@title}, content : #{@content}")
    f.write("\n")
  end

  erb :write #글이 성공적으로 작성되었습니다.
end

get '/show' do
  @list = []
  File.open("blog.txt", "r") do |f|
    f.each_line do |line|
      @list << line
    end
  end
  erb :show
end
