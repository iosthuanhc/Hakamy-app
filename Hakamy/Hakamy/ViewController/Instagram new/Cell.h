//
//  Cell.h
//  naivegrid
//
//  Created by Apirom Na Nakorn on 3/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIGridViewCell.h"
#import "IntagramModel.h"

@interface Cell : UIGridViewCell {

}
-(void)loadImage:(IntagramModel*)instagramModel;

@property (nonatomic, retain) IBOutlet UIImageView *thumbnail;
@end
