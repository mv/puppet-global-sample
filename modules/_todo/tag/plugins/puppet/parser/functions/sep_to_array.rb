# 'Separator to array'
# ====================
#
# Add a puppet parser function called 'sep_to_array'
#   - param 1: a string in the format 'ruby:git:rvm'
#   - param 2: optional: list separator. Default ':'
#

module Puppet::Parser::Functions

  newfunction(:sep_to_array, :type => :rvalue) do |args|

    list = args[0]
    sep  = args[1] || ':'
    array = []

    list.split(sep).each do |item|
#     puts "value #{item}"
      array << item
    end

#   puts "array [#{array}]"
    return array

  end # newfunction

end # module Puppet::Parser::Functions


# vim:ft=ruby:

