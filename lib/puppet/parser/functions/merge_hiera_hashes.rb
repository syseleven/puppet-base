require 'hiera'

module Puppet::Parser::Functions
  newfunction(:merge_hiera_hashes, :type => :rvalue, :doc => <<-'ENDHEREDOC') do |args|
    Merges the hiera hashes supplied as arguments. Takes an array of Strings
    containing Hiera names and an optional name space to qualify this array's
    entries with.

    Example:

    Given the following Hiera hash,

        my::hash1:
          one: 1
          two: 2
        my::hash2:
          one: 'one'
          three: 3

    this assignment:

      $res = merge_hiera_hashes(['my::hash1', 'my::hash2'])

    would place the following result hash in $res:

      $res =  {'one' => 'one', 'two' => 2, 'three' => 3}

    If a key occurs multiple times, the value in the rightmost Hiera hash will
    end up in the final hash under that key.

    Alternatively, the same result can be obtained by specifying a Hiera name
    space as follows:

      $res = merge_hiera_hashes(['hash1', 'hash2'], 'my')

    ENDHEREDOC

    if args.length < 1
      raise Puppet::ParseError, ("merge_hiera_hashes(): wrong number of arguments (#{args.length}; needs at least one argument)")
    end

    names = args.shift()   # Names to look up

    namespace = nil        # Optional Name space to qualify lookups with

    unless ( args.empty? )
      if ( (args.first.class == String) and args.first != '' )
        namespace = args.shift()
      end
    end

    res = Hash.new         # Will hold results

    names.each do |name|
      unless name.is_a?String
        warning("merge_hiera_hashes: This does not look like a hiera name #{name.class.to_s} (expected String), skipping.")
        next
      end

      unless ( namespace.nil? )
        name = [namespace, name].join('::')
      end

      begin
        hiera_res = function_hiera_hash([name])
      rescue => e
        warning("merge_hiera_hashes: Hiera lookup of #{name} (namespace: #{namespace}) failed: '#{e.to_s}', skipping.")
        next
      end

      unless hiera_res.is_a?(Hash)
        warning("merge_hiera_hash: Unexpected type #{hiera_res.class} for #{name} (expeced Hash), skipping.")
        next
      end

      res.merge!(hiera_res)
    end

    res
  end
end
