//
//  StarTableViewCell.swift
//  ShaadiAssignment
//
//  Created by Nelson Thomas Pereira on 21/11/20.
//

import UIKit
import ShaadiLib

final class StarTableViewCell: UITableViewCell, ShaadiTableViewCellProtocol {

    @IBOutlet private var starButton: UIButton!
    private var ctaClicked: (() -> UIImage?)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func prepare(shaadiViewModel: ShaadiViewProtocol) {
        guard let starViewModel = shaadiViewModel as? StarViewModel else { return }

        self.starButton.setImage(starViewModel.starImage, for: .normal)
        ctaClicked = starViewModel.onButtonClick
    }
    
    @IBAction private func buttonClicked() {
        self.starButton.setImage(ctaClicked?(), for: .normal)
    }
}
