一键安装 gitlab7 on rhel6.4 并设置邮件发送

世间本无事，庸人自扰之。书归正传，简短节说：gitlab是个好东西，但是安装手册奇烂。虽然曾经对照文档一步一步安装起来gitlab 6.x，但是，时过境迁，再也不想把时间花在这无聊的配置上。谷歌已然变成往日黄花，又无翻越 墙 狱之利器，只能在百度和Bing之间来回寻找答案。


功夫不负苦心人。终于找到这个bitnami的一键安装包。bitnami-gitlab-7.1.1-0-linux-x64-installer.run。


https://bitnami.com/redirect/to/39039/bitnami-gitlab-7.1.1-0-linux-x64-installer.run

1 安装全过程


下载还是出奇的慢。下面是安装全过程：

[root@rhel64-origin ~]# service mysqld stop
Stopping mysqld:                                           [  OK  ]
[root@rhel64-origin ~]# ./bitnami-gitlab-7.1.1-0-linux-x64-installer.run
The installer detects that exists a 'git' user in the system. This installer will change the config                        uration for this user. Do you want to continue the installation? [y/N]: y

The installer detects that exists a 'gitlab_ci' user in the system. This installer will change the                         configuration for this user. Do you want to continue the installation? [y/N]: y

----------------------------------------------------------------------------
Welcome to the Bitnami Gitlab Stack Setup Wizard.

----------------------------------------------------------------------------
Select the components you want to install; clear the components you do not want
to install. Click Next when you are ready to continue.

GitLab : Y (Cannot be edited)

GitLab CI [Y/n] :Y

Is the selection above correct? [Y/n]: Y

----------------------------------------------------------------------------
Installation folder

Please, choose a folder to install Bitnami Gitlab Stack

Select a folder [/opt/gitlab-7.1.1-0]:

----------------------------------------------------------------------------
Create Admin account

Bitnami Gitlab Stack admin user creation

Email Address [user@example.com]: it.service@shforeigntrade.com

Login [user]: master

Password :********
Please confirm your password :********
----------------------------------------------------------------------------
Hostname that will be used to create internal URLs. If this value is incorrect,
you may be unable to access your Gitlab installation from other computers. It is
advisable to use a Domain instead of an IP address for compatibility with
different browsers.

Domain [192.168.82.181]:

Do you want to configure mail support? [y/N]: y

----------------------------------------------------------------------------
Configure SMTP Settings

This is required so your application can send notifications via email.

Default email provider:

[1] GMail
[2] Custom
Please choose an option [1] : 2

----------------------------------------------------------------------------
Configure SMTP Settings

This data is stored in the application configuration files and may be visible to
others. For this reason, it is recommended that you do not use your personal
account credentials.

Username []: it.service@shforeigntrade.com

Password :@123456!
Re-enter :@123456!
SMTP Host []: smtp.shforeigntrade.com

SMTP Port []: 25

Secure connection

[1] None
[2] SSL
[3] TLS
Please choose an option [3] :3

----------------------------------------------------------------------------
Setup is now ready to begin installing Bitnami Gitlab Stack on your computer.

Do you want to continue? [Y/n]: y

----------------------------------------------------------------------------
Please wait while Setup installs Bitnami Gitlab Stack on your computer.

 Installing
 0% ______________ 50% ______________ 100%
 #########################################

----------------------------------------------------------------------------
Setup has finished installing Bitnami Gitlab Stack on your computer.

Info: To access the Bitnami Gitlab Stack, go to
http://192.168.82.181:80 from your browser.
Press [Enter] to continue:
2 更改配置以发送邮件

重要！此时还不能发送邮件。需要更改几个配置：

1） config/environments/production.rb

# vi /opt/gitlab-7.1.1-0/apps/gitlab/htdocs/config/environments/production.rb
  ........
  # config.action_mailer.delivery_method = :sendmail
  # Defaults to:
  # # config.action_mailer.sendmail_settings = {
  # #   location: '/usr/sbin/sendmail',
  # #   arguments: '-i -t'
  # # }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address => "smtp.qq.com",
    :port => "25",
    :domain => "smtp.qq.com",
    :authentication => :plain,
    :user_name => "3501xxxxx@qq.com",
    :password => "********",
    :enable_starttls_auto => true
  }
  ........
2） config/initializers/smtp_settings.rb

# cd /opt/gitlab-7.1.1-0/apps/gitlab/htdocs/config/initializers/
  # cp smtp_settings.rb.sample smtp_settings.rb
  # vi smtp_settings.rb
内容如下：
# To enable smtp email delivery for your GitLab instance do next:
# 1. Rename this file to smtp_settings.rb
# 2. Edit settings inside this file
# 3. Restart GitLab instance
#
if Rails.env.production?
  Gitlab::Application.config.action_mailer.delivery_method = :smtp

  ActionMailer::Base.smtp_settings = {
    address: "smtp.qq.com",
    port: 25,
    user_name: "3501xxxxx@qq.com",
    password: "********",
    domain: "qq.com",
    authentication: :login,
    enable_starttls_auto: true
  }
end
3） config/gitlab.yml

找到下面的内容，改成你的email地址：

# # # # # # # # # # # # # # # # # #
# GitLab application config file  #
# # # # # # # # # # # # # # # # # #
#
# How to use:
# 1. copy file as gitlab.yml
# 2. Replace gitlab -> host with your domain
# 3. Replace gitlab -> email_from

production: &base
  #
  # 1. GitLab app settings
  # ==========================

  ## GitLab settings
  gitlab:
  ## Web server settings (note: host is the FQDN, do not include http://)
  host: 192.168.82.181
  port: 80
  https: false

  # Uncommment this line below if your ssh host is different from HTTP/HTTPS one
  # (you'd obviously need to replace ssh.host_example.com with your own host).
  # Otherwise, ssh host will be set to the `host:` value above
  # ssh_host: ssh.host_example.com

  # WARNING: See config/application.rb under "Relative url support" for the list of
  # other files that need to be changed for relative url support
  # relative_url_root: /gitlab

  # Uncomment and customize if you can't use the default user to run GitLab (default: 'git')
  # user: git

  ## Email settings
  # Email address used in the "From" field in mails sent by GitLab
  email_from: 3501xxxxx@qq.com
  support_email: 3501xxxxx@qq.com

  # Email server smtp settings are in [a separate file](initializers/smtp_settings.rb.sample).
........
3 启动服务并访问

# /opt/gitlab-7.1.1-0/ctlscript.sh restart

此时创建用户，就会发送邮件了。

别忘记 qq邮箱中打开下面的服务：

以上在RHEL6.4上经过严格测试。