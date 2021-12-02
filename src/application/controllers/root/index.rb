# frozen_string_literal: true

module Application
  module Controllers
    module Root
      class Index < Hanami::Action
        def handle(_req, res)
          res.format = format(:json)
          res.body = { ok: 200 }.to_json
        end
      end
    end
  end
end
