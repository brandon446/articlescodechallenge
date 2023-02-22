class Author
    @@all = []

    attr_reader :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def articles
        #returns an array of Article objects that the author has written.
        # select the Article.all array to filter out only those articles where the author attribute matches the current instance of the Author class
        Article.all.select { |article| article.author == self }
    end

    def magazines
        #call the articles method to get array of Article instances 
        #use map to get magizine for each Article instance 
        self.articles.map { |article| article.magazine }.uniq
    end

    def add_article(magazine, title)
        # self refers to the current instance of the Author class. eg Author.new("Bernard")
        Article.new(self, magazine, title)
    end

    def topic_areas
        #stores the cagetories of the magazines
        categories =[]

        # iterate the Article instances written by the author
        self.articles.each do |article|

            # for each article, get the category of the magazine 
            category = article.magazine.category

            # append the category to categories array in its not there
            categories << category unless categories.include?(category)
        end
        # return categories
        categories
    end

end