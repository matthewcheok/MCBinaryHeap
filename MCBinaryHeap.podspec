Pod::Spec.new do |s|
  s.name     = 'MCBinaryHeap'
  s.version  = '0.1'
  s.ios.deployment_target   = '7.0'
  s.osx.deployment_target = '10.9'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'An Objective-C wrapper of CFBinaryHeap. Core Foundation priority queue implementation.'
  s.homepage = 'https://github.com/matthewcheok/MCBinaryHeap'
  s.author   = { 'Matthew Cheok' => 'cheok.jz@gmail.com' }
  s.requires_arc = true
  s.source   = {
    :git => 'https://github.com/matthewcheok/MCBinaryHeap.git',
    :branch => 'master',
    :tag => s.version.to_s
  }
  s.source_files = 'MCBinaryHeap/*.{h,m}'
  s.public_header_files = 'MCBinaryHeap/*.h'
end
