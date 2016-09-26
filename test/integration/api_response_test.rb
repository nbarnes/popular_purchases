
require 'test_helper'

class ApiResponseTest < ActionDispatch::IntegrationTest

  test 'Blank username fails with blank username error' do
    get popular_purchases_path, format: :json, params: { username: '' }
    body = JSON.parse(response.body)
    body.must_equal JSON.parse('{ "data": "Cannot look up blank username" }')
  end

  test 'Unfound username fails with unfound username error' do
    get popular_purchases_path, format: :json, username: 'steve'
    body = JSON.parse(response.body)
    body.must_equal JSON.parse('{ "data": "User with username of steve was not found." }')
  end

  test 'Found username succeeds with expected data' do
    get popular_purchases_path, format: :json, username: 'Morgan_Barton'
    body = JSON.parse(response.body)
    body.must_equal JSON.parse('{ "data": "[{:id=&gt;637806, :face=&gt;&quot;ᕕ( ᐛ )ᕗ&quot;, :price=&gt;452, :size=&gt;21, :recent=&gt;[&quot;Morgan_Barton&quot;, &quot;Felicia44&quot;]}, {:id=&gt;96195, :face=&gt;&quot;ᕕ( ᐛ )ᕗ&quot;, :price=&gt;325, :size=&gt;17, :recent=&gt;[&quot;Morgan_Barton&quot;, &quot;London.Keebler&quot;, &quot;Aida_Conroy71&quot;, &quot;Aida_Conroy71&quot;]}, {:id=&gt;187478, :face=&gt;&quot;༼ ºل͟º ༽&quot;, :price=&gt;462, :size=&gt;20, :recent=&gt;[&quot;Morgan_Barton&quot;, &quot;Morgan_Barton&quot;, &quot;Zula.Kilback&quot;, &quot;Adalberto_Hamill&quot;]}, {:id=&gt;469837, :face=&gt;&quot;¯_(ツ)_/¯&quot;, :price=&gt;7, :size=&gt;37, :recent=&gt;[&quot;Morgan_Barton&quot;, &quot;Felicia44&quot;]}, {:id=&gt;187478, :face=&gt;&quot;༼ ºل͟º ༽&quot;, :price=&gt;462, :size=&gt;20, :recent=&gt;[&quot;Morgan_Barton&quot;, &quot;Morgan_Barton&quot;, &quot;Zula.Kilback&quot;, &quot;Adalberto_Hamill&quot;]}]" }')
  end



end
