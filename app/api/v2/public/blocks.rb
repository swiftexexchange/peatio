# encoding: UTF-8
# frozen_string_literal: true

module API
    module V2
      module Public
        class Blocks < Grape::API
          Blocks         = Struct.new(:height)

          desc 'Returns heights for currencies.'
          get '/blocks' do
            block_height = Blockchain.all do |b|
              Blockchain.new(b.height)
            end
            present block_height
          end
        end
      end
    end
  end