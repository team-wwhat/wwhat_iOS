import UIKit
import Then
import SnapKit

class ScheduleViewController: UIViewController {
    let today = Date()
    
    let dummyData = ["국어", "수학", "과학", "C++ 프로그래밍", "자료구조와 알고리즘", "체육", "창체"]
    
    private let lineView = UILabel().then {
        $0.layer.cornerRadius = 1
        $0.backgroundColor = .main
    }
    
    private let subLineView = UILabel().then {
        $0.layer.cornerRadius = 1
        $0.backgroundColor = .main
    }
    
    private let timeTitleLabel = UILabel().then {
        $0.textColor = UIColor.black
        $0.font = UIFont.title
        $0.text = "시간표"
    }
    
    private let dateLabel = UILabel().then {
        $0.textColor = UIColor.subText
        $0.font = UIFont.subText
    }
    
    private let scheduleTableView = UITableView().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .tableBackground
    }
    
    // MARK: - 요일 버튼들

    private let monButton = UIButton(type: .system).then {
        $0.setTitle("월", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.buttonText
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .white
    }
    
    private let tueButton = UIButton(type: .system).then {
        $0.setTitle("화", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.buttonText
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .white
    }
    
    private let wedButton = UIButton(type: .system).then {
        $0.setTitle("수", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.buttonText
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .white
    }
    
    private let thuButton = UIButton(type: .system).then {
        $0.setTitle("목", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.buttonText
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .white
    }
    
    private let friButton = UIButton(type: .system).then {
        $0.setTitle("금", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.buttonText
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .white
    }
    // ----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        contentAddSubview()
        makeConstranints()
        setDateText()
        tableViewDataSetting()
    }
    
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = scheduleTableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as? ScheduleTableViewCell else { return UITableViewCell() }
        
        cell.scheduleNumLabel.text = "\(indexPath.row + 1)"
        cell.scheduledeNameLabel.text = dummyData[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ScheduleViewController {
    
    private func tableViewDataSetting() {
        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
        scheduleTableView.allowsSelection = false
        scheduleTableView.showsVerticalScrollIndicator = false
        scheduleTableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: "scheduleCell")
    }
    
    private func setDateText() {
        dateLabel.text = today.TodayDate()
    }
    
    private func contentAddSubview() {
        [
            timeTitleLabel,
            dateLabel,
            scheduleTableView,
            lineView,
            subLineView,
            monButton,
            tueButton,
            wedButton,
            thuButton,
            friButton
        ].forEach({
            view.addSubview($0)
        })
    }
    
    private func makeConstranints() {
        timeTitleLabel.snp.makeConstraints {
            $0.leftMargin.equalTo(21)
            $0.topMargin.equalTo(71)
        }
        
        lineView.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.width.equalTo(38)
            $0.bottom.equalTo(timeTitleLabel.snp.top)
            $0.left.equalTo(timeTitleLabel.snp.left)
        }
        
        subLineView.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.width.equalTo(8)
            $0.bottom.equalTo(lineView.snp.bottom)
            $0.left.equalTo(lineView.snp.right).offset(2)
        }
        
        dateLabel.snp.makeConstraints {
            $0.left.equalTo(timeTitleLabel.snp.left)
            $0.top.equalTo(timeTitleLabel.snp.bottom).inset(8)
        }
        
        scheduleTableView.snp.makeConstraints {
            $0.width.equalToSuperview().inset(21)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(view.snp.height).dividedBy(view.frame.size.height > 800 ? 2.3 : 1.8)
        }
        
        monButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.right.equalTo(tueButton.snp.left).offset(-5)
            $0.bottom.equalTo(friButton.snp.bottom)
        }
        
        tueButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.right.equalTo(wedButton.snp.left).offset(-5)
            $0.bottom.equalTo(friButton.snp.bottom)
        }
        
        wedButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.right.equalTo(thuButton.snp.left).offset(-5)
            $0.bottom.equalTo(friButton.snp.bottom)
        }
        
        thuButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.right.equalTo(friButton.snp.left).offset(-5)
            $0.bottom.equalTo(friButton.snp.bottom)
        }
        
        friButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.rightMargin.equalTo(-21)
            $0.bottom.equalTo(scheduleTableView.snp.top).offset(-16)
        }
    }
}
