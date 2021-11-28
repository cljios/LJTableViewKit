//
//  TableDataSource.m
//  YaoWang
//
//  Created by 出出 on 2019/7/11.
//  Copyright © 2019 JingLan. All rights reserved.
//

#import "TableDataSource.h"

@interface TableDataSource()

@property (nonatomic, weak) NSMutableArray <TableSectionModelable>*dataSource;
@property (nonatomic, copy) void (^cellForRow)(UITableViewCell *cell, id <TableSectionModelable>sectionModel, id <TableRowModelable>rowModel, NSIndexPath *indexPath);

@end

@implementation TableDataSource

- (instancetype)initWithDataSource:(NSMutableArray <TableSectionModelable>*)dataSource cellForRow:(void (^)(UITableViewCell *cell, id <TableSectionModelable>sectionModel, id <TableRowModelable>rowModel, NSIndexPath *indexPath))cellForRow
{
    if ((self = [super init])) {
        
        _dataSource = dataSource;
        _cellForRow= cellForRow;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.dataSource.count > 0) {
        return self.dataSource.count;
    } else {
        if (self.emptyArray.count > 0) {
            return 1;
        } else {
            return 0;
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataSource.count > 0) {
        id<TableSectionModelable> sectionModel = [self.dataSource safeObjectAtIndex:section];
        return sectionModel.rows.count;
    } else {
        return self.emptyArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<TableSectionModelable> sectionModel = [self.dataSource safeObjectAtIndex:indexPath.section];
    id<TableRowModelable> rowModel = [sectionModel.rows safeObjectAtIndex:indexPath.row];
    
    if (!rowModel || rowModel.cellIdentifier.length <= 0) {
        return [UITableViewCell new];
    }
    
    NSString *str = [NSString stringWithFormat:@"cellIdentifier can be nil %@",rowModel];
    NSAssert(rowModel.cellIdentifier != nil, str);
    
    //解决重用导致层级嵌套无法清除里面状态（壁纸页面）
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rowModel.cellIdentifier forIndexPath:indexPath];
    
    NSAssert(cell != nil, @"cell can be nil");
    
    if (self.cellForRow) {
        self.cellForRow(cell, sectionModel, rowModel, indexPath);
    }
    return cell;
}


// indexPaths are ordered ascending by geometric distance from the table view
- (void)tableView:(UITableView *)tableView prefetchRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    if (self.prefetchRowsAtIndexPaths) {
        self.prefetchRowsAtIndexPaths(indexPaths);
    }
}

// indexPaths that previously were considered as candidates for pre-fetching, but were not actually used; may be a subset of the previous call to -tableView:prefetchRowsAtIndexPaths:
- (void)tableView:(UITableView *)tableView cancelPrefetchingForRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    if (self.cancelPrefetchingForRowsAtIndexPaths) {
        self.cancelPrefetchingForRowsAtIndexPaths(indexPaths);
    }
}


@end
