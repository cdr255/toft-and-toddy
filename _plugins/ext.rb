require 'jekyll/scholar'
require 'uri'
require 'font-awesome-sass'

module MarkdownFilter
  class Markdowny < BibTeX::Filter
    def apply(value)
      value.to_s.gsub(URI.regexp(['http','https','ftp'])) { |c| "<a href='#{$&}'>#{$&}</a>" }
    end
  end
end
