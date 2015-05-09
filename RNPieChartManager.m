//
//  RNPieChartManager.m
//  RNPieChart
//
//  Created by Johannes Stein on 09/05/15.
//

#import "RNPieChartManager.h"
#import "RNPieChart.h"
#import "RCTBridge.h"

@implementation RNPieChartManager

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

- (UIView *)view
{
    return [[RNPieChart alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(data, NSArray)

@end
