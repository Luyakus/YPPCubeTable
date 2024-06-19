Pod::Spec.new do |s|
  s.name             = 'YPPCubeTable'
  s.version          = '0.0.1'
  s.summary          = '这里是概要'
  s.description      = <<-DESC
  这里是描述
                       DESC

  s.homepage         = 'http://git.yupaopao.com/terminal/ios/component/YPPCubeTable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'leigaopan' => 'leigaopan@yupaopao.cn' }
  s.source           = { :git => 'git@git.yupaopao.com:terminal/ios/component/YPPCubeTable.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Pods/Classes/**/*.{h,m}'
  
   s.dependency 'YPPCube'
   s.dependency 'ReactiveCocoa', '2.5.0'

end
