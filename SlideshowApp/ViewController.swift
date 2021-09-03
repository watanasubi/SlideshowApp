import UIKit

class ViewController: UIViewController {

    let image = ["画像０","画像１","画像２","画像３","画像４","画像５","画像６","画像７"]

    //タイマー
    var timer:Timer?
    

    //タイマー用のカウンターのための変数
    var counter:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //selectorで指定された関数
    //次へを押した時の同じメソッドを代入しました
    
    @objc func play(_ timer: Timer) {
                        
        //カウンターに1足して次の画像を表示させる
            counter = counter + 1

        //現在用意している画像は8枚なので、カウンターが8より大きくなったら0になる
            if ( counter > 7 ) {
                counter = 0
            }
            imageView.image = UIImage(named:image[counter])   }

    

    @IBOutlet weak var buttonPlayPause: UIButton!
    
    @IBOutlet weak var buttonBack: UIButton!
    
    @IBOutlet weak var buttonNext: UIButton!

    //再生ボタンを押した時のメソッド

    @IBAction func buttonPlayPause(_ sender: Any) {
        if self.timer != nil {
            
            buttonBack.isEnabled = true    //戻るボタンタップ可
            buttonBack.setTitleColor(UIColor.blue, for: .normal)
            buttonNext.isEnabled = true    //次へボタンタップ可
                buttonNext.setTitleColor(UIColor.blue, for: .normal)

            buttonPlayPause.setTitle("再生", for: UIControl.State.normal)
                timer?.invalidate()
                timer = nil
            

            } else {
                
            buttonPlayPause.setTitle("停止", for: UIControl.State.normal)
                        
                
                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self,selector: #selector(play(_:)), userInfo: nil, repeats: true)
                
                buttonBack.isEnabled = false    //戻るボタンタップ不可
                buttonBack.setTitleColor(UIColor.lightGray, for: .normal)
                buttonNext.isEnabled = false    //次へボタンタップ不可
                buttonNext.setTitleColor(UIColor.lightGray, for: .normal)

            }
        }




    //戻るボタンを押した時のメソッド

    @IBAction func buttonBack(_ sender: Any) {
        counter = counter - 1

    //現在用意している画像が8枚なので、カウンターが0より小さくなったら7になる
        if (counter < 0) {
            counter = 7
        }
        
        imageView.image = UIImage(named:image[counter])
    }

    //進むボタンを押した時のメソッド
    
    @IBAction func buttonNext(_ sender: Any) {
    //カウンターに1足して次の画像を表示させる
        counter = counter + 1

    //現在用意している画像は8枚なので、カウンターが8より大きくなったら0になる
        if ( counter > 7 ) {
            counter = 0
        }
        imageView.image = UIImage(named:image[counter])
    }

    @IBOutlet weak var imageView: UIImageView!
    //UI Image View型で宣言した変数ImageView
    
    @IBAction func closeUp(_ sender: UIButton) {
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }

  

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       let closeUpViewController:CloseUpViewController = segue.destination as! CloseUpViewController
    
    //遷移先のCloseUpView Controllerで宣言しているimageに代入して渡す
    closeUpViewController.image = imageView.image

   }

   override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
       // Dispose of any resources that can be recreated.
   }
}
