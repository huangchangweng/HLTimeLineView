//
//  HLCell.h
//  HLTimeLineView
//
//  Created by JJB_iOS on 2022/6/23.
//

#import <UIKit/UIKit.h>
#import "HLTimeLineView.h"

@interface HLCell : UITableViewCell
@property (weak, nonatomic) IBOutlet HLTimeLineView *timeLineView;
@property (weak, nonatomic) IBOutlet UILabel *cTitleLabel;
@end

