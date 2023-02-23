//
//  Utils_Objc.m
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 03/08/1444 AH.
//

#import "Utils_Objc.h"

@implementation Utils_Objc

+(NSURL*)createPhotosListURLWithPage: (NSInteger) page withLimit: (NSInteger) limit{
    NSMutableString * photosListURLString = [NSMutableString stringWithFormat: @"https://picsum.photos/v2/list?page=%ld&limit=%ld", (long)page,(long)limit];
    
    NSURL * url = [NSURL URLWithString:photosListURLString];
    return  url;
}
@end
