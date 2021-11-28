//
//  TableDataSource.h
//  YaoWang
//
//  Created by 出出 on 2019/7/11.
//  Copyright © 2019 JingLan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableProtocol.h"
#import "NSMutableArray+Safe.h"

NS_ASSUME_NONNULL_BEGIN
@class TableDataSource;

typedef TableDataSource YWTableDataSource;

@interface TableDataSource : NSObject<UITableViewDataSource, UITableViewDataSourcePrefetching>

@property (nonatomic, strong) NSMutableArray *emptyArray;

@property (nonatomic, copy) void (^prefetchRowsAtIndexPaths)(NSArray <NSIndexPath *>*indexPaths);
@property (nonatomic, copy) void (^cancelPrefetchingForRowsAtIndexPaths)(NSArray<NSIndexPath *> *indexPaths);

- (instancetype)initWithDataSource:(NSMutableArray <TableSectionModelable>*)dataSource cellForRow:(void (^)(UITableViewCell *cell, id <TableSectionModelable>sectionModel, id <TableRowModelable>rowModel, NSIndexPath *indexPath))cellForRow;

@end


NS_ASSUME_NONNULL_END
