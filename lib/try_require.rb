def try_require(what, &block)
  loaded, require_result = false, nil 

  begin
    require_result = require what
    loaded = true 

  rescue Exception => ex
    puts "** Unable to require '#{what}'"
    puts "--> #{ex.class}: #{ex.message}"
  end 

  yield if loaded and block_given? 

  require_result
end

