# keyChain-
移动端默认记住账号和密码：如qq
要把账号和密码保存到本地

使用NSUserDefaults存储账号
使用钥匙串存储密码

NSUserDefaults  -- 就是一个全局的字典
钥匙串访问 -- 开放给开发者是 7.0.3版本

---------------------------- 保存在本地 ---------------------------
钥匙串访问:

1. 苹果的"生态圈",从 iOS7.0.3 版本开放给开发者!
2. 功能:在Mac上能够动态生成复杂密码,帮助用户记住密码!
3. 如果用户访问网站,记住密码,我们还可以看到记住的密码明文!明文记录
4. 本身的所有接口都是 C 语言的.借助三方库 SSKeychain  https://cocoapods.org/pods/SSKeychain

5. 采用的加密方式是 AES 加密!

KeyChain通过Service和Account保存和获取密码， Service和Account是密码的唯一标识。
关于KeyChain唯一标识问题可以参考: https://stackoverflow.com/questions/11614047/what-makes-a-keychain-item-unique-in-ios
