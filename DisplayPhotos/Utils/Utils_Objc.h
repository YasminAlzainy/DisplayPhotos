//
//  Utils_Objc.h
//  DisplayPhotos
//
//  Created by Yasmin Ayman on 03/08/1444 AH.
//

#ifndef Utils_Objc_h
#define Utils_Objc_h
#import <Foundation/Foundation.h>

@interface Utils_Objc : NSObject 

+(NSURL*)createPhotosListURLWithPage: (NSInteger) page withLimit: (NSInteger) limit;

@end 

#endif /* Utils_Objc_h */
