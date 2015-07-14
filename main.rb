require_relative 'TextClassifier.rb'

blender_interview = TextClassifier.new("test_texts/blender_campbell_interview")
blender_interview.classify();

senegal = TextClassifier.new("test_texts/senegal_on_wikipedia")
senegal.classify();
