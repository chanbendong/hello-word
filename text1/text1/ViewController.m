//
//  ViewController.m
//  text1
//
//  Created by dong on 16/1/20.
//  Copyright © 2016年 dong. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "frameView.h"
#import "AFNetworking.h"
@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) AVPlayer *player;

@end

@implementation ViewController
{
    CGRect fram;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    webView.backgroundColor = [UIColor blueColor];
//    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://touch.qunar.com/h5/flight/bargainflight?startCity=%E6%B7%B1%E5%9C%B3&destCity=%E4%B8%8A%E6%B5%B7"]]];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://touch.qunar.com/h5/flight/flightlist?startCity=%E5%8C%97%E4%BA%AC&startCode=PEK&destCity=%E4%B8%8A%E6%B5%B7&destCode=SHA&startDate=2016-04-23&backDate=&flightType=oneWay"]]];
    
    webView.delegate = self;
    [self.view addSubview:webView];
    
   
    
}

-(NSString *)JSONString:(NSString *)aString {
    
    NSMutableString *s = [NSMutableString stringWithString:aString];
    
//    [s replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    [s replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    [s replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    [s replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    [s replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    [s replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    [s replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    
    return [NSString stringWithString:s];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *jsStr = @"(function(){var items=document.getElementsByClassName('list-info');var prices=document.getElementsByClassName('price-info');var placeConfig={'1':3,'3':4,'4':1,'5':9,'6':7,'7':6,'9':5,'8':8,'2':2,'0':0};var jsonData=[];for(var i=0,len=items.length;i<len;i++){var formData={};formData.fromDate=items[i].querySelector('p.from-time.time-font').innerHTML;formData.toDate=items[i].querySelector('p.to-time.time-font').innerHTML;formData.fromPlace=items[i].querySelector('p.from-place.ellipsis').innerHTML;formData.toPlace=items[i].querySelector('p.to-place.ellipsis').innerHTML;var flight='';var flightNodes=items[i].querySelector('.company-info');flight+=flightNodes.querySelector('.company1.ellipsis').innerHTML;flight+=flightNodes.querySelector('.company2.ellipsis').innerHTML;formData.flightCompany=flight;if(prices[i].querySelector('.price.ddv1adbm5dsa4gd7v')){var price=prices[i].querySelector('.price.ddv1adbm5dsa4gd7v').innerHTML.split('');price=price.map(function(item,index){return placeConfig[item]}).join('');formData.price=price}else{formData.price=prices[i].childNodes[1].nodeValue}jsonData.push(formData)}; return JSON.stringify(jsonData);})()";

    

    
    NSError *err;
   NSString * data =  [webView stringByEvaluatingJavaScriptFromString:jsStr];
    NSString *jsonStr = [self JSONString:data];
    NSData *jsondata = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    id dic = [NSJSONSerialization JSONObjectWithData:jsondata options:NSJSONReadingMutableContainers error:&err];
    NSLog(@"json is %@",dic);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
