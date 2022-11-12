import UIKit
import SnapKit
import Then

class ScheduleTableViewCell: UITableViewCell {
    
    let scheduleNumLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.normalText
    }
    
    let scheduledeNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont.subText
    }
    
    override func layoutSubviews() {
        addView()
        makeconstraints()
        self.backgroundColor = .clear
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension ScheduleTableViewCell {
    private func addView() {
        [
            scheduleNumLabel,
            scheduledeNameLabel
        ].forEach({
            self.addSubview($0)
        })
    }
    
    private func makeconstraints() {
        scheduleNumLabel.snp.makeConstraints {
            $0.leftMargin.equalTo(22)
            $0.centerY.equalTo(self.snp.centerY).offset(10)
        }
        
        scheduledeNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(scheduleNumLabel.snp.centerY)
            $0.left.equalTo(scheduleNumLabel.snp.right).offset(25)
        }
    }
}
