//
//  ExampleViewController.m
//  AIMTableViewIndexBarExample
//
//  Created by Marek Kotewicz on 07.09.2013.
//  Copyright (c) 2013 AllInMobile. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "ExampleViewController.h"
#import "AIMTableViewIndexBar.h"

@interface ExampleViewController ()<
UITableViewDataSource,
UITableViewDelegate,
AIMTableViewIndexBarDelegate>{
    __weak IBOutlet AIMTableViewIndexBar    *indexBar;
    __weak IBOutlet UITableView             *plainTableView;
    
    NSArray *sections;
    NSArray *rows;
}

@end

@implementation ExampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    sections = @[@"A", @"D", @"F", @"M", @"N", @"O", @"Z"];
    
    rows = @[@[@"adam", @"alfred", @"ain", @"abdul", @"anastazja", @"angelica"],
             @[@"dennis" , @"deamon", @"destiny", @"dragon", @"dry", @"debug", @"drums"],
             @[@"Fredric", @"France", @"friends", @"family", @"fatish", @"funeral"],
             @[@"Mark", @"Madeline"],
             @[@"Nemesis", @"nemo", @"name"],
             @[@"Obama", @"Oprah", @"Omen", @"OMG OMG OMG", @"O-Zone", @"Ontario"],
             @[@"Zeus", @"Zebra", @"zed"]];
    
    indexBar.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    [indexBar setIndexes:sections]; // to always have exact number of sections in table and indexBar
    return [sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [rows[section] count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return sections[section];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"TableViewCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell.textLabel setText:rows[indexPath.section][indexPath.row]];
    return cell;
}

#pragma mark - AIMTableViewIndexBarDelegate

- (void)tableViewIndexBar:(AIMTableViewIndexBar *)indexBar didSelectSectionAtIndex:(NSInteger)index{
    if ([plainTableView numberOfSections] > index && index > -1){   // for safety, should always be YES
        [plainTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]
                              atScrollPosition:UITableViewScrollPositionTop
                                      animated:YES];
    }
}


@end







