#import "RNPieChart.h"

@implementation RNPieChart

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    // Drawing code
    /*CGRect bounds = self.bounds;
     
     CGContextRef context = UIGraphicsGetCurrentContext();
     CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
     CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
     CGContextFillRect(context, bounds);*/
    
    //prepare
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat theHalf = rect.size.width/2;
    CGFloat lineWidth = theHalf;
    
    CGFloat radius = theHalf-lineWidth/2;
    
    CGFloat centerX = theHalf;
    CGFloat centerY = rect.size.height/2;
    
    //drawing
    
    double sum = 0.0f;
    int slicesCount = 3;//[self.datasource numberOfSlicesInPieChartView:self];
    
    for (int i = 0; i < slicesCount; i++)
    {
        sum += 33.3;//[self.datasource pieChartView:self valueForSliceAtIndex:i];
    }
    
    float startAngle = - M_PI_2;
    float endAngle = 0.0f;
    
    for (int i = 0; i < slicesCount; i++)
    {
        double value = 33.3;//[self.datasource pieChartView:self valueForSliceAtIndex:i];
        
        endAngle = startAngle + M_PI*2*value/sum;
        CGContextAddArc(context, centerX, centerY, radius, startAngle, endAngle, false);
        
        
        
        UIColor  *drawColor = [UIColor colorWithRed:(0.33 * i) green:0.0 blue:0.0 alpha:1.0]; //[self.datasource pieChartView:self colorForSliceAtIndex:i];
        
        CGContextSetStrokeColorWithColor(context, drawColor.CGColor);
        CGContextSetLineWidth(context, lineWidth);
        CGContextStrokePath(context);
        startAngle += M_PI*2*value/sum;
    }
}

@end