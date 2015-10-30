//
//  CodingTake2View.h
//  CodingTake2
//
//  Created by xiao on 2015/10/30.
//  Copyright © 2015年 soukun. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface CodingTake2View : ScreenSaverView
{
  NSArray *text;
  int currentLine;
  int currentChar;
  NSMutableString *displaying;
}

@end
