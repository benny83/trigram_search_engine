module HomeHelper
  def generate_countries_name_table
    ''.tap do |html|
      @countries.each_slice(10) do |group|
        html << "<tr>#{build_rows(group)}</tr>"
      end
    end.html_safe
  end

  private

  def build_rows(group)
    group.each_with_object('') { |c, memo| memo << "<td>#{c.name}</td>" }
  end
end
