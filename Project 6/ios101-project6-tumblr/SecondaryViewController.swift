import UIKit
import Nuke

class SecondaryViewController: UIViewController {
    
    var post: Post!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Showcase Page"
        updateUI()
    }
    
    func updateUI() {
        if let text = post?.caption.trimHTMLTags() {
            textView.text = text
        } else {
            textView.text = nil
        }
        
        if let image = post?.photos.first {
            let url = image.originalSize.url
            Nuke.loadImage(with: url, into: imageView)
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
