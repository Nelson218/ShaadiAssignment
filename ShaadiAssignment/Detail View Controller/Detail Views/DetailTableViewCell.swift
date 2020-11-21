//
//  DetailTableViewCell.swift
//  ShaadiAssignment
//
//  Created by Nelson Thomas Pereira on 21/11/20.
//

import UIKit
import ShaadiLib

final class DetailTableViewCell: UITableViewCell, ShaadiTableViewCellProtocol, NibLoadable {

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func prepare(shaadiViewModel: ShaadiViewProtocol) {
        guard let detailViewModel = shaadiViewModel as? DetailViewModel else { return }

        self.titleLabel.text = detailViewModel.title
        self.detailLabel.text = detailViewModel.detail
    }
}

import SwiftUI
@available(iOS 13.0, *)
extension DetailTableViewCell: UIViewRepresentable {
    typealias UIViewType = UIView

    func makeUIView(context: Context) -> UIView {
        let detailTableViewCell = DetailTableViewCell.fromNib
        detailTableViewCell.prepare(shaadiViewModel: DetailViewModel(title: "User Name", detail: "Nelson's \nuser name"))
        
        return detailTableViewCell
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

import SwiftUI
@available(iOS 13.0, *)
struct DetailTableViewCell_Previews: PreviewProvider {
    static var previews: some View {
        DetailTableViewCell().previewLayout(.fixed(width: 375, height: 100))
    }
}
