//
//  UILazyImageView.m
//  VlipperIphoneClient
//
//  Created by Parag Sharma on 01/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UILazyImageView.h"

@implementation UILazyImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithURL:(NSURL *)url
{
    self = [self init];
    
    if (self)
    {
	    receivedData = [[NSMutableData alloc] init];
        [self loadWithURL:url];
    }
    
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [receivedData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}


- (void)loadWithURL:(NSURL *)url
{
	self.alpha = 0;
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:url]delegate:self];
    [connection start];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Image Loaded@");
    self.image = [[UIImage alloc] initWithData:receivedData];
    [UIView beginAnimations:@"fadeIn" context:NULL];
    [UIView setAnimationDuration:0.5];
    self.alpha = 1.0;
    [UIView commitAnimations];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
