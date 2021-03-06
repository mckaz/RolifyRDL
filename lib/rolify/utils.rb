module Rolify
  module Utils
    def deprecate(old_method, new_method)
      define_method(old_method) do |*args|
        warn "[DEPRECATION] #{caller.first}: `#{old_method}` is deprecated.  Please use `#{new_method}` instead."
        send(new_method, *args)
      end
    end
  end
end

#####################################################
cwd = File.expand_path("..", __FILE__)
require "#{cwd}/../../typesigs/rolify/utils_typesigs.rb"
#require "#{cwd}/../../typesigs/rolify/role_typesigs.rb"
require_relative '../cfg_pre.rb'
RDL::CFG.preprocess __FILE__
