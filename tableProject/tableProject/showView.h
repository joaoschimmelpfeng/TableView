//
//  showView.h
//  tableProject
//
//  Created by João Vitor dos Santos Schimmelpfeng on 25/02/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface showView : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@property (weak, nonatomic) IBOutlet UILabel *categoria;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property NSMutableArray *vetorDados;

- (IBAction)voltar:(id)sender;
@end
