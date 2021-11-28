//
//  TableProtocol.h
//  YaoWang
//
//  Created by 出出 on 2019/7/11.
//  Copyright © 2019 JingLan. All rights reserved.
//

#ifndef TableProtocol_h
#define TableProtocol_h
@protocol LJScrollViewDelegate<NSObject>
@optional
- (void)lj_scrollViewWillBeginDragging:(UIScrollView *)scrollView;

- (void)lj_scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
- (void)lj_scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)lj_scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
- (void)lj_scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset;
- (void)lj_scrollViewDidScrollToTop:(UIScrollView *)scrollView;
@end

@protocol TableViewCellHandlerable;

@protocol  TableRowModelable<NSObject>

@property (nonatomic, copy) NSString *cellIdentifier;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, strong) id <TableViewCellHandlerable>handler;


@end

@protocol TableHeaderViewHandlerable, TableFooterViewHandlerable;

@protocol  TableSectionModelable<NSObject>

@property (nonatomic, copy) NSString *headerIdentifier;
@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, copy) NSString *footerIdentifier;
@property (nonatomic, assign) CGFloat footerHeight;

@property (nonatomic, strong) NSMutableArray <TableRowModelable>*rows;

@property (nonatomic, strong) id <TableHeaderViewHandlerable>headerHandler;
@property (nonatomic, strong) id <TableFooterViewHandlerable>footerHandler;


@end


@protocol  TableViewCellHandlerable<NSObject>

//- (void)updateCell:(UITableViewCell *)cell sectionModel:(id <TableSectionModelable>)sectionModel rowModel:(id <TableRowModelable >)rowModel  atIndexPath:(NSIndexPath *)indexPath;

@end

@protocol  TableHeaderViewHandlerable<NSObject>

- (void)updateHeaderView:(UITableViewHeaderFooterView *)headerView sectionModel:(id <TableSectionModelable>)sectionModel atSection:(NSInteger)section;

@end

@protocol  TableFooterViewHandlerable<NSObject>

- (void)updateFooterView:(UITableViewHeaderFooterView *)footerView sectionModel:(id <TableSectionModelable>)sectionModel atSection:(NSInteger)section;

@end

#endif /* TableProtocol_h */
