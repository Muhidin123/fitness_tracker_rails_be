# frozen_string_literal: true

class CreateRodauthOtpSmsCodesRecoveryCodes < ActiveRecord::Migration[7.1]
  def change
    # Used by the otp feature
    create_table :account_otp_keys, id: false do |t|
      t.bigint :id, primary_key: true
      t.foreign_key :accounts, column: :id
      t.string :key, null: false
      t.integer :num_failures, null: false, default: 0
      t.datetime :last_use, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    # Used by the sms codes feature
    create_table :account_sms_codes, id: false do |t|
      t.bigint :id, primary_key: true
      t.foreign_key :accounts, column: :id
      t.string :phone_number, null: false
      t.integer :num_failures
      t.string :code
      t.datetime :code_issued_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    # Used by the recovery codes feature
    create_table :account_recovery_codes, primary_key: %i[id code] do |t|
      t.bigint :id
      t.foreign_key :accounts, column: :id
      t.string :code
    end
  end
end
