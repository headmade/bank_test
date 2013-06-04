require File.expand_path('spec/spec_helper')

describe 'Form1' do
  before do
    visit "/"
    @attributes = {
      maf_first_name: "Имя",
      maf_last_name: "Фамилия",
      maf_second_name: "Отчество",
      maf_email: "mail@mail.ru",
      maf_mobile_phone:  "9170000000",
      maf_birth_date: "01011980",
    }
  end

  it "Прокрутка к первому шагу формы" do
    pending
    click_link 'Заполните анкету'
    page.should have_content('Заполните анкету и станьте клиентом Банка')
    page.find('.formBlock1').visible?
  end

  it "Проверка работы валидации" do
    pending
    click_link 'Заполните анкету'
    find('.formBlock1').click_button 'Далее'
    find('.formBlock1').all('.textfield.textfieldError').size.should == 6
    find('.formBlock1').find('.accessError').should be
  end

  it "Переход на второй шаг" do
    click_link 'Заполните анкету'
    within '.formBlock1' do
      @attributes.each do |key, value|
        fill_in key, :with => value
      end
      check "maf_accept_rules"
      choose "М"
    end
    find('.formBlock1').click_button 'Далее'
    find('.formBlock1').all('.textfield.textfieldError').size.should_not be
    find('.formBlock1').find('.accessError').should_not be
  end

end
