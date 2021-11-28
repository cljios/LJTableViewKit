//
//  TableSectionModel.m
//  YaoWang
//
//  Created by 出出 on 2019/7/11.
//  Copyright © 2019 JingLan. All rights reserved.
//

#import "TableSectionModel.h"

@implementation TableSectionModel

- (NSMutableArray<TableRowModelable> *)rows {
    if (!_rows) {
        
        _rows = (NSMutableArray<TableRowModelable> *)[[NSMutableArray alloc] init];
    }
    return _rows;
}

@end
