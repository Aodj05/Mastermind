module Color
    private

    COLOR_LIST = %w[red orange yellow green blue purple].freeze

    def give_color_options
        print "The list of colors are: "
        COLOR_LIST.each { |color| print "#{color} "}
    end

    def create_rand_color
        COLOR_LIST[rand(1..COLOR_LIST.length) - 1]
    end
end