//
//  CodingTake2View.m
//  CodingTake2
//
//  Created by xiao on 2015/10/30.
//  Copyright © 2015年 soukun. All rights reserved.
//

#import "CodingTake2View.h"

@implementation CodingTake2View

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
  self = [super initWithFrame:frame isPreview:isPreview];
  if (self)
  {
    [self setAnimationTimeInterval:1 / 30.0];
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:@"Sample" ofType:@"java"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    text = [content componentsSeparatedByString:@"\n"];
    displaying = [NSMutableString string];
  }
  return self;
}

- (void)startAnimation
{
  [super startAnimation];
}

- (void)stopAnimation
{
  [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
  [super drawRect:rect];
  if ((currentChar == 0) && (currentLine >= 80) && (currentLine % 80 == 0))
    displaying = [NSMutableString string];
  if (currentLine < [text count])
    [displaying appendString:[text[currentLine] substringWithRange:[text[currentLine] rangeOfComposedCharacterSequenceAtIndex:((NSUInteger)currentChar++)]]];
  while (currentChar == [text[currentLine] length])
  {
    [displaying appendString:@"\n"];
    currentChar = 0;
    currentLine++;
  }
  NSString *aString = displaying;
  NSColor *fgColor = [NSColor greenColor];
  NSMutableDictionary *md = [NSMutableDictionary dictionaryWithCapacity:1];
  [md setValue:fgColor forKey:NSForegroundColorAttributeName];
  NSAttributedString *drawn = [[NSAttributedString alloc] initWithString:aString
                                                              attributes:md];
  [drawn drawInRect:rect];
}

- (void)animateOneFrame
{
  [super animateOneFrame];
  [self setNeedsDisplay:YES];
}
- (BOOL)hasConfigureSheet
{
  return NO;
}

- (NSWindow *)configureSheet
{
  return nil;
}

@end
