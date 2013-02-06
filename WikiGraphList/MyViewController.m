//
//  MyViewController.m
//  WikiGraphList
//
//  Created by Christopher Sadowski on 2/5/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MyViewController.h"
//#import "WikipediaHelper.h"

@interface MyViewController ()

@end

@implementation MyViewController
@synthesize Title;
@synthesize Search;
@synthesize arr;

- (void)searchDisplayController:(UISearchDisplayController *)controller didHideSearchResultsTableView:(UITableView *)tableView
{
    NSLog(@"end");
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    [searchBar resignFirstResponder];
}



- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar { 

    if(searchBar.text!=nil){
        self.Title.title = searchBar.text;
    }
    self.Title.title = searchBar.text;
    NSLog(@"end2");

    
    
    
    self.arr = [NSMutableArray array];
    
    
    
    
    
    WikipediaHelper *wikiHelper = [[WikipediaHelper alloc] init];
    wikiHelper.apiUrl = @"http://en.wikipedia.org";
    
    NSString *searchWord =  [    self.Title.title stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    ;
    
    NSString *htmlSource = [wikiHelper getWikipediaHTMLPage:searchWord];
    //NSLog(@"%@",htmlSource);
    //@"<a href=\"/wiki/[.]+\""
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<a href=.http:..en.wikipedia.org.wiki.[A-Za-z_]+\"" options:0 error:0];
    
    NSArray *matches = [regex matchesInString:htmlSource
                                      options:0
                                        range:NSMakeRange(0, [htmlSource length])];
    //NSLog([NSString stringWithFormat:@"%d", matches.count]);
    //[matches objectAtIndex:0]
    NSString* contentCopy = [htmlSource copy];
    NSMutableArray *cells = [[NSMutableArray alloc]init];
    for (NSTextCheckingResult* b in matches) // Loop through the URL list
    {
        NSString* url = [contentCopy substringWithRange:b.range];
        url = [url substringFromIndex:38];
        url = [url substringToIndex:([url length]-1)];
        [self.arr addObject:url];
        UITableViewCell *cell = [[UITableViewCell alloc]init]; 
        cell.textLabel.text = [NSString stringWithFormat:@"%@", url];
        [cells addObject:cell];
        
        
        NSLog(@"%@ + %d",url,arr.count);
    }
    
    
    
    
    
    
    self.Title.title = [    self.Title.title stringByReplacingOccurrencesOfString:@"_" withString:@" "];
    
    
    
    
    
    
    
    
    [self.tableView reloadData];
    
    
    
    
    
    
    
    
    
    
    
    
    
    NSLog(self.Title.title);
    [searchBar resignFirstResponder]; //move the keyboard out of the way
    //[searchBar removeFromSuperview];
    [self.view addSubview:Title.titleView];
    
        //Code....  
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    
    
    
    
    
        [super viewDidLoad];
    
    NSLog(@"testing");
    Search.showsCancelButton = YES;


    self.arr = [NSMutableArray array];
    Search.delegate = self;
    
    
    
    
    
    
    
    WikipediaHelper *wikiHelper = [[WikipediaHelper alloc] init];
    wikiHelper.apiUrl = @"http://en.wikipedia.org";
    
    NSString *searchWord = @"Philosophy";
    self.Title.title=searchWord;
    NSString *htmlSource = [wikiHelper getWikipediaHTMLPage:searchWord];
    //NSLog(@"%@",htmlSource);
    //@"<a href=\"/wiki/[.]+\""
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<a href=.http:..en.wikipedia.org.wiki.[A-Za-z_]+\"" options:0 error:0];
    
    NSArray *matches = [regex matchesInString:htmlSource
                                      options:0
                                        range:NSMakeRange(0, [htmlSource length])];
    //NSLog([NSString stringWithFormat:@"%d", matches.count]);
    //[matches objectAtIndex:0]
    NSString* contentCopy = [htmlSource copy];
    NSMutableArray *cells = [[NSMutableArray alloc]init];
    for (NSTextCheckingResult* b in matches) // Loop through the URL list
    {
        NSString* url = [contentCopy substringWithRange:b.range];
        url = [url substringFromIndex:38];
        url = [url substringToIndex:([url length]-1)];
        [self.arr addObject:url];
        UITableViewCell *cell = [[UITableViewCell alloc]init]; 
        cell.textLabel.text = [NSString stringWithFormat:@"%@", url];
        [cells addObject:cell];

        
        NSLog(@"%@ + %d",url,arr.count);
    }
    //Table.visibleCells = cells;
    //UITableViewDataSource *d = [[UITableViewDataSource alloc]init];
    //[Table.dataSource];
    //[Table beginUpdates];
    //[Table insertRowsAtIndexPaths:cells withRowAnimation:UITableViewRowAnimationFade];
    //[Table endUpdates];
    //for (NSTextCheckingResult* b in matches) // Loop through the URL list
    //{
    //    NSString* url = [contentCopy substringWithRange:b.range];
    //}
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setSearch:nil];
    [self setTitle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc] init];
    }
    if(arr.count > 0){
    cell.text = [arr objectAtIndex:indexPath.row];
    }
        cell.text= [cell.text stringByReplacingOccurrencesOfString:@"_" withString:@" "];
        //cell.textLabel.textAlignment
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    self.Title.title = [arr objectAtIndex:indexPath.row ];
        self.Title.title= [self.Title.title stringByReplacingOccurrencesOfString:@"_" withString:@" "];
    
    self.arr = [NSMutableArray array];
    
    
    
    
    
    WikipediaHelper *wikiHelper = [[WikipediaHelper alloc] init];
    wikiHelper.apiUrl = @"http://en.wikipedia.org";
    
    NSString *searchWord =[    self.Title.title stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    ;

    NSString *htmlSource = [wikiHelper getWikipediaHTMLPage:searchWord];
    //NSLog(@"%@",htmlSource);
    //@"<a href=\"/wiki/[.]+\""
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<a href=.http:..en.wikipedia.org.wiki.[A-Za-z_]+\"" options:0 error:0];
    
    NSArray *matches = [regex matchesInString:htmlSource
                                      options:0
                                        range:NSMakeRange(0, [htmlSource length])];
    //NSLog([NSString stringWithFormat:@"%d", matches.count]);
    //[matches objectAtIndex:0]
    NSString* contentCopy = [htmlSource copy];
    NSMutableArray *cells = [[NSMutableArray alloc]init];
    for (NSTextCheckingResult* b in matches) // Loop through the URL list
    {
        NSString* url = [contentCopy substringWithRange:b.range];
        url = [url substringFromIndex:38];
        url = [url substringToIndex:([url length]-1)];
        [self.arr addObject:url];
        UITableViewCell *cell = [[UITableViewCell alloc]init]; 
        cell.textLabel.text = [NSString stringWithFormat:@"%@", url];
        [cells addObject:cell];
        
        
        NSLog(@"%@ + %d",url,arr.count);
    }
    [self.tableView reloadData];

}

@end
