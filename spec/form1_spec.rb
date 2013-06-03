require File.expand_path('spec/spec_helper')

describe 'Form1' do
  before do
    visit "/"
  end

  it "Прокрутка к первому шагу формы" do
    click_link 'Заполните анкету'
    page.should have_content('Заполните анкету и станьте клиентом Банка')
    page.find('.formBlock1').visible?
  end

  it "Проверка работы валидации" do
    click_link 'Заполните анкету'
    find('.formBlock1').click_button 'Далее'
    find('.formBlock1').all('.textfield.textfieldError').size.should == 6
    find('.formBlock1').find('.accessError').should be
  end


end
