class Url < ApplicationRecord
	before_create :shorten   
	validates :long_url, :presence => true, :format => URI::regexp(%w(http https))
    def shorten
        short =  [('a'..'z'),(0..9)].map{|i| i.to_a}.flatten
        short_url = (0..10).map{short[rand(short.length)]}.join 
        self.short_url = short_url
    end
end
