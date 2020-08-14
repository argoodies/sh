#!/bin/bash

# AppName
read -r -p "
你的 APP 名称: " AppName
AppName=${AppName:-空}
echo $AppName


# Cookie
read -r -p "
是否使用 Cookie ? [y/N] " Cookie
Cookie=${Cookie:-y}
echo $Cookie

CookieTerm="
Cookie 使用协议

您使用我们的服务时，我们会在您的计算机或移动设备上存储名为 Cookie 的小数据文件。Cookie 通常包含标识符、站点名称以及一些号码和字符。我们使用该等信息判断注册用户是否已经登录，提升服务产品质量及优化用户体验。如您不希望个人信息保存在 Cookie 中，您可对浏览器进行配置，选择禁用 Cookie 功能。禁用 Cookie 功能后，可能影响您访问${AppName}或不能充分取得${AppName}提供的服务。

我们不会将 Cookie 用于本指引所述目的之外的任何用途。您可根据自己的偏好管理或删除 Cookie。您可以清除计算机上保存的所有 Cookie，大部分网络浏览器都设有阻止 Cookie 的功能。"

case "$Cookie" in
    [yY][eE][sS]|[yY]) 
        ;;
    *)
        CookieTerm=""
        ;;
esac

# Date
TodayDate=$(date "+%Y-%m-%d")

read -r -p "
协议生效日期 (default:$TodayDate): " Date
Date=${Date:-$TodayDate}
echo $Date


# Combine
PrivacyTerm="
${AppName}用户隐私协议
生效日期: ${Date}

${AppName}会一贯保证用户的隐私信息，${AppName}将通过加密等技术手段及其他办法充分保护用户的个人隐私信息，除法律或有法律赋予权限的政府部门要求或事先得到用户明确授权等原因外，${AppName}保证不对外公开或向第三方透露用户个人隐私信息，或用户在使用服务时存储的非公开内容。 同时，为了运营和改善${AppName}的技术与服务，${AppName}将可能会自行收集使用或向第三方提供用户的非个人隐私信息，这将有助于${AppName}向用户提供更好的用户体验和服务质量。
"

UpdateTerm="
协议修改

根据互联网的发展和有关法律、法规及规范性文件的变化，或者因业务发展需要，${AppName}有权对本协议的条款作出修改或变更，一旦本协议的内容发生变动，${AppName}将会通过公示的方式告知用户修改之后的协议内容，该通知行为视为${AppName}已经通知用户修改内容。 ${AppName}也可采用弹窗、提示、电子邮件、电话或短信的传送方式，提示用户协议条款的修改、服务变更、或其它重要事项。 如果不同意${AppName}对本协议相关条款所做的修改，用户有权并应当停止使用${AppName}。如果用户继续使用${AppName}，则视为用户接受${AppName}对本协议相关条款所做的修改。
"

echo "
--------------------"
sleep 1s

echo "
${PrivacyTerm}

${UpdateTerm}

${CookieTerm}
"

echo "--------------------"
sleep 1s


# Generate
File="privacy.txt"
read -r -p "
是否保存到本地文件 ${File} ? [y/N] " Generate
Generate=${Generate:-y}
echo $Generate
case "$Generate" in
    [yY][eE][sS]|[yY]) 

        echo "
        ${PrivacyTerm}

        ${UpdateTerm}

        ${CookieTerm}
        " >> ${File}
        ;;
    *)
        exit 0
        ;;
esac