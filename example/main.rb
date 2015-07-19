require_relative '../lib/TextClassifier.rb'
require 'benchmark'

Benchmark.bm do |bm|
  bm.report {
              classifier = TextClassifier.new()
              classifier.classify("test_texts/blender_2_75a_release_notes")
              classifier.classify("test_texts/senegal_on_wikipedia")
              classifier.classify("test_texts/3dCG_on_wikipedia")
            }
end
