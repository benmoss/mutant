module Mutant
  class Matcher
    # Matcher against object space
    class ObjectSpace < self
      include Equalizer.new(:scope_name_pattern)

      PATTERN = %r(\A::(.+)\z)

      # Parse matcher
      #
      # @param [String] input
      #
      # @return [Matcher::ObjectSpace]
      #   returns object space matcher if successful
      #
      # @return [nil]
      #   returns nil otherwise
      #
      # @api private
      #
      def self.parse(input)
        match = PATTERN.match(input)
        return unless match

        new(%r(\A#{Regexp.escape(match[1])}(\z|::)))
      end

      # Enumerate subjects
      #
      # @return [Enumerator<Subject>]
      #   returns subject enumerator when no block given
      #
      # @return [self]
      #   returns self otherwise
      #
      # @api private
      #
      def each(&block)
        return to_enum unless block_given?

        scopes.each do |scope|
          emit_scope_matches(scope, &block)
        end

        self
      end

      # Return scope name pattern
      #
      # @return [Regexp]
      #
      # @api private
      #
      def scope_name_pattern; @scope_name_pattern; end

    private

      # Initialize object space matcher
      #
      # @param [Regexp] scope_name_pattern
      # @param [Enumerable<#each(scope)>] matchers
      #
      # @return [undefined]
      #
      # @api private
      #
      def initialize(scope_name_pattern, matchers = [Matcher::ScopeMethods::Singleton, Matcher::ScopeMethods::Instance])
        @scope_name_pattern, @matchers = scope_name_pattern, @matchers = matchers #[Method::Singleton, Method::Instance]
      end

      # Yield matchers for scope
      #
      # @param [::Class,::Module] scope
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit_scope_matches(scope, &block)
        @matchers.each do |matcher|
          matcher.new(scope).each(&block)
        end
      end

      # Return scope enumerator
      #
      # @return [Enumerable<Object>]
      #
      # @api private
      #
      def scopes(&block)
        return to_enum(__method__) unless block_given?

        ::ObjectSpace.each_object(Module) do |scope|
          emit_scope(scope, &block)
        end
      end

      # Yield scope if name matches pattern
      #
      # @param [::Module,::Class] scope
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit_scope(scope)
        if [::Module, ::Class].include?(scope.class) and @scope_name_pattern =~ scope.name
          yield scope
        end
      end
    end
  end
end
