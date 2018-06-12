//
//  UnwantedCommunicationReportingExtension.m
//  XYSwiftUnwantExtention
//
//  Created by HXB-xiaoYang on 2018/6/5.
//  Copyright © 2018年 VansXY. All rights reserved.
//

#import "UnwantedCommunicationReportingExtension.h"


@implementation UnwantedCommunicationReportingExtension

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Notify the system when you have completed gathering information
    // from the user and you are ready with a classification response
    self.extensionContext.readyForClassificationResponse = YES;
}

// Customize UI based on the classification request before the view is loaded
- (void)prepareForClassificationRequest:(__kindof ILClassificationRequest *)request {
    // Configure your views for the classification request
}

// Provide a classification response for the classification request
- (ILClassificationResponse *)classificationResponseForRequest:(__kindof ILClassificationRequest *)request {
    return [[ILClassificationResponse alloc] initWithClassificationAction:ILClassificationActionNone];
}

@end
