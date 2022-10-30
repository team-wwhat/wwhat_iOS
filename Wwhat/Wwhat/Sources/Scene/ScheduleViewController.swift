import UIKit
import Then
import SnapKit

class ScheduleViewController: UIViewController {

    let label = UILabel().then {
        $0.text = "안녕"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        contentAddSubview()
        makeConstranints()
    }
    
    private func contentAddSubview() {
        view.addSubview(label)
    }
    
    private func makeConstranints() {
        label.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(view.snp.height)
        }
    }
}
