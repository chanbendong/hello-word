<?php

class IndexModel
{

    public function responseMsg($postObj,$city)
    {
        
        $fromUsername = $postObj->FromUserName;
        $toUsername = $postObj->ToUserName;
        $time = time();
        $MsgType = $postObj->MsgType;
        $Event = $postObj->Event;
        
        if (strtolower($MsgType) == 'text'&& trim($postObj->Content)== '图文'){
            $toUser = $fromUsername;
            $fromUser = $toUsername;
            $time = time();
            $arr = array(
                array(
                    'title' => '程序狗',
                    'description' => '这是一段php的征战之路',
                    'picUrl' => 'http://www.daliulian.net/imgs/image/64/6488895.jpg',
                    'url' => 'http://www.baidu.com',
                ),
                array(
                    'title' => '程序猫',
                    'description' => '这是一段php的征战之路',
                    'picUrl' => 'http://www.daliulian.net/imgs/image/64/6488895.jpg',
                    'url' => 'http://www.baidu.com',
                ),
                array(
                    'title' => '程序动物园',
                    'description' => '这是一段php的征战之路',
                    'picUrl' => 'http://www.daliulian.net/imgs/image/64/6488895.jpg',
                    'url' => 'http://www.baidu.com',
                )
            );
            $template = "<xml>
                        <ToUserName><![CDATA[%s]]></ToUserName>
                        <FromUserName><![CDATA[%s]]></FromUserName>
                        <CreateTime>%s</CreateTime>
                        <MsgType><![CDATA[%s]]></MsgType>
                        <ArticleCount>".count($arr)."</ArticleCount>
                        <Articles>";
            foreach ($arr as $k=>$v){
                $template .= "<item>
                            <Title><![CDATA[".$v['title']."]]></Title> 
                            <Description><![CDATA[".$v['description']."]]></Description>
                            <PicUrl><![CDATA[".$v['picUrl']."]]></PicUrl>
                            <Url><![CDATA[".$v[url]."]]></Url>
                            </item>";
            }
            $template .= "</Articles>
                         </xml>";
            echo sprintf($template, $toUser, $fromUser, $time, 'news');
        }
        if (strtolower($MsgType) == 'text' && strstr($postObj->Content,'天气')) {
           
            $toUser = $fromUsername;
            $fromUser = $toUsername;
            $time = time();
            $template = "<xml>
                        <ToUserName><![CDATA[%s]]></ToUserName>
                        <FromUserName><![CDATA[%s]]></FromUserName>
                        <CreateTime>%s</CreateTime>
                        <MsgType><![CDATA[%s]]></MsgType>
                        <Content><![CDATA[%s]]></Content>
                        </xml>";
            $msgType = 'text';
            echo sprintf($template, $toUser, $fromUser, $time, $msgType, $city);}
        if (strtolower($MsgType) == 'text'){
            $toUser = $fromUsername;
            $fromUser = $toUsername;
            $time = time();
            $template = "<xml>
                        <ToUserName><![CDATA[%s]]></ToUserName>
                        <FromUserName><![CDATA[%s]]></FromUserName>
                        <CreateTime>%s</CreateTime>
                        <MsgType><![CDATA[%s]]></MsgType>
                        <Content><![CDATA[%s]]></Content>
                        </xml>";
            $msgType = 'text';
            $content = '谢谢';
            echo sprintf($template, $toUser, $fromUser, $time, $msgType, $content);

        }
    }
    

}