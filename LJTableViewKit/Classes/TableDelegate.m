//
//  YWTableDelegate.m
//  YaoWang
//
//  Created by 出出 on 2019/7/11.
//  Copyright © 2019 JingLan. All rights reserved.
//

#import "TableDelegate.h"

@interface TableDelegate()

@property (nonatomic, weak) NSMutableArray <TableSectionModelable>*dataSource;

@property (nonatomic, copy) void (^didSelectCell)(id <TableSectionModelable>sectionModel, id <TableRowModelable> rowModel, NSIndexPath *indexPath);

@property (nonatomic, copy) void (^header)(UITableViewHeaderFooterView *header, id<TableSectionModelable>sectionModel, NSInteger section);

@property (nonatomic, copy) void (^footer)(UITableViewHeaderFooterView *footer, id<TableSectionModelable>sectionModel, NSInteger section);

@end

@implementation TableDelegate

- (instancetype)initWithDataSource:(NSMutableArray <TableSectionModelable>*)dataSource
                     didSelectCell:(void (^)(id <TableSectionModelable>sectionModel, id <TableRowModelable> rowModel, NSIndexPath *indexPath))didSelectCell
                            header:(void (^)(UITableViewHeaderFooterView *headerView, id<TableSectionModelable>sectionModel, NSInteger section))header
                            footer:(void (^)(UITableViewHeaderFooterView *footerView, id<TableSectionModelable>sectionModel, NSInteger section))footer
{
    if ((self = [super init])) {
        
        _dataSource = dataSource;
        _didSelectCell = didSelectCell;
        _header = header;
        _footer = footer;
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataSource.count > 0) {
        if (self.cellHeight > 0)
        {
            return self.cellHeight;
        }
        id<TableSectionModelable> sectionModel = [self.dataSource safeObjectAtIndex:indexPath.section];
        id<TableRowModelable> rowModel = [sectionModel.rows safeObjectAtIndex:indexPath.row];
        if (isnan(rowModel.height)) {
            rowModel.height = 0;
        }
        return rowModel.height;
    } else {
        return 540;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.dataSource.count > 0) {
        if (self.headerHeight > 0)
        {
            return self.headerHeight;
        }
        id<TableSectionModelable> sectionModel = [self.dataSource safeObjectAtIndex:section];
        if (tableView.style == UITableViewStyleGrouped) {
            if (sectionModel.headerHeight <= 0) {
                sectionModel.headerHeight = 0.01;
            }
        }
        return sectionModel.headerHeight;
    } else {
        return 0.1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.dataSource.count > 0) {
        if (self.footerHeight > 0)
        {
            return self.footerHeight;
        }
        id<TableSectionModelable> sectionModel = [self.dataSource safeObjectAtIndex:section];
        if (tableView.style == UITableViewStyleGrouped) {
            if (sectionModel.footerHeight <= 0) {
                sectionModel.footerHeight = 0.01;
            }
        }
        return sectionModel.footerHeight;
    } else {
        return 0.1;
    }
}



// custom view for header. will be adjusted to default or specified header height

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.dataSource.count > 0) {
        id<TableSectionModelable> sectionModel = [self.dataSource safeObjectAtIndex:section];
        UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionModel.headerIdentifier];
        if (self.header)
        {
            self.header(headerView, sectionModel, section);
        }
        return headerView;
    } else {
        return [UIView new];
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (self.dataSource.count > 0) {
        id<TableSectionModelable> sectionModel = [self.dataSource safeObjectAtIndex:section];
        UITableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionModel.footerIdentifier];
        if (self.footer)
        {
            self.footer(footerView, sectionModel, section);
        }
        return footerView;
    } else {
        return [UIView new];
    }
}
// custom view for footer. will be adjusted to default or specified footer height

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataSource.count > 0) {
        id<TableSectionModelable> sectionModel = [self.dataSource safeObjectAtIndex:indexPath.section];
        id<TableRowModelable> rowModel = [sectionModel.rows safeObjectAtIndex:indexPath.row];
        
        if (self.didSelectCell)
        {
            self.didSelectCell(sectionModel, rowModel, indexPath);
        }
    }
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataSource.count > 0) {
        id<TableSectionModelable> sectionModel = [self.dataSource safeObjectAtIndex:indexPath.section];
        id<TableRowModelable> rowModel = [sectionModel.rows safeObjectAtIndex:indexPath.row];
        if (self.willDisplayCell)
        {
            self.willDisplayCell(cell,sectionModel, rowModel, indexPath);
        }
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataSource.count > 0) {
        id<TableSectionModelable> sectionModel = [self.dataSource safeObjectAtIndex:indexPath.section];
        id<TableRowModelable> rowModel = [sectionModel.rows safeObjectAtIndex:indexPath.row];
        //    NSLog(@"%s",__func__);
        if (self.didEndDisplayingCell)
        {
            self.didEndDisplayingCell(cell,sectionModel, rowModel, indexPath);
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.scrollViewDelegate && [self.scrollViewDelegate respondsToSelector:@selector(lj_scrollViewDidScroll:)]) {
        [self.scrollViewDelegate lj_scrollViewDidScroll:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.scrollViewDelegate && [self.scrollViewDelegate respondsToSelector:@selector(lj_scrollViewDidEndDecelerating:)]) {
        [self.scrollViewDelegate lj_scrollViewDidEndDecelerating:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    if (self.scrollViewDelegate && [self.scrollViewDelegate respondsToSelector:@selector(lj_scrollViewDidEndDragging:willDecelerate:)]) {
        [self.scrollViewDelegate lj_scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (self.scrollViewDelegate && [self.scrollViewDelegate respondsToSelector:@selector(lj_scrollViewWillEndDragging:withVelocity:targetContentOffset:)]) {
        [self.scrollViewDelegate lj_scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
    }
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.scrollViewDelegate && [self.scrollViewDelegate respondsToSelector:@selector(lj_scrollViewWillBeginDragging:)]) {
        [self.scrollViewDelegate lj_scrollViewWillBeginDragging:scrollView];
    }
}


- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    if (self.scrollViewDelegate && [self.scrollViewDelegate respondsToSelector:@selector(lj_scrollViewDidScrollToTop:)]) {
        [self.scrollViewDelegate lj_scrollViewDidScrollToTop:scrollView];
    }
}

@end
