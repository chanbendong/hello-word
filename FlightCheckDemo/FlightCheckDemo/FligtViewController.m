//
//  FligtViewController.m
//  FlightCheckDemo
//
//  Created by easub on 16/4/21.
//  Copyright © 2016年 easub. All rights reserved.
//

#import "FligtViewController.h"
#import "FlightModel.h"
#import "FlightTableViewCell.h"

static NSString *FlightTableViewCellID = @"FlightTableViewCellID";
//获取屏幕宽度
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

//获取屏幕高度
#define kScreenHeigh ([UIScreen mainScreen].bounds.size.height)

@interface FligtViewController ()<UIWebViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation FligtViewController

- (NSMutableArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _toTime;
    self.view.backgroundColor = [UIColor whiteColor];
    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(kScreenWidth, kScreenHeigh, kScreenWidth, kScreenHeigh)];
    NSString *url =[NSString stringWithFormat:@"http://touch.qunar.com/h5/flight/flightlist?startCity=%@&destCity=%@&startDate=%@&flightType=oneWay",[_fromPlace stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]],[_toPlace stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]],_toTime];
      [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    NSLog(@"url is %@",url);
    web.delegate = self;
    [self.view addSubview:web];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *jsStr = @"(function(){var items=document.getElementsByClassName('list-info');var prices=document.getElementsByClassName('price-info');var placeConfig={'1':5,'3':2,'4':1,'5':4,'6':7,'7':6,'9':9,'8':8,'2':3,'0':0};var jsonData=[];for(var i=0,len=items.length;i<len;i++){var formData={};formData.fromDate=items[i].querySelector('p.from-time.time-font').innerHTML;formData.toDate=items[i].querySelector('p.to-time.time-font').innerHTML;formData.fromPlace=items[i].querySelector('p.from-place.ellipsis').innerHTML;formData.toPlace=items[i].querySelector('p.to-place.ellipsis').innerHTML;var flightNodes=items[i].querySelector('.company-info');formData.flightCompany=flightNodes.querySelector('.company1.ellipsis').innerHTML;formData.flightPlane=flightNodes.querySelector('.company2.ellipsis').innerHTML;if(prices[i].querySelector('.price.ddv1adbm5drq64qso')){var price=prices[i].querySelector('.price.ddv1adbm5drq64qso').innerHTML.split('');price=price.map(function(item,index){return placeConfig[item]}).join('');formData.price=price}else{formData.price=prices[i].childNodes[1].nodeValue}jsonData.push(formData)}; return JSON.stringify(jsonData)})();";
    
    
    
    
    NSError *err;
    NSString * data =  [webView stringByEvaluatingJavaScriptFromString:jsStr];

    NSData *jsondata = [data dataUsingEncoding:NSUTF8StringEncoding];
    id dic = [NSJSONSerialization JSONObjectWithData:jsondata options:NSJSONReadingMutableContainers error:&err];

    for (id obj in dic) {
        [self.dataArr addObject:[FlightModel instanceWithDic:obj]];
    }
    NSLog(@"%@",dic);
    [self setTabelView];
}

- (void)setTabelView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeigh-64) style:UITableViewStylePlain];
    tableView.rowHeight = 120;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerNib:[UINib nibWithNibName:@"FlightTableViewCell" bundle:nil] forCellReuseIdentifier:FlightTableViewCellID];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FlightModel *model = self.dataArr[indexPath.row];

    FlightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FlightTableViewCellID forIndexPath:indexPath];
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell reloadDataFromModel:model];
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
