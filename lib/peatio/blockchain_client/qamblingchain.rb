# encoding: UTF-8
# frozen_string_literal: true

module BlockchainClient
  class Qamblingchain < Bitcoin

    def get_block(block_hash)
      json_rpc(:getblock, [block_hash, true]).fetch('result')
    end
    
    def get_raw_transaction(txid)
      json_rpc(:getrawtransaction, [txid, 1]).fetch('result')
    end

    def get_unconfirmed_txns
      json_rpc(:getrawmempool).fetch('result')
    end
  end
end
