<?php
include 'weixin.php';
define("TOKEN", "window3961640");
$wechatObj = new wechatCallbackapiTest();
$wechatObj->valid();
class wechatCallbackapiTest 
{
    public function valid()
    {
        $echoStr = $_GET["echostr"];
        //valid signature , option
        if ($this->checkSignature() && $echoStr) {
            echo $echoStr;
            exit;
        } else {
            $this->responseMsg();
        }
    }

    public function responseMsg()
    {
//get post data, May be due to the different environments
        $postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
        //extract post data
        $postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
        $fromUsername = $postObj->FromUserName;
        $toUsername = $postObj->ToUserName;
        $time = time();
        $MsgType = $postObj->MsgType;
        $Event = $postObj->Event;

        if (strtolower($MsgType) == 'event') {
            if (strtolower($Event) == 'subscribe') {
                $toUser = $fromUsername;
                $fromUser = $toUsername;
                $time = time();
                $msgType = 'text';
                $content = '欢迎关注程序狗';
                $template = "<xml>
                             <ToUserName><![CDATA[%s]]></ToUserName>
                             <FromUserName><![CDATA[%s]]></FromUserName>
                             <CreateTime>%s</CreateTime>
                             <MsgType><![CDATA[%s]]></MsgType>
                             <Content><![CDATA[%s]]></Content>
                             </xml>";
                $info = sprintf($template, $toUser, $fromUser, $time, $msgType, $content);
                echo $info;
            }
        }
        $ch = curl_init();
        $url = 'http://apis.baidu.com/apistore/weatherservice/cityname?cityname='.urlencode(str_replace('天气','',$postObj->Content));
        $header = array(
            'apikey: a4dc62eb7a97a947d9cd34bef56c2466',
        );
        // 添加apikey到header
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        // 执行HTTP请求
        curl_setopt($ch , CURLOPT_URL , $url);
        $res = curl_exec($ch);
        $arr = json_decode($res, true);
        $content = str_replace('天气','',$postObj->Content).'今天'.$arr['retData']['weather']."\n".'最低气温是'.$arr['retData']['l_tmp']."\n".'最高气温是'.$arr['retData']['h_tmp'];
       $weixinModel = new IndexModel();
        $weixinModel->responseMsg($postObj,$content);
        

    }

    private function checkSignature(){
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];

        $token = TOKEN;
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr);
        $tmpStr = implode( $tmpArr );
        $tmpStr = sha1( $tmpStr );
        if( $tmpStr == $signature ){
            return true;
        }else{
            return false;
        }
    }
    

    function get_data($userID){
        $obj = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx43e670e0a0bd961f&secret=73361dba9abed784bf850f63dcef304a';
        $ass_token = file_get_contents($obj);
        $ass_token = json_decode($ass_token);
        $obj= 'https://api.weixin.qq.com/cgi-bin/user/info?access_token='.$ass_token->access_token.'&openid='.$userID.'&lang=zh_CN';
        $ass_token = file_get_contents($obj);
        $ass_token = json_decode($ass_token);
        return $ass_token->nickname;

    }

}



?>