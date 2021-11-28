//
//  TableRowModel.h
//  YaoWang
//
//  Created by 出出 on 2019/7/11.
//  Copyright © 2019 JingLan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@class TableRowModel;

typedef TableRowModel YWTableRowModel;

@interface TableRowModel : NSObject <TableRowModelable>

@property (nonatomic, copy) NSString *cellIdentifier;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, strong) id <TableViewCellHandlerable>handler;

@end

NS_ASSUME_NONNULL_END
