require "spec_helper"

RSpec.describe String do
  describe '.split_with_display_width_from_start' do
    subject {str.split_with_display_width_from_start(num)}
    describe '全角のみ' do
      let(:str) {'あいうえお'}
      context '収まる'.shellsplit do
        let(:num) {10}
        it {expect(subject[0]).to eq 'あいうえお'}
        it {expect(subject[1]).to eq ''}
      end
      context '収まらない' do
        let(:num) {9}
        it {expect(subject[0]).to eq 'あいうえ'}
        it {expect(subject[1]).to eq 'お'}
      end
    end

    describe '半角のみ' do
      let(:str) {'1234567890'}
      context '収まる'.shellsplit do
        let(:num) {10}
        it {expect(subject[0]).to eq '1234567890'}
        it {expect(subject[1]).to eq ''}
      end
      context '収まらない' do
        let(:num) {9}
        it {expect(subject[0]).to eq '123456789'}
        it {expect(subject[1]).to eq '0'}
      end
    end

    describe '混合' do
      let(:str) {'あ34567890'}
      context '収まる'.shellsplit do
        let(:num) {10}
        it {expect(subject[0]).to eq 'あ34567890'}
        it {expect(subject[1]).to eq ''}
      end
      context '収まらない' do
        let(:num) {9}
        it {expect(subject[0]).to eq 'あ3456789'}
        it {expect(subject[1]).to eq '0'}
      end
      context '収まらない混合' do
        let(:str) {'123456789あ0'}
        let(:num) {10}
        it {expect(subject[0]).to eq '123456789'}
        it {expect(subject[1]).to eq 'あ0'}
      end
    end
  end
  describe '.split_with_display_width_from_end' do
    subject {str.split_with_display_width_from_end(num)}
    describe '全角のみ' do
      let(:str) {'あいうえお'}
      context '収まる'.shellsplit do
        let(:num) {10}
        it {expect(subject[0]).to eq ''}
        it {expect(subject[1]).to eq 'あいうえお'}
      end
      context '収まらない' do
        let(:num) {9}
        it {expect(subject[0]).to eq 'あ'}
        it {expect(subject[1]).to eq 'いうえお'}
      end
    end

    describe '半角のみ' do
      let(:str) {'1234567890'}
      context '収まる'.shellsplit do
        let(:num) {10}
        it {expect(subject[0]).to eq ''}
        it {expect(subject[1]).to eq '1234567890'}
      end
      context '収まらない' do
        let(:num) {9}
        it {expect(subject[0]).to eq '1'}
        it {expect(subject[1]).to eq '234567890'}
      end
    end

    describe '混合' do
      let(:str) {'あ34567890'}
      context '収まる'.shellsplit do
        let(:num) {10}
        it {expect(subject[0]).to eq ''}
        it {expect(subject[1]).to eq 'あ34567890'}
      end
      context '収まらない' do
        let(:num) {9}
        it {expect(subject[0]).to eq 'あ'}
        it {expect(subject[1]).to eq '34567890'}
      end
      context '収まらない混合' do
        let(:str) {'1あ234567890'}
        let(:num) {10}
        it {expect(subject[0]).to eq '1あ'}
        it {expect(subject[1]).to eq '234567890'}
      end
    end
  end
end
