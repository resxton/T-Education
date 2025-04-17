import UIKit

extension UILabel {
    func setStrikethroughText(
        _ text: String,
        textColor: UIColor = .label,
        strikethroughWidth: Int = 1
    ) {
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttributes([
            .strikethroughStyle: strikethroughWidth,
            .foregroundColor: textColor
        ], range: NSRange(location: 0, length: text.count))
        
        self.attributedText = attributedString
    }
}
