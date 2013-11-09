//
//  CellDetail.h
//  Hakamy
//
//  Created by Ha Cong Thuan on 11/9/13.
//  Copyright (c) 2013 Ha Cong Thuan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kLabelHorizontalInsets 20.0f
@interface CellDetail : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *bodyLabel;
@property (nonatomic, assign) BOOL didSetupConstraints;
- (void)updateFonts;
@end
