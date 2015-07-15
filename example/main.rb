require_relative '../lib/TextClassifier.rb'

blender_interview = TextClassifier.new("test_texts/blender_2_75a_release_notes")
blender_interview.classify();

senegal = TextClassifier.new("test_texts/senegal_on_wikipedia")
senegal.classify();
