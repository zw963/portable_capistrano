module Gem
  @@win_platform = nil

  WIN_PATTERNS = [
    /bccwin/i,
    /cygwin/i,
    /djgpp/i,
    /mingw/i,
    /mswin/i,
    /wince/i,
  ].freeze

  def self.win_platform?
    if @@win_platform.nil?
      ruby_platform = RbConfig::CONFIG['host_os']
      @@win_platform = !!WIN_PATTERNS.find { |r| ruby_platform =~ r }
    end

    @@win_platform
  end

  class LoadError < StandardError
  end

  class Deprecate
    def self.skip
      true
    end
  end
end

def gem(*args)
end

require 'rubygems/version'
