//
//  GradientView.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "GradientView.h"

@implementation GradientView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.startColor = [UIColor blackColor];
        self.endColor = [UIColor whiteColor];
        
        [self customInit];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self customInit];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    [self customInit];
}

- (void)setNeedsLayout {
    
    [super setNeedsLayout];
    [self setNeedsDisplay];
}

- (void)prepareForInterfaceBuilder {
    
    [self customInit];
}

- (void)customInit {
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    
    gradient.colors = [NSArray arrayWithObjects:(id)[self.startColor CGColor], (id)[self.endColor CGColor], nil];
    
    [self.layer insertSublayer:gradient atIndex:0];
}

@end
