//
//  TableSectionModel.h
//  YaoWang
//
//  Created by 出出 on 2019/7/11.
//  Copyright © 2019 JingLan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableProtocol.h"

@class TableSectionModel;

typedef TableSectionModel YWTableSectionModel;

NS_ASSUME_NONNULL_BEGIN

@interface TableSectionModel : NSObject <TableSectionModelable>

@property (nonatomic, copy) NSString *headerIdentifier;
@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, copy) NSString *footerIdentifier;
@property (nonatomic, assign) CGFloat footerHeight;

@property (nonatomic, strong) NSMutableArray <TableRowModelable>*rows;

@property (nonatomic, strong) id <TableHeaderViewHandlerable>headerHandler;
@property (nonatomic, strong) id <TableFooterViewHandlerable>footerHandler;

@end

NS_ASSUME_NONNULL_END
