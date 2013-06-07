require 'spec_helper'

describe Navi::Renderers::SimpleNavigation::GeneratesUri do

  describe '.execute' do
    subject { described_class.execute(template, item) }
    let(:template) { OpenStruct.new }
    let(:item) { OpenStruct.new(url: url) }

    context 'navigation item url is a string' do
      let(:url) { '/a/string' }
      it { should == '/a/string' }
    end

    context 'navigation item is not a string' do
      let(:url) { OpenStruct.new }

      context 'without a namespace' do
        before do
          template.stub(:polymorphic_path).with([url]) { '/generated/path' }
        end

        it 'should build the URL using the template polymorphic path' do
          expect(subject).to eq('/generated/path')
        end
      end

      context 'given a single namespace' do
        subject { described_class.execute(template, item, namespace: :admin) }

        before do
          template.stub(:polymorphic_path).with([:admin, url]) { '/admin/generated/path' }
        end

        it 'should build the URL using the template polymorphic path' do
          expect(subject).to eq('/admin/generated/path')
        end
      end

      context 'given multiple namespaces' do
        subject do
          described_class.execute(template, item, namespace: [:super, :admin])
        end

        before do
          template.stub(:polymorphic_path).with([:super, :admin, url]).
            and_return('/super/admin/generated/path')
        end

        it 'should build the URL using the template polymorphic path' do
          expect(subject).to eq('/super/admin/generated/path')
        end
      end
    end
  end

end
