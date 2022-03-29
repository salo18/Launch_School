# ENV["RACK_ENV"] = "test"

# require "minitest/autorun"
# require "rack/test"
# require "fileutils"


# require_relative "../cms"

# class AppTest < Minitest::Test
#   include Rack::Test::Methods

#   def app
#     Sinatra::Application
#   end

#   def setup
#     FileUtils.mkdir_p(data_path)
#   end

#   def teardown
#     FileUtils.rm_rf(data_path)
#   end

#   def create_document(name, content = "")
#     File.open(File.join(data_path, name), "w") do |file|
#       file.write(content)
#     end
#   end

#   root = File.expand_path("..", __FILE__)
#   @files = Dir.glob(root + "/data/*").map do |path|
#     File.basename(path)
#   end

#   # NEED TO USE CREATE DOCUMENT METHOD TO CREATE DOCS WITH DUMMY TEXT AND TEST AGAINST THIS??

#   def test_index
#     # get "/"
#     # assert_equal 200, last_response.status
#     # assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
#     # assert_includes last_response.body, "about.md"
#     # assert_includes last_response.body, "changes.txt"
#     # assert_includes last_response.body, "history.txt"

#     create_document "about.md"
#     create_document "changes.txt"

#     get "/"

#     assert_equal 200, last_response.status
#     assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
#     assert_includes last_response.body, "about.md"
#     assert_includes last_response.body, "changes.txt"
#   end

#   def test_viewing_text
#     # get "/history.txt"
#     # assert_equal 200, last_response.status
#     # assert_equal "text/plain", last_response["Content-Type"]
#     # assert_includes last_response.body, "1993 - Yukihiro Matsumoto dreams up Ruby"

#     create_document("history.txt", "1990 was the best year in history")

#     get "/history.txt"
#     assert_equal 200, last_response.status
#     assert_equal "text/plain", last_response["Content-Type"]
#     assert_includes last_response.body, "1990 was the best year in history"
#   end

#   def test_document_not_found
#     get "/notafile.ext" # Attempt to access a nonexistent file

#     assert_equal 302, last_response.status # Assert that the user was redirected

#     get last_response["Location"] # Request the page that the user was redirected to

#     assert_equal 200, last_response.status
#     assert_includes last_response.body, "notafile.ext does not exist"

#     get "/" # Reload the page
#     refute_includes last_response.body, "notafile.ext does not exist" # Assert that our message has been removed
#   end

#   def test_text_renders_as_markdown
#     create_document("about.md", "# Ruby is...")
#     get "/about.md"
#     assert_equal 200, last_response.status
#     assert_equal "text/html;charset=utf-8", last_response["Content-Type"]

#     assert_includes last_response.body, "<h1>Ruby is...</h1>"
#   end

#   def test_edit_page
#     create_document("about.md", "<h1>What's up</h1>")

#     get "/about.md/edit"
#     assert_equal 200, last_response.status
#   end

#   def test_editing_document
#     create_document("changes.txt")

#     get "/changes.txt/edit"

#     assert_equal 200, last_response.status
#     assert_includes last_response.body, "<textarea"
#     assert_includes last_response.body, %q(<button type="submit")
#   end

#   def test_updating_document
#     post "/changes.txt", content: "new content"

#     assert_equal 302, last_response.status

#     get last_response["Location"]

#     assert_includes last_response.body, "changes.txt has been updated"

#     get "/changes.txt"
#     assert_equal 200, last_response.status
#     assert_includes last_response.body, "new content"
#   end

# end


ENV["RACK_ENV"] = "test"

require "fileutils"

require "minitest/autorun"
require "rack/test"

require_relative "../cms"

class CMSTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def session
    last_request.env["rack.session"]
  end

  def test_index
    create_document "about.md"
    create_document "changes.txt"

    get "/"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
  end

  def test_viewing_text_document
    create_document "history.txt", "Ruby 0.95 released"

    get "/history.txt"

    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "Ruby 0.95 released"
  end

  def test_viewing_markdown_document
    create_document "about.md", "# Ruby is..."

    get "/about.md"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>Ruby is...</h1>"
  end

  def test_document_not_found
    get "/notafile.ext"

    assert_equal 302, last_response.status
    assert_equal  "notafile.ext does not exist", session[:message]


    get last_response["Location"]

    assert_equal 200, last_response.status
    # assert_includes last_response.body, "notafile.ext does not exist"
    # assert_equal session[:message], "notafile.ext does not exist"
  end

  # def test_editing_document
  #   create_document "changes.txt"

  #   get "/changes.txt/edit"

  #   assert_equal 200, last_response.status
  #   assert_includes last_response.body, "<textarea"
  #   assert_includes last_response.body, %q(<button type="submit")
  # end

  def test_updating_document
    post "/changes.txt", content: "new content"

    assert_equal 302, last_response.status
    assert_equal "changes.txt has been updated.", session[:message]


    get last_response["Location"]

    assert_includes last_response.body, "changes.txt has been updated."



    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end

  # def test_add_new_file
  #   get "/new"

  #   assert_equal 200, last_response.status
  #   assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
  #   # assert_includes last_response.body, "<h1>Ruby is...</h1>"


  #   post "/new/file"

  # end

  # def test_view_new_document_form
  #   get "/new"

  #   assert_equal 200, last_response.status
  #   assert_includes last_response.body, "<input"
  #   assert_includes last_response.body, %q(<button type="submit")
  # end

  def test_create_new_document
    post "/new/file", filename: "test.txt"
    assert_equal 302, last_response.status
    assert_equal "test.txt has been created.", session[:message]


    get last_response["Location"]
    assert_includes last_response.body, "test.txt has been created"

    get "/"
    assert_includes last_response.body, "test.txt"
  end

  def test_create_new_document_without_filename
    post "/new/file", filename: ""
    assert_equal 442, last_response.status
    assert_includes last_response.body, "A name is required"
    # assert_equal session[:message], "A name is required"

  end

  def test_delete_file
    create_document "history.txt"

    get "/"
    assert_equal 200, last_response.status
    refute_includes last_response.body, %q(href="/test.txt")

    post "/history.txt/delete"
    assert_equal 302, last_response.status
    assert_equal 'history.txt has been deleted.', session[:message]

    # get last_response["Location"]
    # assert_includes last_response.body, "test.txt has been deleted"
  end

  def test_login_form
    get "/login"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  # def test_login
  #   post "/login", username: "admin", password: "secret"
  #   assert_equal 302, last_response.status
  #   assert_equal "Welcome!", session[:message]
  #   assert_equal "admin", session[:username]

  #   get last_response["Location"]
  #   assert_includes last_response.body, "Signed in as admin"
  # end

  # def test_signin_with_bad_credentials
  #   post "/login", username: "guest", password: "shhhh"
  #   assert_equal 302, last_response.status
  #   assert_nil session[:username]
  #   assert_includes last_response.body, "Invalid credentials"
  # end

  # def test_signout
  #   # post "/login", username: "admin", password: "secret"
  #   # get last_response["Location"]
  #   # assert_includes last_response.body, "Welcome"

  #   # post "/logout"
  #   # get last_response["Location"]

  #   # assert_includes last_response.body, "You have been signed out"
  #   # assert_includes last_response.body, "Sign In"

  #   get "/", {}, {"rack.session" => { username: "admin" } }
  #   assert_includes last_response.body, "Signed in as admin"

  #   post "/users/signout"
  #   assert_equal "You have been signed out", session[:message]

  #   get last_response["Location"]
  #   assert_nil session[:username]
  #   assert_includes last_response.body, "Sign In"
  # end

  # def sign_in_user
  #   # Submit the sign in form
  #   post "/users/signin", username: "admin", password: "secret"

  #   # Verify the user is signed in
  #   assert_equal "admin", session[:username]
  # end

  def admin_session
    { "rack.session" => { username: "admin" } }
  end


 def test_editing_document
    create_document "changes.txt"

    get "/changes.txt/edit", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, %q(<button type="submit")
  end

  # def signed_in?
  #   if session[:signed_in] == false
  #     session[:message] = "error - can't access page because not signed in"
  #     redirect "/"
  #   end
  # end
  def test_editing_document_signed_out
    create_document "changes.txt"

    get "/changes.txt/edit"

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_updating_document
    post "/changes.txt", {content: "new content"}, admin_session

    assert_equal 302, last_response.status
    assert_equal "changes.txt has been updated.", session[:message]

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end

  def test_updating_document_signed_out
    post "/changes.txt", {content: "new content"}

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_view_new_document_form
    get "/new", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_view_new_document_form_signed_out
    get "/new"

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_create_new_document
    post "/create", {filename: "test.txt"}, admin_session
    assert_equal 302, last_response.status
    assert_equal "test.txt has been created.", session[:message]

    get "/"
    assert_includes last_response.body, "test.txt"
  end

  def test_create_new_document_signed_out
    post "/create", {filename: "test.txt"}

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_create_new_document_without_filename
    post "/create", {filename: ""}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name is required"
  end

  def test_deleting_document
    create_document("test.txt")

    post "/test.txt/delete", {}, admin_session
    assert_equal 302, last_response.status
    assert_equal "test.txt has been deleted.", session[:message]

    get "/"
    refute_includes last_response.body, %q(href="/test.txt")
  end

  def test_deleting_document_signed_out
    create_document("test.txt")

    post "/test.txt/delete"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end
end
