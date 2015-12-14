require 'spec_helper'

describe Kusari do
  it 'has a version number' do
    expect(Kusari::VERSION).not_to be nil
  end

  let(:generator) { Kusari::Generator.new }
  before do
    generator.add_string("ネロとパトラッシュは、この世で二人きりでした。")
    generator.add_string("彼らは、実の兄弟よりも仲のよい大の親友でした。")
    generator.add_string("ネロは、アルデンネ生まれの少年でした。")
  end

  it 'generates a random sentence' do
    expect(generator.generate(140)).to be_an_instance_of(String)
  end
end
