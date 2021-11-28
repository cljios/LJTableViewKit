//
//  YWTableDelegate.h
//  YaoWang
//
//  Created by 出出 on 2019/7/11.
//  Copyright © 2019 JingLan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableProtocol.h"
#import "NSMutableArray+Safe.h"

NS_ASSUME_NONNULL_BEGIN


@class TableDelegate;

typedef TableDelegate YWTableDelegate;

@interface TableDelegate : NSObject
<UITableViewDelegate>

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;

@property (nonatomic, strong) NSMutableArray *emptyArray;

@property (nonatomic, weak) id <LJScrollViewDelegate> scrollViewDelegate;

@property (nonatomic, copy) void (^didEndDisplayingCell)(UITableViewCell *cell, id <TableSectionModelable>sectionModel, id <TableRowModelable>rowModel, NSIndexPath *indexPath);

@property (nonatomic, copy) void (^willDisplayCell)(UITableViewCell *cell, id <TableSectionModelable>sectionModel, id <TableRowModelable>rowModel, NSIndexPath *indexPath);

- (instancetype)initWithDataSource:(NSMutableArray <TableSectionModelable>*)dataSource
                     didSelectCell:(void (^)(id <TableSectionModelable>sectionModel, id <TableRowModelable> rowModel, NSIndexPath *indexPath))didSelectCell
                            header:(void (^)(UITableViewHeaderFooterView *headerView, id<TableSectionModelable>sectionModel, NSInteger section))header
                            footer:(void (^)(UITableViewHeaderFooterView *footerView, id<TableSectionModelable>sectionModel, NSInteger section))footer;
@end

NS_ASSUME_NONNULL_END
