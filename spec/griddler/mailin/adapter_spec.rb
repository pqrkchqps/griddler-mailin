require 'spec_helper'

describe Griddler::Mailin::Adapter do
  it 'registers itself with griddler' do
    expect(Griddler.adapter_registry[:mailin]).to eq Griddler::Mailin::Adapter
  end
end

describe Griddler::Mailin::Adapter, '.normalize_params' do
  it 'normalizes parameters' do
    expect(Griddler::Mailin::Adapter.normalize_params(mailin_object)).to eq({
      to: ['Robert Recipient <bobrecipent@example.com>'],
      cc: ['Carbon Copy <carboncopy@example.com>'],
      from: 'Sandy Sender <sandysender@example.com>',
      subject: 'the subject',
      text: 'the body',
      html: 'the body'
    })
  end

  def mailin_object
    {'mailinMsg' =>
      {
       'html' => 'the body',
       'text' => 'the body',
       'subject' => "the subject",
       'from' => [
         {
           "address" => "sandysender@example.com",
           "name" => "Sandy Sender"
         }
       ],
       'to' => [
         {
           "address" => "bobrecipent@example.com",
           "name" => "Robert Recipient"
         }
       ],
       'date' => "2014-07-07T04:11:13.000Z",
       'cc' => [
         {
           "address" => "carboncopy@example.com",
           "name" => "Carbon Copy"
         }
       ],
       'attachments' => []
      }
    }
  end
end
