module AttrStat
  def attr_stat(kind, *attrs)
    attrs.each do |attr|
      instance_for_attr = "@#{attr}"

      define_method(attr) do
        instance_variable_get(instance_for_attr)
      end

      define_method("#{attr}=") do |arg|
        return instance_variable_set(instance_for_attr, arg) if arg.is_a? kind

        instance_variable_set(instance_for_attr, kind.new(name: attr.to_s, value: arg))
      end
    end
  end
end
