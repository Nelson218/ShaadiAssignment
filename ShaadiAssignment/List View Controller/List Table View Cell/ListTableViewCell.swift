//
//  ListTableViewCell.swift
//  ShaadiAssignment
//
//  Created by Nelson Thomas Pereira on 21/11/20.
//

import UIKit
import ShaadiLib

final class ListTableViewCell: UITableViewCell, ShaadiTableViewCellProtocol, NibLoadable {

    @IBOutlet private var innerContentView: UIView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var phoneLabel: UILabel!
    @IBOutlet private var websiteLabel: UILabel!
    @IBOutlet private var companyLabel: UILabel!
    @IBOutlet private var starButton: UIButton!
    private var user: User?
    private var ctaClicked: (() -> UIImage?)?

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        innerContentView.setRadius(radius: 10)
        innerContentView.setBorder(width: 2)
    }
    

    func prepare(shaadiViewModel: ShaadiViewProtocol) {
        
        guard let listViewModel = shaadiViewModel as? ListViewModel else { return }

        self.user = listViewModel.user
        self.nameLabel.attributedText = listViewModel.name
        self.phoneLabel.attributedText = listViewModel.phone
        self.websiteLabel.attributedText = listViewModel.website
        self.companyLabel.attributedText = listViewModel.companyName
        self.starButton.setImage(listViewModel.starImage, for: .normal)
        self.ctaClicked = listViewModel.onButtonClick
    }
}

extension ListTableViewCell {
    @IBAction private func buttonClicked() {
        self.starButton.setImage(ctaClicked?(), for: .normal)
    }
}

import SwiftUI
@available(iOS 13.0, *)
extension ListTableViewCell: UIViewRepresentable {
    typealias UIViewType = UIView

    func makeUIView(context: Context) -> UIView {
        let listTableViewCell = ListTableViewCell.fromNib
        listTableViewCell.prepare(shaadiViewModel: ListViewModel(user: .default))
        
        return listTableViewCell
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

import SwiftUI
@available(iOS 13.0, *)
struct ListTableViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ListTableViewCell().previewLayout(.fixed(width: 375, height: 200))
    }
}
