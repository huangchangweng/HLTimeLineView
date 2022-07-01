Pod::Spec.new do |spec|

  spec.name         = "HLTimeLineView"
  spec.version      = "1.0.2"
  spec.summary      = "iOS时间轴，xib、storyboard中也能愉快的使用"

  # 描述
  spec.description  = <<-DESC
      iOS时间轴，xib、storyboard中也能愉快的使用。
  DESC

  # 项目主页
  spec.homepage     = "https://github.com/huangchangweng/HLTimeLineView"
 
  # 开源协议
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  
  # 作者
  spec.author       = { "黄常翁" => "599139419@qq.com" }
  
  # 支持平台
  spec.platform     = :ios, "9.0"

  # git仓库，tag
  spec.source       = { :git => "https://github.com/huangchangweng/HLTimeLineView.git", :tag => spec.version.to_s }

  # 资源路径
  spec.source_files  = "HLTimeLineView/HLTimeLineView/*.{h,m}"

  # 依赖系统库
  spec.frameworks = "UIKit"

end
