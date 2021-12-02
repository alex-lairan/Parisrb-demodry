# frozen_string_literal: true

module Application
  Router = Hanami::Router.new do
    root to: Controllers::Root::Index.new
  end
end
