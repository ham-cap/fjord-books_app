# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'
    fill_in 'タイトル', with: 'hogehoge'
    fill_in 'メモ', with: 'Interesting!'
    fill_in '著者', with: 'Me'
    click_on '登録する'
    assert_text '本が作成されました。'
    click_on '戻る'
    assert_text 'hogehoge'
    assert_text 'Interesting!'
    assert_text 'Me'
  end

  test 'updating a Book' do
    visit books_url
    assert_text 'fugafuga'
    assert_text 'Excellent!'
    assert_text 'Bar'
    click_on '編集', match: :prefer_exact
    fill_in 'タイトル', with: 'piyopiyo'
    fill_in 'メモ', with: 'Great!'
    fill_in '著者', with: 'Foo'
    click_button '更新する'
    assert_text '本が更新されました。'
    click_on '戻る'
    assert_text 'piyopiyo'
    assert_text 'Great!'
    assert_text 'Foo'
  end

  test 'destroying a Book' do
    visit books_url
    assert_text 'fugafuga'
    assert_text 'Excellent!'
    assert_text 'Bar'
    page.accept_confirm do
      click_on '削除', match: :first
    end
    assert_text '本が削除されました。'
    assert_no_text 'fugafuga'
    assert_no_text 'Excellent!'
    assert_no_text 'Bar'
  end
end
