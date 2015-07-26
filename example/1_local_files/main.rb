require_relative '../../lib/TextClassifier.rb'
require 'benchmark'

Benchmark.bm do |bm|
  bm.report {
              classifier = TextClassifier.new()
              classifier.classify(path: "test_texts/blender_2_75a_release_notes")
              classifier.classify(path: "test_texts/senegal_on_wikipedia")
              classifier.classify(path: "test_texts/3dCG_on_wikipedia")
              classifier.classify(text: "I am interested in CG ( 2D and 3D ). Playing with blender is fun.")
            }
end
