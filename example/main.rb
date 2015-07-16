require_relative '../lib/TextClassifier.rb'
require 'benchmark'

Benchmark.bm do |bm|
  bm.report {
              blender_release = TextClassifier.new("test_texts/blender_2_75a_release_notes")
              blender_release.classify()
            }
  bm.report {
              senegal = TextClassifier.new("test_texts/senegal_on_wikipedia")
              senegal.classify();
            }
end


puts Benchmark.measure {

}
