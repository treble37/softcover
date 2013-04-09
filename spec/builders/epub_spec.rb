require 'spec_helper'

describe Polytexnic::Builders::Epub do
  context "in valid TeX directory" do
    before do
      chdir_to_book
      clean!
    end

    describe "#build!" do
      subject(:builder) { Polytexnic::Builders::Epub.new }
      before { builder.build! }

      describe "mimetype file" do
        it "should exist in the right directory" do
          expect('epub/mimetype').to exist
        end

        it "should have the right contents" do
          File.open('epub/mimetype') do |f|
            expect(f.read).to match(/application\/epub\+zip/)
          end
        end
      end

      describe "META-INF" do
        it "should have the right container file" do
          pending
        end

        it "should have the right contents" do
          pending
          
        end
      end

      describe "contents" do

        it "should create the right HTML file" do
          expect("epub/OEBPS/#{builder.manifest.filename}.html").to exist
        end
        
        it "should have the right contents" do
          content = File.open('html/book.html').read
          File.open('epub/OEBPS/book.html') do |f|
            expect(f.read).to match(/#{Regexp.escape(content)}/)
          end
        end
      end

      it "should generate the EPUB" do
        pending
      end
  
    end
  end
end

# Cleans the fixtures directory as a prep for testing.
def clean!
  FileUtils.rm_r('book.epub', force: true)
end