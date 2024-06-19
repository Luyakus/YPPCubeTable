Pod::Spec.new do |s|
  s.name             = 'YPPCubeTable'
  s.version          = '0.0.1'
  s.summary          = '这里是概要'
  s.description      = <<-DESC
  这里是描述
                       DESC

  s.homepage         = 'https://github.com/Luyakus/YPPCubeTable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '' => '' }
  s.source           = { :git => 'https://github.com/Luyakus/YPPCubeTable.git'}

  s.ios.deployment_target = '10.0'

  s.source_files = 'Pods/Classes/**/*.{h,m}'
  
   s.dependency 'YPPCube'
   s.dependency 'ReactiveCocoa', '2.5.0'

end
