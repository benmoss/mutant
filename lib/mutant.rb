require 'backports'
require 'set'
require 'adamantium'
require 'ice_nine'
require 'abstract_type'
require 'descendants_tracker'
require 'securerandom'
require 'equalizer'
require 'digest/sha1'
require 'inflecto'
require 'to_source'
require 'ice_nine'
require 'diff/lcs'
require 'diff/lcs/hunk'
require 'rspec'

# Patch ice none to freeze nodes correctly
class IceNine::Freezer
  # Rubinius namsepace
  class Rubinius
    # AST namespace
    class AST < IceNine::Freezer::Object
      # Node configuration
      class Node < IceNine::Freezer::Object
      end
    end
  end
end

# Library namespace
module Mutant
end

require 'mutant/singleton_methods'
require 'mutant/constants'
require 'mutant/support/method_object'
require 'mutant/helper'
require 'mutant/random'
require 'mutant/mutator'
require 'mutant/mutation'
require 'mutant/mutation/filter'
require 'mutant/mutation/filter/code'
require 'mutant/mutation/filter/whitelist'
require 'mutant/mutator/registry'
require 'mutant/mutator/util'
require 'mutant/mutator/util/array'
require 'mutant/mutator/util/symbol'
require 'mutant/mutator/node'
require 'mutant/mutator/node/noop'
require 'mutant/mutator/node/literal'
require 'mutant/mutator/node/literal/boolean'
require 'mutant/mutator/node/literal/range'
require 'mutant/mutator/node/literal/symbol'
require 'mutant/mutator/node/literal/string'
require 'mutant/mutator/node/literal/fixnum'
require 'mutant/mutator/node/literal/float'
require 'mutant/mutator/node/literal/array'
require 'mutant/mutator/node/literal/empty_array'
require 'mutant/mutator/node/literal/hash'
require 'mutant/mutator/node/literal/regex'
require 'mutant/mutator/node/literal/nil'
require 'mutant/mutator/node/block'
require 'mutant/mutator/node/while'
require 'mutant/mutator/node/super'
require 'mutant/mutator/node/send'
require 'mutant/mutator/node/send/with_arguments'
require 'mutant/mutator/node/send/binary_operator_method'
require 'mutant/mutator/node/when'
require 'mutant/mutator/node/assignment'
require 'mutant/mutator/node/define'
require 'mutant/mutator/node/formal_arguments_19'
require 'mutant/mutator/node/formal_arguments_19/default_mutations'
require 'mutant/mutator/node/formal_arguments_19/require_defaults'
require 'mutant/mutator/node/formal_arguments_19/pattern_argument_expansion'
require 'mutant/mutator/node/actual_arguments'
require 'mutant/mutator/node/pattern_arguments'
require 'mutant/mutator/node/pattern_variable'
require 'mutant/mutator/node/default_arguments'
require 'mutant/mutator/node/return'
require 'mutant/mutator/node/iter_19'
require 'mutant/mutator/node/if'
require 'mutant/mutator/node/receiver_case'
require 'mutant/loader'
require 'mutant/context'
require 'mutant/context/scope'
require 'mutant/subject'
require 'mutant/matcher'
require 'mutant/matcher/chain'
require 'mutant/matcher/object_space'
require 'mutant/matcher/method'
require 'mutant/matcher/method/singleton'
require 'mutant/matcher/method/instance'
require 'mutant/matcher/scope_methods'
require 'mutant/matcher/method/classifier'
require 'mutant/killer'
require 'mutant/killer/static'
require 'mutant/killer/rspec'
require 'mutant/killer/forking'
require 'mutant/strategy'
require 'mutant/strategy/rspec'
require 'mutant/strategy/rspec/example_lookup'
require 'mutant/runner'
require 'mutant/cli'
require 'mutant/color'
require 'mutant/differ'
require 'mutant/reporter'
require 'mutant/reporter/stats'
require 'mutant/reporter/null'
require 'mutant/reporter/cli'
