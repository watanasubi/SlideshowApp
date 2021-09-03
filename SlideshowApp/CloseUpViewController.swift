//
//  CloseUpViewController.swift
//  SlideshowApp
//
//  Created by 加来　航 on 2021/09/03.
//

        
        import UIKit

        class CloseUpViewController: UIViewController {

            
            @IBOutlet weak var imageView: UIImageView!
            
            //受け取るためのプロパティを宣言しておく
            var image: UIImage!
            

            override func viewDidLoad() {
                super.viewDidLoad()

                imageView.image = self.image
                // Do any additional setup after loading the view.
            }

            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
            }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

