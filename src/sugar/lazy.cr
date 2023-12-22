module Sugar
  # Define a "lazy" property (essentially sugar for memoization) that
  # returns a value that is computed the the first time the property
  # is accessed. Example:
  #
  # ```
  # class Num(T)
  #   def initialize(@value : T); end
  #
  #   lazy square : T { @value.abs2 }
  #   lazy twice : T do
  #     @value * 2
  #   end
  # end
  # ```
  #
  # (Inspired by Swift's `lazy var` declaration.)
  macro lazy(var, &valuator)
    {% if var.is_a? TypeDeclaration %}
      {% v_id = var.var %}
      {% v_typ = var.type %}
      @{{v_id}} : {{v_typ}}?
      def {{v_id}} : {{v_typ}}
        @{{v_id}} ||= _lazy_{{v_id}}_fetch
      end
      def _lazy_{{v_id}}_fetch
        {{valuator.body}}
      end
    {% elsif var.is_a? Call %}
      {% raise "Cannot infer type of `#{var.id}`, declare with type T like so:\nlazy #{var.id} : T #{valuator}\n\n" %}
    {% else %}
      {% raise "#{var.id} is #{var.class_name}, unsupported argument type" %}
    {% end %}
  end
end
