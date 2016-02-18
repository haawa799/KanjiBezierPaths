
Pod::Spec.new do |s|
  s.homepage    = "https://github.com/haawa799/KanjiBezierPaths/tree/master"
  s.name        = "KanjiBezierPaths"
  s.version     = "0.1.1"
  s.summary     = "Returns kanji strokes as an array of UIBezierPathes"
  s.license     = { :type => "MIT" }
  s.authors     = { "Andriy Kharchyshyn" => "haawaplus@gmail.com" }
  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'KanjiBezierPaths' => ['Pod/Assets/*']
  }
  s.dependency "AWSQLiteDB"
end
