class DemoController < ApplicationController
  def index
    #@post = Post.new
    #respond_to do |format|
      #format.html # new.html.erb
      #format.json { render json: @post }
    #end
  end
  def excel_import
    require 'rubygems'
    require 'spreadsheet'
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open params['excel_file'].path
    sheet1 = book.worksheet 0
    sheet1.each do |row|
      # you can do any interesing thing with row
      Post.new(:name => row[0], :title => row[1]).save
    end
  end
  def create
    excel_import
  end
end
