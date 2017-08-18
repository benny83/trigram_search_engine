class HomeController < ActionController::Base
  layout 'application'

  def index
    @countries ||= Country.all.each_with_object({}) { |c, hash| hash[c.id] = test_parse(c.name.downcase) }

    if params[:chars]
      params[:chars].downcase!
      result = {}
      @countries.each do |id, arr|
        uuu = if params[:chars].length == 1
                [params[:chars]]
              elsif params[:chars].length == 2
                [params[:chars][0], params[:chars][0..1] ,params[:chars][1]]
              else
                test_parse(params[:chars])
              end
        result[id] = (arr & uuu).count if (arr & uuu).present?
      end
      @final =  Hash[result.sort_by { |k,v| v }.reverse].keys.first(10)
    end


    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def test_parse(string)
    result = [string[0...1], string[0...2]]
    string.length.times { |i| result << string[i...i + 3] }
    result
  end
end
