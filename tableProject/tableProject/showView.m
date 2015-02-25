//
//  showView.m
//  tableProject
//
//  Created by João Vitor dos Santos Schimmelpfeng on 25/02/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "showView.h"
#import "AppTableViewCell.h"
#import "tableViewController.h"
@interface showView ()

@end

@implementation showView
@synthesize titulo,categoria,imagem,vetorDados;

- (void)viewDidLoad {
    [super viewDidLoad];
    titulo.text = [vetorDados objectAtIndex:0];
    categoria.text = [vetorDados objectAtIndex:1];
    [imagem setImage:[vetorDados objectAtIndex:2]];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)voltar:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
