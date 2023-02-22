class Magazine
    attr_accessor :name, :category

    @@all = []

    def initialize(name, category)
        @name = name
        @category = category
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        all.find { |magazine| magazine.name == name }
    end

    def contributors
        # select the Article.all array to filter out only those articles where the magazine attribute matches the current instance of the Magazine class
        # map to extract the author attribute from each Article object
        Author.all.select { |article| article.magazine == self }.map { |article| article.author }.uniq
    end

    def self.find_by_name(name)
        @@all.find { |magazine| magazine.name }
    end
    
    def article_titles
        titles = []
        Article.all.each do |article|
            if article.magazine == self
                titles << article.title
            end
        end
        titles
    end

    def contributing_authors
        #create an empty hash to store count of articles
        author_counts = {}

        #iterate over all Article instance and check if magazine matches he Magazine instance 
        Article.all.each do |article|
            if article.magazine == self
                author = article.author
                if author_counts[author]
                    author_counts[author] += 1
                else
                    author_counts[author] = 1
                end
            end
        end
        contributors = []

        #iterating over the hash and add the authors with an article greater than 2
        author_counts.each do |author, count|
            if count > 2
                contributors << author
            end
        end
        contributors
    end
end


