# 'Separator to hash'
# ===================
#
# Add a puppet parser function called 'sep_to_hash'
#   - param 1: a string in the format 'api:db:ws'
#   - param 2: optional: list separator. Default ':'
#

module Puppet::Parser::Functions

  newfunction(:sep_to_hash, :type => :rvalue) do |args|

    list = args[0]
    sep  = args[1] || ':'
    hash = {}

    list.split(sep).each do |item|
#     puts "value #{item}"
      hash[item] = true
    end

    return hash

  end # newfunction

end # module Puppet::Parser::Functions


# vim:ft=ruby:

